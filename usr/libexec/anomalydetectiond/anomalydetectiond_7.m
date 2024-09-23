void sub_10028D538(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void `virtual thunk to'CLKappaFeaturesAlgDataIntegrity::epochFinalize(CLKappaFeaturesAlgDataIntegrity *this, uint64_t a2)
{
  CLKappaFeaturesAlgDataIntegrity::epochFinalize((CLKappaFeaturesAlgDataIntegrity *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 48)), a2);
}

uint64_t CLKappaFeaturesAlgDataIntegrity::epochReset(CLKappaFeaturesAlgDataIntegrity *this)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 4) + 24))(*((_QWORD *)this + 4));
}

uint64_t `virtual thunk to'CLKappaFeaturesAlgDataIntegrity::epochReset(CLKappaFeaturesAlgDataIntegrity *this)
{
  uint64_t v1;

  v1 = *(_QWORD *)((char *)this + *(_QWORD *)(*(_QWORD *)this - 56) + 32);
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 24))(v1);
}

_QWORD *sub_10028D5B4(uint64_t a1, uint64_t *a2)
{
  return sub_10000A6A0((_QWORD *)(a1 + 48), a2);
}

_QWORD *sub_10028D5BC(_QWORD *a1, uint64_t *a2)
{
  return sub_10000A6A0((_QWORD *)((char *)a1 + *(_QWORD *)(*a1 - 32) + 48), a2);
}

void sub_10028D5D0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "Alg");
  v2 = (void *)qword_100387318;
  qword_100387318 = (uint64_t)v1;

}

void sub_10028D600(std::__shared_weak_count *this)
{
  this->__vftable = (std::__shared_weak_count_vtbl *)off_100364708;
  std::__shared_weak_count::~__shared_weak_count(this);
}

void sub_10028D614(std::__shared_weak_count *a1)
{
  a1->__vftable = (std::__shared_weak_count_vtbl *)off_100364708;
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

uint64_t sub_10028D648(uint64_t a1)
{
  return (**(uint64_t (***)(uint64_t))(a1 + 24))(a1 + 24);
}

double GPBCodedInputStreamReadDouble(_QWORD *a1)
{
  uint64_t v2;
  double result;

  sub_10028DB04(a1, 8);
  v2 = a1[2];
  result = *(double *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

float GPBCodedInputStreamReadFloat(_QWORD *a1)
{
  uint64_t v2;
  float result;

  sub_10028DB04(a1, 4);
  v2 = a1[2];
  result = *(float *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t GPBCodedInputStreamReadInt64_0(uint64_t *a1)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 0;
  v3 = 0;
  while (v2 <= 0x3F)
  {
    sub_10028DB04(a1, 1);
    v4 = *a1;
    v5 = a1[2];
    a1[2] = v5 + 1;
    LOBYTE(v4) = *(_BYTE *)(v4 + v5);
    v3 |= (v4 & 0x7F) << v2;
    v2 += 7;
    if ((v4 & 0x80) == 0)
      return v3;
  }
  sub_10028D980(-105, CFSTR("Invalid VarInt64"));
  return 0;
}

uint64_t GPBCodedInputStreamReadUInt32(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1);
}

uint64_t GPBCodedInputStreamReadInt32(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1);
}

uint64_t GPBCodedInputStreamReadFixed64(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  sub_10028DB04(a1, 8);
  v2 = a1[2];
  result = *(_QWORD *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t GPBCodedInputStreamReadFixed32(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  sub_10028DB04(a1, 4);
  v2 = a1[2];
  result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t GPBCodedInputStreamReadEnum(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1);
}

uint64_t GPBCodedInputStreamReadSFixed32(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  sub_10028DB04(a1, 4);
  v2 = a1[2];
  result = *(unsigned int *)(*a1 + v2);
  a1[2] = v2 + 4;
  return result;
}

uint64_t GPBCodedInputStreamReadSFixed64(_QWORD *a1)
{
  uint64_t v2;
  uint64_t result;

  sub_10028DB04(a1, 8);
  v2 = a1[2];
  result = *(_QWORD *)(*a1 + v2);
  a1[2] = v2 + 8;
  return result;
}

uint64_t GPBCodedInputStreamReadSInt32(uint64_t *a1)
{
  unsigned int Int64_0;

  Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  return -(Int64_0 & 1) ^ (Int64_0 >> 1);
}

unint64_t GPBCodedInputStreamReadSInt64(uint64_t *a1)
{
  unint64_t Int64_0;

  Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  return -(uint64_t)(Int64_0 & 1) ^ (Int64_0 >> 1);
}

BOOL GPBCodedInputStreamReadBool(uint64_t *a1)
{
  return GPBCodedInputStreamReadInt64_0(a1) != 0;
}

uint64_t GPBCodedInputStreamReadTag(uint64_t a1)
{
  uint64_t v2;
  uint64_t Int64_0;

  v2 = *(_QWORD *)(a1 + 16);
  if (v2 == *(_QWORD *)(a1 + 8) || v2 == *(_QWORD *)(a1 + 24))
  {
    Int64_0 = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
  else
  {
    Int64_0 = GPBCodedInputStreamReadInt64_0((uint64_t *)a1);
    *(_DWORD *)(a1 + 32) = Int64_0;
    if (!GPBWireFormatIsValidTag(Int64_0))
    {
      sub_10028D980(-103, CFSTR("Invalid wireformat in tag."));
      Int64_0 = *(unsigned int *)(a1 + 32);
    }
    if (!GPBWireFormatGetTagFieldNumber(Int64_0))
    {
      sub_10028D980(-103, CFSTR("A zero field number on the wire is invalid."));
      return *(unsigned int *)(a1 + 32);
    }
  }
  return Int64_0;
}

BOOL GPBCodedInputStreamIsAtEnd(_QWORD *a1)
{
  uint64_t v1;

  v1 = a1[2];
  return v1 == a1[1] || v1 == a1[3];
}

id sub_10028D980(uint64_t a1, void *a2)
{
  NSDictionary *v4;
  const __CFString *v6;
  NSError *v7;
  const __CFString *v8;
  void *v9;

  if (objc_msgSend(a2, "length"))
  {
    v8 = CFSTR("Reason");
    v9 = a2;
    v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  }
  else
  {
    v4 = 0;
  }
  v6 = CFSTR("GPBCodedInputStreamUnderlyingErrorKey");
  v7 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("GPBCodedInputStreamErrorDomain"), a1, v4);
  return -[NSException raise](+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", CFSTR("GPBCodedInputStreamException"), a2, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)), "raise");
}

const __CFString *GPBCodedInputStreamReadRetainedString(uint64_t *a1)
{
  int Int64_0;
  const __CFString *result;

  Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  if (!Int64_0)
    return &stru_100366D80;
  sub_10028DB04(a1, Int64_0);
  result = (const __CFString *)objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", *a1 + a1[2], Int64_0, 4);
  a1[2] += Int64_0;
  if (!result)
  {
    sub_10028D980(-104, 0);
    return 0;
  }
  return result;
}

_QWORD *sub_10028DB04(_QWORD *result, uint64_t a2)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;

  v2 = result;
  v3 = result[2] + a2;
  if (v3 > result[1])
    result = sub_10028D980(-100, 0);
  v4 = v2[3];
  if (v3 > v4)
  {
    v2[2] = v4;
    return sub_10028D980(-101, 0);
  }
  return result;
}

id GPBCodedInputStreamReadRetainedBytes(uint64_t *a1)
{
  unsigned int Int64_0;
  id result;

  Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  if ((Int64_0 & 0x80000000) != 0)
    return 0;
  sub_10028DB04(a1, Int64_0);
  result = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", *a1 + a1[2], Int64_0);
  a1[2] += Int64_0;
  return result;
}

id GPBCodedInputStreamReadRetainedBytesNoCopy(uint64_t *a1)
{
  unsigned int Int64_0;
  id result;

  Int64_0 = GPBCodedInputStreamReadInt64_0(a1);
  if ((Int64_0 & 0x80000000) != 0)
    return 0;
  sub_10028DB04(a1, Int64_0);
  result = objc_msgSend(objc_alloc((Class)NSData), "initWithBytesNoCopy:length:freeWhenDone:", *a1 + a1[2], Int64_0, 0);
  a1[2] += Int64_0;
  return result;
}

unint64_t GPBCodedInputStreamPushLimit(uint64_t a1, uint64_t a2)
{
  unint64_t v3;
  unint64_t v4;

  v3 = *(_QWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 16) + a2;
  if (v4 > v3)
    sub_10028D980(-102, 0);
  *(_QWORD *)(a1 + 24) = v4;
  return v3;
}

uint64_t GPBCodedInputStreamPopLimit(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 24) = a2;
  return result;
}

uint64_t GPBCodedInputStreamBytesUntilLimit(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24) - *(_QWORD *)(a1 + 16);
}

_DWORD *GPBCodedInputStreamCheckLastTagWas(_DWORD *result, int a2)
{
  if (result[8] != a2)
    return sub_10028D980(-103, CFSTR("Unexpected tag read"));
  return result;
}

SEL sub_10028F358(char *__s, char *str, const char *a3, int a4)
{
  size_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  size_t v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  const char *v17;
  char *v18;
  uint64_t v19;

  if (!__s && !a3 && (a4 & 1) == 0)
    return sel_getUid(str);
  if (__s)
    v9 = strlen(__s);
  else
    v9 = 0;
  v10 = strlen(str);
  v11 = v10;
  if (a3)
  {
    v10 = strlen(a3);
    v12 = v10;
  }
  else
  {
    v12 = 0;
  }
  v19 = (uint64_t)&v19;
  v13 = v11 + v9 + v12;
  v14 = 1;
  if (a4)
    v14 = 2;
  v15 = v13 + v14;
  __chkstk_darwin(v10);
  v17 = (char *)&v19 - v16;
  v18 = (char *)&v19 - v16;
  if (!__s)
  {
    memcpy(v18, str, v11);
    if (!a3)
      goto LABEL_16;
    goto LABEL_15;
  }
  memcpy(v18, __s, v9);
  memcpy((void *)&v17[v9], str, v11);
  v17[v9] = __toupper(v17[v9]);
  if (a3)
LABEL_15:
    memcpy((void *)&v17[v9 + v11], a3, v12);
LABEL_16:
  if (a4)
    v17[v13] = 58;
  v17[v15 - 1] = 0;
  return sel_getUid(v17);
}

uint64_t GPBFieldTag(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  int v3;
  int v4;
  int v5;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(unsigned __int16 *)(v1 + 28);
  if ((v2 & 0xF00) != 0)
  {
    v3 = 15;
    LOBYTE(v4) = 0;
  }
  else
  {
    v3 = *(unsigned __int8 *)(v1 + 30);
    v4 = (v2 >> 2) & 1;
  }
  v5 = GPBWireFormatForType(v3, v4);
  return GPBWireFormatMakeTag(*(_DWORD *)(v1 + 16), v5);
}

uint64_t GPBFieldAlternateTag(uint64_t a1)
{
  uint64_t v1;
  __int16 v2;
  int v3;

  v1 = *(_QWORD *)(a1 + 8);
  v2 = *(_WORD *)(v1 + 28);
  if ((v2 & 2) == 0)
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "uint32_t GPBFieldAlternateTag(GPBFieldDescriptor *)"), CFSTR("GPBDescriptor.m"), 456, CFSTR("Only valid on repeated fields"));
    v2 = *(_WORD *)(v1 + 28);
  }
  v3 = GPBWireFormatForType(*(unsigned __int8 *)(v1 + 30), (v2 & 4) == 0);
  return GPBWireFormatMakeTag(*(_DWORD *)(v1 + 16), v3);
}

void sub_100290134(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t GPBWireFormatMakeTag(int a1, int a2)
{
  return a2 | (8 * a1);
}

uint64_t GPBWireFormatGetTagWireType(char a1)
{
  return a1 & 7;
}

uint64_t GPBWireFormatGetTagFieldNumber(unsigned int a1)
{
  return a1 >> 3;
}

BOOL GPBWireFormatIsValidTag(int a1)
{
  return (~a1 & 6) != 0;
}

uint64_t GPBWireFormatForType(int a1, char a2)
{
  if ((a2 & 1) != 0)
    return 2;
  else
    return dword_1002EE0EC[a1];
}

_QWORD *GPBCreateMessageWithAutocreator(objc_class *a1, uint64_t a2, void *a3)
{
  _QWORD *v5;

  v5 = objc_alloc_init(a1);
  v5[4] = a2;
  v5[5] = a3;
  return v5;
}

BOOL GPBWasMessageAutocreatedBy(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

id GPBBecomeVisibleToAutocreator(_QWORD *a1)
{
  id result;
  uint64_t v3;

  result = (id)a1[4];
  if (result)
  {
    v3 = a1[5];
    if (v3)
      return (id)GPBSetObjectIvarWithFieldPrivate((uint64_t)result, v3, a1);
    else
      return objc_msgSend(result, "setExtension:value:", a1[6]);
  }
  return result;
}

id GPBAutocreatedArrayModified(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  _QWORD *v9;
  int *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)*((_QWORD *)objc_msgSend((id)objc_opt_class(a1), "descriptor") + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "fieldType") == 1
          && GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if (*(unsigned __int8 *)(v9[1] + 30) - 13 >= 4)
            v11 = &OBJC_IVAR___GPBInt32Array__autocreator;
          else
            v11 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
          *(_QWORD *)(a2 + *v11) = 0;
          return GPBBecomeVisibleToAutocreator(a1);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  return -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBAutocreatedArrayModified(GPBMessage *, id)"), CFSTR("GPBMessage.m"), 719, CFSTR("Unknown autocreated %@ for %@."), objc_opt_class(a2), a1);
}

id GPBAutocreatedDictionaryModified(_QWORD *a1, uint64_t a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  _QWORD *v9;
  int *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)*((_QWORD *)objc_msgSend((id)objc_opt_class(a1), "descriptor") + 1);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "fieldType") == 2
          && GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)v9) == a2)
        {
          if (objc_msgSend(v9, "mapKeyDataType") == 14
            && *(unsigned __int8 *)(v9[1] + 30) - 13 < 4)
          {
            v11 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
          }
          else
          {
            v11 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
          }
          *(_QWORD *)(a2 + *v11) = 0;
          return GPBBecomeVisibleToAutocreator(a1);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  return -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBAutocreatedDictionaryModified(GPBMessage *, id)"), CFSTR("GPBMessage.m"), 742, CFSTR("Unknown autocreated %@ for %@."), objc_opt_class(a2), a1);
}

void GPBClearMessageAutocreator(uint64_t a1)
{
  if (a1)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      *(_QWORD *)(a1 + 32) = 0;

      *(_QWORD *)(a1 + 40) = 0;
      *(_QWORD *)(a1 + 48) = 0;
    }
  }
}

void GPBPrepareReadOnlySemaphore(uint64_t a1)
{
  unint64_t *v1;
  NSObject *v3;

  v1 = (unint64_t *)(a1 + 56);
  if (!atomic_load((unint64_t *)(a1 + 56)))
  {
    v3 = dispatch_semaphore_create(1);
    while (!__ldaxr(v1))
    {
      if (!__stlxr((unint64_t)v3, v1))
        return;
    }
    __clrex();
    dispatch_release(v3);
  }
}

NSError *sub_10029103C(void *a1)
{
  NSError *result;
  id v3;
  NSDictionary *v4;
  const __CFString *v5;
  id v6;

  if (!objc_msgSend(objc_msgSend(a1, "name"), "isEqual:", CFSTR("GPBCodedInputStreamException"))
    || (result = (NSError *)objc_msgSend(objc_msgSend(a1, "userInfo"), "objectForKeyedSubscript:", CFSTR("GPBCodedInputStreamUnderlyingErrorKey"))) == 0)
  {
    v3 = objc_msgSend(a1, "reason");
    if (objc_msgSend(v3, "length"))
    {
      v5 = CFSTR("Reason");
      v6 = v3;
      v4 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1);
    }
    else
    {
      v4 = 0;
    }
    return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("GPBMessageErrorDomain"), -100, v4);
  }
  return result;
}

void sub_10029164C(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = objc_msgSend(a3, "copyWithZone:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, a2);

}

NSMutableDictionary *sub_100291718(void *a1, uint64_t a2)
{
  NSMutableDictionary *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD *v9;
  id v10;
  unsigned int v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  NSMutableDictionary *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  if (!objc_msgSend(a1, "count"))
    return 0;
  v4 = -[NSMutableDictionary initWithCapacity:](+[NSMutableDictionary allocWithZone:](NSMutableDictionary, "allocWithZone:", a2), "initWithCapacity:", objc_msgSend(a1, "count"));
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    v21 = *(_QWORD *)v29;
    v22 = v4;
    do
    {
      v8 = 0;
      v23 = v6;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(a1);
        v9 = *(_QWORD **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v8);
        v10 = objc_msgSend(a1, "objectForKey:", v9);
        v11 = *(unsigned __int8 *)(v9[1] + 44) - 15;
        if (objc_msgSend(v9, "isRepeated"))
        {
          if (v11 > 1)
          {
            v18 = objc_msgSend(v10, "mutableCopyWithZone:", a2);
            goto LABEL_20;
          }
          v12 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v25;
            do
            {
              for (i = 0; i != v14; i = (char *)i + 1)
              {
                if (*(_QWORD *)v25 != v15)
                  objc_enumerationMutation(v10);
                v17 = objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "copyWithZone:", a2);
                objc_msgSend(v12, "addObject:", v17);

              }
              v14 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
            }
            while (v14);
          }
          v4 = v22;
          -[NSMutableDictionary setObject:forKey:](v22, "setObject:forKey:", v12, v9);

          v7 = v21;
          v6 = v23;
        }
        else
        {
          if (v11 <= 1)
          {
            v18 = objc_msgSend(v10, "copyWithZone:", a2);
LABEL_20:
            v19 = v18;
            -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v18, v9);

            goto LABEL_22;
          }
          -[NSMutableDictionary setObject:forKey:](v4, "setObject:forKey:", v10, v9);
        }
LABEL_22:
        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      v6 = objc_msgSend(a1, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }
  return v4;
}

_QWORD *GPBGetObjectIvarWithField(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t *v5;
  _QWORD *v6;
  unint64_t v7;

  v4 = a2[1];
  if ((*(_WORD *)(v4 + 28) & 0xF02) != 0)
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id GPBGetObjectIvarWithField(GPBMessage *, GPBFieldDescriptor *)"), CFSTR("GPBMessage.m"), 3364, CFSTR("Shouldn't get here"));
    v4 = a2[1];
  }
  if (*(unsigned __int8 *)(v4 + 30) - 15 >= 2)
  {
    if (GPBGetHasIvar(a1, *(_DWORD *)(v4 + 20), *(_DWORD *)(v4 + 16)))
      return *(_QWORD **)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
    else
      return objc_msgSend(a2, "defaultValue");
  }
  else
  {
    v5 = (unint64_t *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(v4 + 24));
    v6 = (_QWORD *)atomic_load(v5);
    if (!v6)
    {
      v6 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      v6[4] = a1;
      v6[5] = a2;
      while (1)
      {
        v7 = __ldaxr(v5);
        if (v7)
          break;
        if (!__stlxr((unint64_t)v6, v5))
          return v6;
      }
      __clrex();
      GPBClearMessageAutocreator((uint64_t)v6);

      return (_QWORD *)v7;
    }
  }
  return v6;
}

void sub_10029221C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

_QWORD *sub_10029223C(_QWORD *result, _QWORD *a2, void *a3, _BYTE *a4)
{
  _QWORD *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  if (*(unsigned __int8 *)(a2[1] + 44) - 15 <= 1)
  {
    v6 = result;
    if (objc_msgSend(a2, "isRepeated"))
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (!result)
        return result;
      v7 = result;
      v8 = *(_QWORD *)v11;
LABEL_5:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(a3);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9), "isInitialized");
        if (!(_DWORD)result)
          break;
        if (v7 == (id)++v9)
        {
          result = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          v7 = result;
          if (result)
            goto LABEL_5;
          return result;
        }
      }
    }
    else
    {
      result = objc_msgSend(a3, "isInitialized");
      if ((result & 1) != 0)
        return result;
    }
    *(_BYTE *)(*(_QWORD *)(v6[4] + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t sub_100293218(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_opt_isKindOfClass(a1, objc_msgSend(a2, "containingMessageClass"));
  if ((result & 1) == 0)
    return (uint64_t)+[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("Extension %@ used on wrong class (%@ instead of %@)"), objc_msgSend(a2, "singletonName"), objc_opt_class(a1), objc_msgSend(a2, "containingMessageClass"));
  return result;
}

uint64_t sub_100293AF8(_QWORD *a1)
{
  uint64_t result;

  result = a1[1];
  if (!result)
  {
    a1[1] = objc_alloc_init(GPBUnknownFieldSet);
    GPBBecomeVisibleToAutocreator(a1);
    return a1[1];
  }
  return result;
}

uint64_t sub_100294204(_QWORD *a1, _QWORD *a2, int a3, uint64_t a4)
{
  int v5;
  uint64_t *v6;
  void *v7;
  int Int32;
  uint64_t Bool;
  double v10;
  uint64_t Enum;
  unint64_t v14;

  v5 = *(unsigned __int8 *)(a2[1] + 30);
  v6 = (uint64_t *)(a4 + 8);
  v7 = GPBGetMessageRepeatedField_0(a1, a2);
  Int32 = GPBCodedInputStreamReadInt32(v6);
  v14 = GPBCodedInputStreamPushLimit((uint64_t)v6, Int32);
  while (GPBCodedInputStreamBytesUntilLimit((uint64_t)v6))
  {
    switch(v5)
    {
      case 0:
        Bool = GPBCodedInputStreamReadBool(v6);
        goto LABEL_21;
      case 1:
        Bool = GPBCodedInputStreamReadFixed32(v6);
        goto LABEL_21;
      case 2:
        Bool = GPBCodedInputStreamReadSFixed32(v6);
        goto LABEL_21;
      case 3:
        *(float *)&v10 = GPBCodedInputStreamReadFloat(v6);
        objc_msgSend(v7, "addValue:", v10);
        break;
      case 4:
        Bool = GPBCodedInputStreamReadFixed64(v6);
        goto LABEL_21;
      case 5:
        Bool = GPBCodedInputStreamReadSFixed64(v6);
        goto LABEL_21;
      case 6:
        objc_msgSend(v7, "addValue:", GPBCodedInputStreamReadDouble(v6));
        break;
      case 7:
        Bool = GPBCodedInputStreamReadInt32(v6);
        goto LABEL_21;
      case 8:
        Bool = GPBCodedInputStreamReadInt64(v6);
        goto LABEL_21;
      case 9:
        Bool = GPBCodedInputStreamReadSInt32(v6);
        goto LABEL_21;
      case 10:
        Bool = GPBCodedInputStreamReadSInt64(v6);
        goto LABEL_21;
      case 11:
        Bool = GPBCodedInputStreamReadUInt32(v6);
        goto LABEL_21;
      case 12:
        Bool = GPBCodedInputStreamReadUInt64(v6);
LABEL_21:
        objc_msgSend(v7, "addValue:", Bool);
        break;
      case 13:
      case 14:
      case 15:
      case 16:
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void MergeRepeatedPackedFieldFromCodedInputStream(GPBMessage *, GPBFieldDescriptor *, GPBFileSyntax, GPBCodedInputStream *)"), CFSTR("GPBMessage.m"), 2288, CFSTR("Non primitive types can't be packed"));
        break;
      case 17:
        Enum = GPBCodedInputStreamReadEnum(v6);
        if (a3 == 3 || objc_msgSend(a2, "isValidEnumValue:", Enum))
          objc_msgSend(v7, "addRawValue:", Enum);
        else
          objc_msgSend((id)sub_100293AF8(a1), "mergeVarintField:value:", *(unsigned int *)(a2[1] + 16), Enum);
        break;
      default:
        break;
    }
  }
  return GPBCodedInputStreamPopLimit((uint64_t)v6, v14);
}

void sub_10029444C(_QWORD *a1, _QWORD *a2, int a3, uint64_t *a4, uint64_t a5)
{
  void *v10;
  uint64_t *v11;
  double Double;
  void *v13;
  void *RetainedBytes;
  void *v15;
  id v16;
  uint64_t Enum;
  id v18;

  v10 = GPBGetMessageRepeatedField_0(a1, a2);
  v11 = a4 + 1;
  switch(*(_BYTE *)(a2[1] + 30))
  {
    case 0:
      GPBCodedInputStreamReadBool(v11);
      goto LABEL_24;
    case 1:
      GPBCodedInputStreamReadFixed32(v11);
      goto LABEL_24;
    case 2:
      GPBCodedInputStreamReadSFixed32(v11);
      goto LABEL_24;
    case 3:
      *(float *)&Double = GPBCodedInputStreamReadFloat(v11);
      v13 = v10;
      goto LABEL_6;
    case 4:
      GPBCodedInputStreamReadFixed64(v11);
      goto LABEL_24;
    case 5:
      GPBCodedInputStreamReadSFixed64(v11);
      goto LABEL_24;
    case 6:
      Double = GPBCodedInputStreamReadDouble(v11);
      v13 = v10;
      goto LABEL_6;
    case 7:
      GPBCodedInputStreamReadInt32(v11);
      goto LABEL_24;
    case 8:
      GPBCodedInputStreamReadInt64(v11);
      goto LABEL_24;
    case 9:
      GPBCodedInputStreamReadSInt32(v11);
      goto LABEL_24;
    case 0xA:
      GPBCodedInputStreamReadSInt64(v11);
      goto LABEL_24;
    case 0xB:
      GPBCodedInputStreamReadUInt32(v11);
      goto LABEL_24;
    case 0xC:
      GPBCodedInputStreamReadUInt64(v11);
LABEL_24:
      v13 = v10;
LABEL_6:
      objc_msgSend(v13, "addValue:", Double);
      return;
    case 0xD:
      RetainedBytes = GPBCodedInputStreamReadRetainedBytes(v11);
      goto LABEL_26;
    case 0xE:
      RetainedBytes = (void *)GPBCodedInputStreamReadRetainedString(v11);
LABEL_26:
      v16 = RetainedBytes;
      v18 = RetainedBytes;
      v15 = v10;
      goto LABEL_27;
    case 0xF:
      v18 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      objc_msgSend(a4, "readMessage:extensionRegistry:", v18, a5);
      goto LABEL_16;
    case 0x10:
      v18 = objc_alloc_init((Class)objc_msgSend(a2, "msgClass"));
      objc_msgSend(a4, "readGroup:message:extensionRegistry:", *(unsigned int *)(a2[1] + 16), v18, a5);
LABEL_16:
      v15 = v10;
      v16 = v18;
LABEL_27:
      objc_msgSend(v15, "addObject:", v16);

      break;
    case 0x11:
      Enum = GPBCodedInputStreamReadEnum(v11);
      if (a3 == 3 || objc_msgSend(a2, "isValidEnumValue:", Enum))
        objc_msgSend(v10, "addRawValue:", Enum);
      else
        objc_msgSend((id)sub_100293AF8(a1), "mergeVarintField:value:", *(unsigned int *)(a2[1] + 16), Enum);
      break;
    default:
      return;
  }
}

void *GPBGetMessageMapField_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;

  v4 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)a2);
  if (!v4)
  {
    v4 = sub_10029702C(a2, 0);
    GPBSetRetainedObjectIvarWithFieldPrivate(a1, a2, v4);
  }
  return v4;
}

void *GPBGetMessageRepeatedField_0(_QWORD *a1, _QWORD *a2)
{
  void *v4;

  v4 = (void *)GPBGetObjectIvarWithFieldNoAutocreate((uint64_t)a1, (uint64_t)a2);
  if (!v4)
  {
    v4 = sub_100297650(a2, 0);
    GPBSetRetainedObjectIvarWithFieldPrivate(a1, a2, v4);
  }
  return v4;
}

void sub_100295E9C(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x3A0], 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100295F24(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeBoolSizeNoTag();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100295F5C(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeFixed32SizeNoTag();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100295F94(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeSFixed32SizeNoTag();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100295FCC(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeFloatSizeNoTag();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100296000(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeFixed64SizeNoTag();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100296038(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeSFixed64SizeNoTag();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100296070(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeDoubleSizeNoTag();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002960A4(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = GPBComputeInt32SizeNoTag(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002960DC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = GPBComputeInt64SizeNoTag(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100296114(uint64_t a1, int a2)
{
  uint64_t result;

  result = GPBComputeSInt32SizeNoTag(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_10029614C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = GPBComputeSInt64SizeNoTag(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_100296184(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = GPBComputeUInt32SizeNoTag(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002961BC(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = GPBComputeUInt64SizeNoTag(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002961F4(uint64_t a1, unsigned int a2)
{
  uint64_t result;

  result = GPBComputeEnumSizeNoTag(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

BOOL sub_100296CA0(uint64_t a1, uint64_t a2)
{
  return GPBGetHasIvar(a2, *(_DWORD *)(a1 + 32), *(_DWORD *)(a1 + 36));
}

_QWORD *sub_100296CB0(uint64_t a1, _QWORD *a2, int a3)
{
  uint64_t v5;

  if (a3)
  {
    v5 = objc_opt_class(a2);
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@: %@ can only be set to NO (to clear field)."), v5, NSStringFromSelector(*(SEL *)(*(_QWORD *)(a1 + 32) + 48)));
  }
  return GPBClearMessageField(a2, *(_QWORD *)(a1 + 32));
}

uint64_t sub_100296D44(uint64_t a1, uint64_t a2)
{
  return GPBGetHasOneof(a2, *(unsigned int *)(a1 + 32));
}

GPBAutocreatedArray *sub_100296D54(uint64_t a1, objc_class *a2)
{
  _QWORD *v2;
  unint64_t *v3;
  GPBAutocreatedArray *result;
  unint64_t v5;
  int *v6;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (unint64_t *)(*((_QWORD *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  result = (GPBAutocreatedArray *)atomic_load(v3);
  if (!result)
  {
    result = sub_100297650(v2, a2);
    while (1)
    {
      v5 = __ldaxr(v3);
      if (v5)
        break;
      if (!__stlxr((unint64_t)result, v3))
        return result;
    }
    __clrex();
    if (*(unsigned __int8 *)(v2[1] + 30) - 13 >= 4)
      v6 = &OBJC_IVAR___GPBInt32Array__autocreator;
    else
      v6 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
    *(Class *)((char *)&result->super.super.super.isa + *v6) = 0;

    return (GPBAutocreatedArray *)v5;
  }
  return result;
}

GPBAutocreatedDictionary *sub_100296E04(uint64_t a1, objc_class *a2)
{
  _QWORD *v2;
  unint64_t *v3;
  GPBAutocreatedDictionary *v4;
  GPBAutocreatedDictionary *v5;
  unint64_t v6;
  int *v7;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (unint64_t *)(*((_QWORD *)a2 + 8) + *(unsigned int *)(v2[1] + 24));
  v4 = (GPBAutocreatedDictionary *)atomic_load(v3);
  if (!v4)
  {
    v5 = sub_10029702C(*(_QWORD **)(a1 + 32), a2);
    v4 = v5;
    while (1)
    {
      v6 = __ldaxr(v3);
      if (v6)
        break;
      if (!__stlxr((unint64_t)v5, v3))
        return v4;
    }
    __clrex();
    if (objc_msgSend(v2, "mapKeyDataType") == 14
      && *(unsigned __int8 *)(v2[1] + 30) - 13 < 4)
    {
      v7 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
    }
    else
    {
      v7 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
    }
    *(Class *)((char *)&v4->super.super.super.isa + *v7) = 0;

    return (GPBAutocreatedDictionary *)v6;
  }
  return v4;
}

uint64_t sub_100296ED8(uint64_t a1, uint64_t a2, void *a3)
{
  return GPBSetObjectIvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100296EE8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)GPBGetObjectIvarWithFieldNoAutocreate(a2, *(_QWORD *)(a1 + 32)), "count");
}

GPBAutocreatedDictionary *sub_10029702C(_QWORD *a1, objc_class *a2)
{
  unsigned int v4;
  int v5;
  NSAssertionHandler *v6;
  NSString *v7;
  NSAssertionHandler *v8;
  uint64_t v9;
  GPBAutocreatedDictionary *result;
  __objc2_class *v11;
  NSAssertionHandler *v12;
  __objc2_class *v13;
  NSAssertionHandler *v14;
  NSAssertionHandler *v15;
  NSAssertionHandler *v16;
  NSAssertionHandler *v17;
  int *v18;
  NSAssertionHandler *v19;

  v4 = objc_msgSend(a1, "mapKeyDataType");
  v5 = *(unsigned __int8 *)(a1[1] + 30);
  switch(v4)
  {
    case 0u:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = GPBBoolBoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = GPBBoolUInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = GPBBoolInt32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = GPBBoolFloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = GPBBoolUInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = GPBBoolInt64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = GPBBoolDoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = GPBBoolObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v17 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
          v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)");
          v8 = v17;
          v9 = 307;
          goto LABEL_3;
        case 0x11:
          v13 = GPBBoolEnumDictionary;
          goto LABEL_81;
        default:
          goto LABEL_16;
      }
    case 1u:
    case 0xBu:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = GPBUInt32BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = GPBUInt32UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = GPBUInt32Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = GPBUInt32FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = GPBUInt32UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = GPBUInt32Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = GPBUInt32DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = GPBUInt32ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v15 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
          v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)");
          v8 = v15;
          v9 = 351;
          goto LABEL_3;
        case 0x11:
          v13 = GPBUInt32EnumDictionary;
          goto LABEL_81;
        default:
          goto LABEL_16;
      }
    case 2u:
    case 7u:
    case 9u:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = GPBInt32BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = GPBInt32UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = GPBInt32Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = GPBInt32FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = GPBInt32UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = GPBInt32Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = GPBInt32DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = GPBInt32ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v12 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
          v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)");
          v8 = v12;
          v9 = 396;
          goto LABEL_3;
        case 0x11:
          v13 = GPBInt32EnumDictionary;
          goto LABEL_81;
        default:
          goto LABEL_16;
      }
    case 3u:
    case 6u:
    case 0xDu:
    case 0xFu:
    case 0x10u:
    case 0x11u:
      v6 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
      v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)");
      v8 = v6;
      v9 = 543;
LABEL_3:
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](v8, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("GPBMessage.m"), v9, CFSTR("shouldn't happen"));
      result = 0;
      break;
    case 4u:
    case 0xCu:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = GPBUInt64BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = GPBUInt64UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = GPBUInt64Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = GPBUInt64FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = GPBUInt64UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = GPBUInt64Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = GPBUInt64DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = GPBUInt64ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v16 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
          v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)");
          v8 = v16;
          v9 = 440;
          goto LABEL_3;
        case 0x11:
          v13 = GPBUInt64EnumDictionary;
          goto LABEL_81;
        default:
          goto LABEL_16;
      }
    case 5u:
    case 8u:
    case 0xAu:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = GPBInt64BoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = GPBInt64UInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = GPBInt64Int32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = GPBInt64FloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = GPBInt64UInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = GPBInt64Int64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = GPBInt64DoubleDictionary;
          goto LABEL_72;
        case 0xD:
        case 0xE:
        case 0xF:
          v11 = GPBInt64ObjectDictionary;
          goto LABEL_72;
        case 0x10:
          v14 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
          v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)");
          v8 = v14;
          v9 = 485;
          goto LABEL_3;
        case 0x11:
          v13 = GPBInt64EnumDictionary;
          goto LABEL_81;
        default:
          goto LABEL_16;
      }
    case 0xEu:
      switch(*(_BYTE *)(a1[1] + 30))
      {
        case 0:
          v11 = GPBStringBoolDictionary;
          goto LABEL_72;
        case 1:
        case 0xB:
          v11 = GPBStringUInt32Dictionary;
          goto LABEL_72;
        case 2:
        case 7:
        case 9:
          v11 = GPBStringInt32Dictionary;
          goto LABEL_72;
        case 3:
          v11 = GPBStringFloatDictionary;
          goto LABEL_72;
        case 4:
        case 0xC:
          v11 = GPBStringUInt64Dictionary;
          goto LABEL_72;
        case 5:
        case 8:
        case 0xA:
          v11 = GPBStringInt64Dictionary;
          goto LABEL_72;
        case 6:
          v11 = GPBStringDoubleDictionary;
LABEL_72:
          result = (GPBAutocreatedDictionary *)objc_alloc_init(v11);
          if (a2)
            goto LABEL_73;
          return result;
        case 0xD:
        case 0xE:
        case 0xF:
          if (a2)
          {
            result = objc_alloc_init(GPBAutocreatedDictionary);
            goto LABEL_75;
          }
          result = (GPBAutocreatedDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          break;
        case 0x10:
          v19 = +[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler");
          v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "id CreateMapForField(GPBFieldDescriptor *, GPBMessage *)");
          v8 = v19;
          v9 = 532;
          goto LABEL_3;
        case 0x11:
          v13 = GPBStringEnumDictionary;
LABEL_81:
          result = (GPBAutocreatedDictionary *)objc_msgSend([v13 alloc], "initWithValidationFunction:", objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
          if (a2)
            goto LABEL_73;
          return result;
        default:
          goto LABEL_16;
      }
      break;
    default:
LABEL_16:
      result = 0;
      if (a2)
      {
LABEL_73:
        if (v4 == 14 && (v5 - 13) <= 3)
LABEL_75:
          v18 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
        else
          v18 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
        *(Class *)((char *)&result->super.super.super.isa + *v18) = a2;
      }
      break;
  }
  return result;
}

GPBAutocreatedArray *sub_100297650(_QWORD *a1, objc_class *a2)
{
  int v3;
  GPBAutocreatedArray *result;
  __objc2_class *v5;
  int *v6;

  v3 = *(unsigned __int8 *)(a1[1] + 30);
  switch(*(_BYTE *)(a1[1] + 30))
  {
    case 0:
      v5 = GPBBoolArray;
      goto LABEL_14;
    case 1:
    case 0xB:
      v5 = GPBUInt32Array;
      goto LABEL_14;
    case 2:
    case 7:
    case 9:
      v5 = GPBInt32Array;
      goto LABEL_14;
    case 3:
      v5 = GPBFloatArray;
      goto LABEL_14;
    case 4:
    case 0xC:
      v5 = GPBUInt64Array;
      goto LABEL_14;
    case 5:
    case 8:
    case 0xA:
      v5 = GPBInt64Array;
      goto LABEL_14;
    case 6:
      v5 = GPBDoubleArray;
LABEL_14:
      result = (GPBAutocreatedArray *)objc_alloc_init(v5);
      if (a2)
        goto LABEL_15;
      return result;
    case 0xD:
    case 0xE:
    case 0xF:
    case 0x10:
      if (!a2)
        return (GPBAutocreatedArray *)objc_alloc_init((Class)NSMutableArray);
      result = objc_alloc_init(GPBAutocreatedArray);
LABEL_16:
      v6 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
LABEL_18:
      *(Class *)((char *)&result->super.super.super.isa + *v6) = a2;
      return result;
    case 0x11:
      result = -[GPBEnumArray initWithValidationFunction:]([GPBEnumArray alloc], "initWithValidationFunction:", objc_msgSend(objc_msgSend(a1, "enumDescriptor"), "enumVerifier"));
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
      v6 = &OBJC_IVAR___GPBInt32Array__autocreator;
      goto LABEL_18;
  }
}

unint64_t sub_100297794(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageBoolField(a2, *(_QWORD **)(a1 + 32));
}

id sub_1002977A4(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt32Field(a2, *(_QWORD **)(a1 + 32));
}

id sub_1002977B4(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt32Field(a2, *(_QWORD **)(a1 + 32));
}

float sub_1002977C4(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageFloatField(a2, *(_QWORD **)(a1 + 32));
}

id sub_1002977D4(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt64Field(a2, *(_QWORD **)(a1 + 32));
}

id sub_1002977E4(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt64Field(a2, *(_QWORD **)(a1 + 32));
}

double sub_1002977F4(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageDoubleField(a2, *(_QWORD **)(a1 + 32));
}

id sub_100297804(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt32Field(a2, *(_QWORD **)(a1 + 32));
}

id sub_100297814(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt64Field(a2, *(_QWORD **)(a1 + 32));
}

id sub_100297824(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt32Field(a2, *(_QWORD **)(a1 + 32));
}

id sub_100297834(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageInt64Field(a2, *(_QWORD **)(a1 + 32));
}

id sub_100297844(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt32Field(a2, *(_QWORD **)(a1 + 32));
}

id sub_100297854(uint64_t a1, uint64_t a2)
{
  return GPBGetMessageUInt64Field(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_100297864(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_100297874(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_100297884(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(_QWORD **)(a1 + 32));
}

_QWORD *sub_100297894(uint64_t a1, uint64_t a2)
{
  return GPBGetObjectIvarWithField(a2, *(_QWORD **)(a1 + 32));
}

uint64_t sub_1002978A4(uint64_t a1, void *a2)
{
  return GPBGetMessageEnumField(a2, *(_QWORD **)(a1 + 32));
}

id sub_1002978B4(uint64_t a1, _QWORD *a2, int a3)
{
  return GPBSetBoolIvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1002978C4(uint64_t a1, _QWORD *a2, int a3)
{
  return GPBSetUInt32IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1002978D4(uint64_t a1, _QWORD *a2, int a3)
{
  return GPBSetInt32IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1002978E4(uint64_t a1, _QWORD *a2, float a3)
{
  return GPBSetFloatIvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_1002978F4(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return GPBSetUInt64IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297904(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return GPBSetInt64IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297914(uint64_t a1, _QWORD *a2, double a3)
{
  return GPBSetDoubleIvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297924(uint64_t a1, _QWORD *a2, int a3)
{
  return GPBSetInt32IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297934(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return GPBSetInt64IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297944(uint64_t a1, _QWORD *a2, int a3)
{
  return GPBSetInt32IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297954(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return GPBSetInt64IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297964(uint64_t a1, _QWORD *a2, int a3)
{
  return GPBSetUInt32IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297974(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return GPBSetUInt64IvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297984(uint64_t a1, _QWORD *a2, void *a3)
{
  return GPBSetRetainedObjectIvarWithFieldPrivate(a2, *(_QWORD **)(a1 + 32), objc_msgSend(a3, "copy"));
}

id sub_1002979B8(uint64_t a1, _QWORD *a2, void *a3)
{
  return GPBSetRetainedObjectIvarWithFieldPrivate(a2, *(_QWORD **)(a1 + 32), objc_msgSend(a3, "copy"));
}

uint64_t sub_1002979EC(uint64_t a1, uint64_t a2, void *a3)
{
  return GPBSetObjectIvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

uint64_t sub_1002979FC(uint64_t a1, uint64_t a2, void *a3)
{
  return GPBSetObjectIvarWithFieldPrivate(a2, *(_QWORD *)(a1 + 32), a3);
}

id sub_100297A0C(uint64_t a1, _QWORD *a2, uint64_t a3)
{
  return GPBSetEnumIvarWithFieldPrivate(a2, *(void **)(a1 + 32), a3);
}

void sub_100298138(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100298168(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = GPBComputeUInt64Size(*(_DWORD *)(a1 + 40), a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002981A0(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeFixed32Size(*(_DWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t sub_1002981D8(uint64_t a1)
{
  uint64_t result;

  result = GPBComputeFixed64Size(*(_DWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_100298678(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

id sub_1002986A4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%u\n"), a2);
}

id sub_1002986D0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("\t%llu\n"), a2);
}

uint64_t GPBEmptyNSData()
{
  if (qword_1003893C0 != -1)
    dispatch_once(&qword_1003893C0, &stru_100364BB8);
  return qword_1003893C8;
}

void sub_100298B4C(id a1)
{
  qword_1003893C8 = (uint64_t)objc_alloc_init((Class)NSData);
}

id GPBMessageDropUnknownFieldsRecursively(id result)
{
  NSMutableArray *v1;
  _QWORD *v2;
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  _QWORD *v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  unsigned int v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  if (result)
  {
    v1 = +[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", result);
    for (result = -[NSMutableArray count](v1, "count"); result; result = -[NSMutableArray count](v1, "count"))
    {
      v2 = -[NSMutableArray lastObject](v1, "lastObject");
      -[NSMutableArray removeLastObject](v1, "removeLastObject");
      objc_msgSend(v2, "setUnknownFields:", 0);
      v3 = objc_msgSend((id)objc_opt_class(v2), "descriptor");
      v36 = 0u;
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v4 = (void *)v3[1];
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v7)
              objc_enumerationMutation(v4);
            v9 = *(_QWORD **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            if (*(unsigned __int8 *)(v9[1] + 30) - 15 <= 1)
            {
              v10 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "fieldType");
              if (v10 == 2)
              {
                v15 = v2[8];
                if (v15)
                  v16 = *(void **)(v15 + *(unsigned int *)(v9[1] + 24));
                else
                  v16 = 0;
                switch(objc_msgSend(v9, "mapKeyDataType"))
                {
                  case 0u:
                    v35[0] = _NSConcreteStackBlock;
                    v35[1] = 3221225472;
                    v35[2] = sub_100299058;
                    v35[3] = &unk_100364BE0;
                    v35[4] = v1;
                    v17 = v35;
                    goto LABEL_33;
                  case 1u:
                  case 0xBu:
                    v34[0] = _NSConcreteStackBlock;
                    v34[1] = 3221225472;
                    v34[2] = sub_100299060;
                    v34[3] = &unk_100364C08;
                    v34[4] = v1;
                    v17 = v34;
                    goto LABEL_33;
                  case 2u:
                  case 7u:
                  case 9u:
                    v33[0] = _NSConcreteStackBlock;
                    v33[1] = 3221225472;
                    v33[2] = sub_100299068;
                    v33[3] = &unk_100364C30;
                    v33[4] = v1;
                    v17 = v33;
                    goto LABEL_33;
                  case 3u:
                  case 6u:
                  case 0xDu:
                  case 0xFu:
                  case 0x10u:
                  case 0x11u:
                    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBMessageDropUnknownFieldsRecursively(GPBMessage * _Nonnull)"), CFSTR("GPBUtilities.m"), 174, CFSTR("Aren't valid key types."));
                    continue;
                  case 4u:
                  case 0xCu:
                    v32[0] = _NSConcreteStackBlock;
                    v32[1] = 3221225472;
                    v32[2] = sub_100299070;
                    v32[3] = &unk_100364C58;
                    v32[4] = v1;
                    v17 = v32;
                    goto LABEL_33;
                  case 5u:
                  case 8u:
                  case 0xAu:
                    v31[0] = _NSConcreteStackBlock;
                    v31[1] = 3221225472;
                    v31[2] = sub_100299078;
                    v31[3] = &unk_100364C80;
                    v31[4] = v1;
                    v17 = v31;
                    goto LABEL_33;
                  case 0xEu:
                    v30[0] = _NSConcreteStackBlock;
                    v30[1] = 3221225472;
                    v30[2] = sub_100299080;
                    v30[3] = &unk_100364CA8;
                    v30[4] = v1;
                    v17 = v30;
LABEL_33:
                    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v17);
                    break;
                  default:
                    continue;
                }
              }
              else if (v10 == 1)
              {
                v13 = v2[8];
                if (v13)
                  v14 = *(void **)(v13 + *(unsigned int *)(v9[1] + 24));
                else
                  v14 = 0;
                if (objc_msgSend(v14, "count"))
                  -[NSMutableArray addObjectsFromArray:](v1, "addObjectsFromArray:", v14);
              }
              else if (!v10 && GPBGetHasIvar((uint64_t)v2, *(_DWORD *)(v9[1] + 20), *(_DWORD *)(v9[1] + 16)))
              {
                v11 = v2[8];
                if (v11)
                  v12 = *(_QWORD *)(v11 + *(unsigned int *)(v9[1] + 24));
                else
                  v12 = 0;
                -[NSMutableArray addObject:](v1, "addObject:", v12);
              }
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
        }
        while (v6);
      }
      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v18 = objc_msgSend(v2, "extensionsCurrentlySet", 0);
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v27;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(_QWORD *)v27 != v21)
              objc_enumerationMutation(v18);
            v23 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v23, "dataType") - 15 <= 1)
            {
              v24 = objc_msgSend(v23, "isRepeated");
              v25 = objc_msgSend(v2, "getExtension:", v23);
              if (v24)
                -[NSMutableArray addObjectsFromArray:](v1, "addObjectsFromArray:", v25);
              else
                -[NSMutableArray addObject:](v1, "addObject:", v25);
            }
          }
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v40, 16);
        }
        while (v20);
      }
    }
  }
  return result;
}

uint64_t GPBGetObjectIvarWithFieldNoAutocreate(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    return *(_QWORD *)(v2 + *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24));
  else
    return 0;
}

id sub_100299058(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100299060(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100299068(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100299070(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100299078(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id sub_100299080(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

id GPBCheckRuntimeVersionSupport(id result)
{
  if ((int)result >= 30005)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled needing at least %d!"), 30004, result);
  if ((int)result <= 30000)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Proto generation source compiled against runtime version %d, but this version of the runtime only supports back to %d!"), result, 30001);
  return result;
}

id GPBCheckRuntimeVersionInternal(id result)
{
  uint64_t v1;
  uint64_t v2;

  if ((_DWORD)result != 30001)
    return +[NSException raise:format:](NSException, "raise:format:", NSInternalInconsistencyException, CFSTR("Linked to ProtocolBuffer runtime version %d, but code compiled with version %d!"), 30001, result, v1, v2);
  return result;
}

BOOL GPBMessageHasFieldNumberSet(void *a1, uint64_t a2)
{
  return GPBMessageHasFieldSet((uint64_t)a1, (uint64_t)objc_msgSend(objc_msgSend(a1, "descriptor"), "fieldWithNumber:", a2));
}

BOOL GPBMessageHasFieldSet(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = 0;
  if (a1 && a2)
  {
    v3 = *(_QWORD *)(a2 + 8);
    if ((*(_WORD *)(v3 + 28) & 0xF02) == 0)
      return GPBGetHasIvar(a1, *(_DWORD *)(v3 + 20), *(_DWORD *)(v3 + 16));
    v4 = *(_QWORD *)(a1 + 64);
    if (v4)
      v5 = *(void **)(v4 + *(unsigned int *)(v3 + 24));
    else
      v5 = 0;
    return objc_msgSend(v5, "count") != 0;
  }
  return v2;
}

_QWORD *GPBClearMessageField(_QWORD *a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = (_QWORD *)GPBGetHasIvar((uint64_t)a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16));
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(a2 + 8);
    if ((*(_WORD *)(v5 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v5 + 30) - 13 <= 3)
    {
      v6 = a1[8];
      v7 = *(unsigned int *)(v5 + 24);

      *(_QWORD *)(v6 + v7) = 0;
    }
    return GPBSetHasIvar(a1, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16), 0);
  }
  return result;
}

_QWORD *GPBSetHasIvar(_QWORD *result, unsigned int a2, int a3, int a4)
{
  _QWORD *v6;
  uint64_t v7;
  unsigned int v8;
  int v9;
  int v10;
  int v12;

  v6 = result;
  if ((a2 & 0x80000000) != 0)
  {
    if (!a3)
      result = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBSetHasIvar(GPBMessage *, int32_t, uint32_t, BOOL)"), CFSTR("GPBUtilities.m"), 328, CFSTR("Invalid field number."));
    if (a4)
      v12 = a3;
    else
      v12 = 0;
    *(_DWORD *)(v6[8] + 4 * -a2) = v12;
  }
  else
  {
    if (a2 == 0x7FFFFFFF)
      result = -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBSetHasIvar(GPBMessage *, int32_t, uint32_t, BOOL)"), CFSTR("GPBUtilities.m"), 332, CFSTR("Invalid has bit."));
    v7 = v6[8];
    v8 = a2 >> 5;
    v9 = 1 << a2;
    if (a4)
      v10 = *(_DWORD *)(v7 + 4 * v8) | v9;
    else
      v10 = *(_DWORD *)(v7 + 4 * v8) & ~v9;
    *(_DWORD *)(v7 + 4 * v8) = v10;
  }
  return result;
}

_QWORD *GPBClearOneof(_QWORD *a1, id *a2)
{
  return sub_100299444(a1, a2, *(unsigned int *)(*((_QWORD *)objc_msgSend(a2[2], "objectAtIndexedSubscript:", 0) + 1) + 20), 0);
}

_QWORD *sub_100299444(_QWORD *a1, void *a2, uint64_t a3, int a4)
{
  unsigned int v5;
  _QWORD *result;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v5 = a3;
  result = (_QWORD *)GPBGetHasOneof((uint64_t)a1, a3);
  if ((_DWORD)result != a4)
  {
    v9 = result;
    if ((_DWORD)result)
    {
      v10 = objc_msgSend(a2, "fieldWithNumber:", result);
      if (v10)
      {
        v11 = v10[1];
        if ((*(_WORD *)(v11 + 28) & 0xF02) != 0 || *(unsigned __int8 *)(v11 + 30) - 13 <= 3)
        {
          v12 = a1[8];
          v13 = *(unsigned int *)(v11 + 24);

          *(_QWORD *)(v12 + v13) = 0;
        }
      }
      else
      {
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBMaybeClearOneofPrivate(GPBMessage *, GPBOneofDescriptor *, int32_t, uint32_t)"), CFSTR("GPBUtilities.m"), 359, CFSTR("%@: oneof set to something (%u) not in the oneof?"), objc_opt_class(a1), v9);
      }
      return GPBSetHasIvar(a1, v5, 1, 0);
    }
  }
  return result;
}

BOOL GPBGetHasIvar(uint64_t a1, unsigned int a2, int a3)
{
  if (*(_QWORD *)(a1 + 64))
  {
    if ((a2 & 0x80000000) == 0)
    {
LABEL_3:
      if (a2 == 0x7FFFFFFF)
        -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL GPBGetHasIvar(GPBMessage *, int32_t, uint32_t)"), CFSTR("GPBUtilities.m"), 309, CFSTR("Invalid has bit."));
      return (*(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * (a2 >> 5)) >> a2) & 1;
    }
  }
  else
  {
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL GPBGetHasIvar(GPBMessage *, int32_t, uint32_t)"), CFSTR("GPBUtilities.m"), 303, CFSTR("%@: All messages should have storage (from init)"), objc_opt_class(a1));
    if ((a2 & 0x80000000) == 0)
      goto LABEL_3;
  }
  if (!a3)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL GPBGetHasIvar(GPBMessage *, int32_t, uint32_t)"), CFSTR("GPBUtilities.m"), 305, CFSTR("Invalid field number."));
  return *(_DWORD *)(*(_QWORD *)(a1 + 64) + 4 * -a2) == a3;
}

uint64_t GPBGetHasOneof(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = a2;
  if ((a2 & 0x80000000) == 0)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "uint32_t GPBGetHasOneof(GPBMessage *, int32_t)"), CFSTR("GPBUtilities.m"), 320, CFSTR("%@: invalid index (%d) for oneof."), objc_opt_class(a1), a2);
  return *(unsigned int *)(*(_QWORD *)(a1 + 64) - 4 * v2);
}

void GPBClearAutocreatedMessageIvarWithField(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  if (!GPBGetHasIvar(a1, *(_DWORD *)(*(_QWORD *)(a2 + 8) + 20), *(_DWORD *)(*(_QWORD *)(a2 + 8) + 16)))
  {
    v4 = *(_QWORD *)(a1 + 64);
    v5 = *(unsigned int *)(*(_QWORD *)(a2 + 8) + 24);
    v6 = *(_QWORD *)(v4 + v5);
    v7 = (id)v6;
    *(_QWORD *)(v4 + v5) = 0;
    GPBClearMessageAutocreator(v6);

  }
}

uint64_t GPBSetObjectIvarWithFieldPrivate(uint64_t a1, uint64_t a2, void *a3)
{
  return GPBSetRetainedObjectIvarWithFieldPrivate(a1, a2, a3);
}

id GPBSetRetainedObjectIvarWithFieldPrivate(_QWORD *a1, _QWORD *a2, void *a3)
{
  uint64_t v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  if (!a1[8])
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBSetRetainedObjectIvarWithFieldPrivate(GPBMessage *, GPBFieldDescriptor *, id)"), CFSTR("GPBUtilities.m"), 553, CFSTR("%@: All messages should have storage (from init)"), objc_opt_class(a1));
  v6 = a2[1];
  v7 = *(unsigned __int8 *)(v6 + 30);
  v8 = *(_WORD *)(v6 + 28);
  if ((v8 & 0xF02) != 0)
  {
    v9 = a1[8];
    v10 = *(unsigned int *)(v6 + 24);
    v11 = *(char **)(v9 + v10);
    *(_QWORD *)(v9 + v10) = a3;
    if (v11)
    {
      if (objc_msgSend(a2, "fieldType") == 1)
      {
        if ((v7 - 13) <= 3)
        {
          v12 = objc_opt_class(GPBAutocreatedArray);
          if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
          {
            v13 = &OBJC_IVAR___GPBAutocreatedArray__autocreator;
            goto LABEL_24;
          }
LABEL_26:

          return GPBBecomeVisibleToAutocreator(a1);
        }
        v13 = &OBJC_IVAR___GPBInt32Array__autocreator;
      }
      else if (objc_msgSend(a2, "mapKeyDataType") == 14 && (v7 - 13) <= 3)
      {
        v18 = objc_opt_class(GPBAutocreatedDictionary);
        if ((objc_opt_isKindOfClass(v11, v18) & 1) == 0)
          goto LABEL_26;
        v13 = &OBJC_IVAR___GPBAutocreatedDictionary__autocreator;
      }
      else
      {
        v13 = &OBJC_IVAR___GPBInt32Int32Dictionary__autocreator;
      }
LABEL_24:
      v19 = *v13;
      if (*(_QWORD **)&v11[v19] == a1)
        *(_QWORD *)&v11[v19] = 0;
      goto LABEL_26;
    }
  }
  else
  {
    v14 = (void *)a2[2];
    if (v14)
    {
      sub_100299444(a1, v14, *(unsigned int *)(v6 + 20), *(_DWORD *)(v6 + 16));
      v8 = *(_WORD *)(v6 + 28);
    }
    v15 = a3 != 0;
    if ((v8 & 0x20) != 0 && !objc_msgSend(a3, "length"))
    {

      v15 = 0;
      a3 = 0;
    }
    GPBSetHasIvar(a1, *(_DWORD *)(v6 + 20), *(_DWORD *)(v6 + 16), v15);
    v16 = a1[8];
    v17 = *(unsigned int *)(v6 + 24);
    v11 = *(char **)(v16 + v17);
    *(_QWORD *)(v16 + v17) = a3;
    if (v11)
    {
      if ((v7 - 15) <= 1 && GPBWasMessageAutocreatedBy((uint64_t)v11, (uint64_t)a1))
        GPBClearMessageAutocreator((uint64_t)v11);
      goto LABEL_26;
    }
  }
  return GPBBecomeVisibleToAutocreator(a1);
}

uint64_t GPBGetMessageEnumField(void *a1, _QWORD *a2)
{
  id v4;

  v4 = GPBGetMessageInt32Field((uint64_t)a1, a2);
  if (objc_msgSend(objc_msgSend(objc_msgSend(a1, "descriptor"), "file"), "syntax") == 3)
  {
    if (objc_msgSend(a2, "isValidEnumValue:", v4))
      return v4;
    else
      return 4222467823;
  }
  return (uint64_t)v4;
}

id GPBGetMessageInt32Field(uint64_t a1, _QWORD *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return (id)*(unsigned int *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

id GPBSetEnumIvarWithFieldPrivate(_QWORD *a1, void *a2, uint64_t a3)
{
  if ((objc_msgSend(a2, "isValidEnumValue:") & 1) == 0)
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("%@.%@: Attempt to set an unknown enum value (%d)"), objc_opt_class(a1), objc_msgSend(a2, "name"), a3);
  return GPBSetInt32IvarWithFieldPrivate(a1, (uint64_t)a2, a3);
}

id GPBSetInt32IvarWithFieldPrivate(_QWORD *a1, uint64_t a2, int a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_100299444(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);
  return GPBBecomeVisibleToAutocreator(a1);
}

unint64_t GPBGetMessageBoolField(uint64_t a1, _QWORD *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 24), *(_DWORD *)(a2[1] + 16));
  else
    return (unint64_t)objc_msgSend(a2, "defaultValue") & 1;
}

_QWORD *GPBSetMessageBoolField(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetBoolIvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

id GPBSetBoolIvarWithFieldPrivate(_QWORD *a1, uint64_t a2, int a3)
{
  uint64_t v5;
  void *v6;
  int v7;

  v5 = *(_QWORD *)(a2 + 8);
  v6 = *(void **)(a2 + 16);
  if (v6)
    sub_100299444(a1, v6, *(unsigned int *)(v5 + 20), *(_DWORD *)(v5 + 16));
  GPBSetHasIvar(a1, *(_DWORD *)(v5 + 24), *(_DWORD *)(v5 + 16), a3);
  v7 = (a3 & 1) != 0 || (*(_WORD *)(v5 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v5 + 20), *(_DWORD *)(v5 + 16), v7);
  return GPBBecomeVisibleToAutocreator(a1);
}

_QWORD *GPBSetMessageInt32Field(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetInt32IvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

id GPBGetMessageUInt32Field(uint64_t a1, _QWORD *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return (id)*(unsigned int *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

_QWORD *GPBSetMessageUInt32Field(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetUInt32IvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

id GPBSetUInt32IvarWithFieldPrivate(_QWORD *a1, uint64_t a2, int a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_100299444(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_DWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);
  return GPBBecomeVisibleToAutocreator(a1);
}

id GPBGetMessageInt64Field(uint64_t a1, _QWORD *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(id *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

_QWORD *GPBSetMessageInt64Field(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetInt64IvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

id GPBSetInt64IvarWithFieldPrivate(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_100299444(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_QWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);
  return GPBBecomeVisibleToAutocreator(a1);
}

id GPBGetMessageUInt64Field(uint64_t a1, _QWORD *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(id *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return objc_msgSend(a2, "defaultValue");
}

_QWORD *GPBSetMessageUInt64Field(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetUInt64IvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

id GPBSetUInt64IvarWithFieldPrivate(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  _BOOL4 v8;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_100299444(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(_QWORD *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  if (a3)
    v8 = 1;
  else
    v8 = (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);
  return GPBBecomeVisibleToAutocreator(a1);
}

float GPBGetMessageFloatField(uint64_t a1, _QWORD *a2)
{
  float result;

  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(float *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  LODWORD(result) = objc_msgSend(a2, "defaultValue");
  return result;
}

_QWORD *GPBSetMessageFloatField(_QWORD *a1, uint64_t a2, float a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetFloatIvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

id GPBSetFloatIvarWithFieldPrivate(_QWORD *a1, uint64_t a2, float a3)
{
  void *v6;
  uint64_t v7;
  int v8;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_100299444(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(float *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);
  return GPBBecomeVisibleToAutocreator(a1);
}

double GPBGetMessageDoubleField(uint64_t a1, _QWORD *a2)
{
  if (GPBGetHasIvar(a1, *(_DWORD *)(a2[1] + 20), *(_DWORD *)(a2[1] + 16)))
    return *(double *)(*(_QWORD *)(a1 + 64) + *(unsigned int *)(a2[1] + 24));
  else
    return COERCE_DOUBLE(objc_msgSend(a2, "defaultValue"));
}

_QWORD *GPBSetMessageDoubleField(_QWORD *a1, uint64_t a2, double a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetDoubleIvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

id GPBSetDoubleIvarWithFieldPrivate(_QWORD *a1, uint64_t a2, double a3)
{
  void *v6;
  uint64_t v7;
  int v8;

  v6 = *(void **)(a2 + 16);
  v7 = *(_QWORD *)(a2 + 8);
  if (v6)
    sub_100299444(a1, v6, *(unsigned int *)(v7 + 20), *(_DWORD *)(v7 + 16));
  *(double *)(a1[8] + *(unsigned int *)(v7 + 24)) = a3;
  v8 = a3 != 0.0 || (*(_WORD *)(v7 + 28) & 0x20) == 0;
  GPBSetHasIvar(a1, *(_DWORD *)(v7 + 20), *(_DWORD *)(v7 + 16), v8);
  return GPBBecomeVisibleToAutocreator(a1);
}

_QWORD *GPBSetMessageStringField(_QWORD *result, _QWORD *a2, void *a3)
{
  if (result)
  {
    if (a2)
      return GPBSetRetainedObjectIvarWithFieldPrivate(result, a2, objc_msgSend(a3, "copy"));
  }
  return result;
}

_QWORD *GPBSetMessageBytesField(_QWORD *result, _QWORD *a2, void *a3)
{
  if (result)
  {
    if (a2)
      return GPBSetRetainedObjectIvarWithFieldPrivate(result, a2, objc_msgSend(a3, "copy"));
  }
  return result;
}

_QWORD *GPBSetMessageGroupField_0(_QWORD *result, _QWORD *a2, void *a3)
{
  if (result)
  {
    if (a2)
      return GPBSetRetainedObjectIvarWithFieldPrivate(result, a2, a3);
  }
  return result;
}

char *GPBMessageEncodingForSelector(const char *a1, BOOL a2)
{
  Protocol *Protocol;
  objc_method_description MethodDescription;
  BOOL v6;

  Protocol = objc_getProtocol("GPBMessageSignatureProtocol");
  if (!Protocol)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "const char *GPBMessageEncodingForSelector(SEL, BOOL)"), CFSTR("GPBUtilities.m"), 1555, CFSTR("Missing GPBMessageSignatureProtocol"));
  MethodDescription = protocol_getMethodDescription(Protocol, a1, 0, a2);
  if (MethodDescription.name)
    v6 = MethodDescription.types == 0;
  else
    v6 = 1;
  if (v6)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "const char *GPBMessageEncodingForSelector(SEL, BOOL)"), CFSTR("GPBUtilities.m"), 1559, CFSTR("Missing method for selector %@"), NSStringFromSelector(a1));
  return MethodDescription.types;
}

__CFString *GPBTextFormatForMessage(void *a1, __CFString *a2)
{
  __CFString *v2;
  __CFString *v4;

  v2 = &stru_100366D80;
  if (a1)
  {
    if (a2)
      v4 = a2;
    else
      v4 = &stru_100366D80;
    v2 = (__CFString *)+[NSMutableString string](NSMutableString, "string");
    sub_10029A5E4(a1, v2, v4);
  }
  return v2;
}

id sub_10029A5E4(void *a1, void *a2, __CFString *a3)
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
  _BOOL4 HasIvar;
  void *v22;
  unint64_t v23;
  uint64_t v24;
  NSString *v25;
  const __CFString *v26;
  unsigned int v27;
  int v28;
  NSString *v29;
  NSString *v30;
  NSString *v31;
  const char *v32;
  NSString *v33;
  uint64_t v34;
  int v35;
  const char *v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD *v41;
  unsigned int v42;
  float v43;
  double v44;
  _QWORD *v45;
  _QWORD *v46;
  id v47;
  void *v48;
  _QWORD *v49;
  const __CFString *v50;
  id v51;
  id v52;
  __CFString *v53;
  id result;
  uint64_t v55;
  NSString *v56;
  __CFString *v57;
  id v58;
  _QWORD *v59;
  char *v60;
  char *v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  _QWORD *v65;
  _QWORD *v66;
  void **v67;
  uint64_t v68;
  id (*v69)(uint64_t, void *, void *);
  void *v70;
  void *v71;
  NSString *v72;
  NSString *v73;
  NSString *v74;
  NSString *v75;
  __CFString *v76;
  NSString *v77;
  NSString *v78;
  _QWORD *v79;
  char v80;
  char v81;
  _QWORD v82[3];
  char v83;

  v6 = objc_msgSend(a1, "descriptor");
  v64 = (void *)v6[1];
  v7 = (char *)objc_msgSend(v64, "count");
  v8 = objc_msgSend(v6, "extensionRanges");
  v9 = objc_msgSend(v6, "extensionRangesCount");
  v66 = a1;
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
    v58 = v10;
    v59 = v8;
    v60 = v7;
    v62 = v9;
    v57 = a3;
    do
    {
      if (v14 == v7)
      {
        sub_10029B770(v66, v12, v8[v13], a2, a3);
        v14 = v7;
        ++v13;
        continue;
      }
      if (v13 != v15)
      {
        v16 = objc_msgSend(v64, "objectAtIndexedSubscript:", v14);
        v17 = &v8[v13];
        if (*(_DWORD *)(v16[1] + 16) >= *(_DWORD *)v17)
        {
          ++v13;
          sub_10029B770(v66, v12, *v17, a2, a3);
          continue;
        }
      }
      v18 = v14 + 1;
      v65 = objc_msgSend(v64, "objectAtIndexedSubscript:", v14);
      v19 = objc_msgSend(v65, "fieldType");
      v20 = v19;
      if (v19 == 2 || v19 == 1)
      {
        v63 = v13;
        v24 = v66[8];
        if (v24)
          v22 = *(void **)(v24 + *(unsigned int *)(v65[1] + 24));
        else
          v22 = 0;
        v23 = (unint64_t)objc_msgSend(v22, "count");
        if (v23)
          goto LABEL_21;
      }
      else
      {
        if (v19)
        {
          ++v14;
          v15 = v62;
          continue;
        }
        v63 = v13;
        HasIvar = GPBGetHasIvar((uint64_t)v66, *(_DWORD *)(v65[1] + 20), *(_DWORD *)(v65[1] + 16));
        v22 = 0;
        v23 = HasIvar;
        if (HasIvar)
        {
LABEL_21:
          v25 = (NSString *)objc_msgSend(v65, "textFormatName");
          if (-[NSString length](v25, "length"))
          {
            v26 = &stru_100366D80;
          }
          else
          {
            v25 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), *(unsigned int *)(v65[1] + 16));
            if (v23 < 2)
            {
              v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("  # %@"), objc_msgSend(v65, "name"));
            }
            else
            {
              objc_msgSend(a2, "appendFormat:", CFSTR("%@# %@\n"), a3, objc_msgSend(v65, "name"));
              v26 = &stru_100366D80;
            }
          }
          v61 = v18;
          if (v20 == 2)
          {
            v27 = objc_msgSend(v65, "mapKeyDataType");
            v28 = *(unsigned __int8 *)(v65[1] + 30);
            v56 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ {%@\n"), a3, v25, v26);
            v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@ {\n"), a3, v25);
            v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@}\n"), a3);
            v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  key: "), a3);
            v32 = ":";
            if ((v28 - 15) < 2)
              v32 = "";
            v33 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@  value%s "), a3, v32);
            v82[0] = 0;
            v82[1] = v82;
            v82[2] = 0x2020000000;
            v83 = 1;
            if (v27 == 14 && (v28 - 13) <= 3)
            {
              v67 = _NSConcreteStackBlock;
              v68 = 3221225472;
              v69 = sub_10029BCE8;
              v70 = &unk_100364D20;
              v71 = a2;
              v72 = v56;
              v73 = v29;
              v74 = v31;
              LOBYTE(v79) = v28;
              v75 = v33;
              v76 = a3;
              v77 = v30;
              v78 = (NSString *)v82;
              objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", &v67);
              v14 = v18;
            }
            else
            {
              v67 = _NSConcreteStackBlock;
              v68 = 3221225472;
              v69 = sub_10029BE68;
              v70 = &unk_100364D48;
              v78 = v30;
              v79 = v82;
              v71 = a2;
              v72 = v56;
              v80 = v27;
              v73 = v29;
              v74 = v31;
              v81 = v28;
              v75 = v33;
              v76 = a3;
              v77 = (NSString *)v65;
              objc_msgSend(v22, "enumerateForTextFormat:", &v67);
              v14 = v18;
            }
            _Block_object_dispose(v82, 8);
            v8 = v59;
            v7 = v60;
            v12 = v58;
            v15 = v62;
            v13 = v63;
            continue;
          }
          v34 = 0;
          v35 = *(unsigned __int8 *)(v65[1] + 30);
          if ((v35 - 15) >= 2)
            v36 = ":";
          else
            v36 = "";
          do
          {
            objc_msgSend(a2, "appendFormat:", CFSTR("%@%@%s "), a3, v25, v36);
            switch(v35)
            {
              case 0:
                if (v22)
                  v42 = objc_msgSend(v22, "valueAtIndex:", v34);
                else
                  v42 = GPBGetMessageBoolField((uint64_t)v66, v65);
                if (v42)
                  v50 = CFSTR("true");
                else
                  v50 = CFSTR("false");
                objc_msgSend(a2, "appendString:", v50);
                break;
              case 1:
              case 11:
                if (v22)
                  v39 = objc_msgSend(v22, "valueAtIndex:", v34);
                else
                  v39 = GPBGetMessageUInt32Field((uint64_t)v66, v65);
                objc_msgSend(a2, "appendFormat:", CFSTR("%u"), v39, v55);
                break;
              case 2:
              case 7:
              case 9:
                if (v22)
                  v37 = objc_msgSend(v22, "valueAtIndex:", v34);
                else
                  v37 = GPBGetMessageInt32Field((uint64_t)v66, v65);
                objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v37, v55);
                break;
              case 3:
                if (v22)
                  objc_msgSend(v22, "valueAtIndex:", v34);
                else
                  v43 = GPBGetMessageFloatField((uint64_t)v66, v65);
                objc_msgSend(a2, "appendFormat:", CFSTR("%.*g"), 6, v43);
                break;
              case 4:
              case 12:
                if (v22)
                  v40 = objc_msgSend(v22, "valueAtIndex:", v34);
                else
                  v40 = GPBGetMessageUInt64Field((uint64_t)v66, v65);
                objc_msgSend(a2, "appendFormat:", CFSTR("%llu"), v40, v55);
                break;
              case 5:
              case 8:
              case 10:
                if (v22)
                  v38 = objc_msgSend(v22, "valueAtIndex:", v34);
                else
                  v38 = GPBGetMessageInt64Field((uint64_t)v66, v65);
                objc_msgSend(a2, "appendFormat:", CFSTR("%lld"), v38, v55);
                break;
              case 6:
                if (v22)
                  objc_msgSend(v22, "valueAtIndex:", v34);
                else
                  v44 = GPBGetMessageDoubleField((uint64_t)v66, v65);
                objc_msgSend(a2, "appendFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&v44);
                break;
              case 13:
                if (v22)
                  v45 = objc_msgSend(v22, "objectAtIndex:", v34);
                else
                  v45 = GPBGetObjectIvarWithField((uint64_t)v66, v65);
                sub_10029B26C(v45, a2);
                break;
              case 14:
                if (v22)
                  v46 = objc_msgSend(v22, "objectAtIndex:", v34);
                else
                  v46 = GPBGetObjectIvarWithField((uint64_t)v66, v65);
                sub_10029BB64(v46, a2);
                break;
              case 15:
              case 16:
                if (v22)
                  v41 = objc_msgSend(v22, "objectAtIndex:", v34);
                else
                  v41 = GPBGetObjectIvarWithField((uint64_t)v66, v65);
                v49 = v41;
                objc_msgSend(a2, "appendFormat:", CFSTR("{%@\n"), v26);
                sub_10029A5E4(v49, a2, -[__CFString stringByAppendingString:](a3, "stringByAppendingString:", CFSTR("  ")));
                objc_msgSend(a2, "appendFormat:", CFSTR("%@}"), a3);
                v26 = &stru_100366D80;
                break;
              case 17:
                if (v22)
                {
                  v47 = objc_msgSend(v22, "rawValueAtIndex:", v34);
                  v48 = v65;
                }
                else
                {
                  v48 = v65;
                  v47 = GPBGetMessageInt32Field((uint64_t)v66, v65);
                }
                v51 = objc_msgSend(v48, "enumDescriptor");
                if (v51 && (v52 = objc_msgSend(v51, "textFormatNameForValue:", v47)) != 0)
                  objc_msgSend(a2, "appendString:", v52);
                else
                  objc_msgSend(a2, "appendFormat:", CFSTR("%d"), v47);
                a3 = v57;
                break;
              default:
                break;
            }
            objc_msgSend(a2, "appendFormat:", CFSTR("%@\n"), v26);
            ++v34;
          }
          while (v23 != v34);
          v7 = v60;
          v14 = v61;
          v12 = v58;
          v8 = v59;
          goto LABEL_89;
        }
      }
      v14 = v18;
LABEL_89:
      v15 = v62;
      v13 = v63;
    }
    while (v14 < v7 || v13 < v15);
  }
  v53 = GPBTextFormatForUnknownFieldSet(objc_msgSend(v66, "unknownFields"), a3);
  result = -[__CFString length](v53, "length");
  if (result)
  {
    objc_msgSend(a2, "appendFormat:", CFSTR("%@# --- Unknown fields ---\n"), a3);
    return objc_msgSend(a2, "appendString:", v53);
  }
  return result;
}

void sub_10029AE28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

__CFString *GPBTextFormatForUnknownFieldSet(void *a1, const __CFString *a2)
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

  v2 = &stru_100366D80;
  if (a1)
  {
    v4 = a2 ? (__CFString *)a2 : &stru_100366D80;
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
          v41[2] = sub_10029B1C4;
          v41[3] = &unk_100364CD0;
          v41[4] = v2;
          v41[5] = v4;
          v42 = (int)v7;
          objc_msgSend(v8, "enumerateValuesWithBlock:", v41);
          v9 = objc_msgSend(v6, "fixed32List");
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_10029B1FC;
          v39[3] = &unk_100364CF8;
          v39[4] = v2;
          v39[5] = v4;
          v40 = (int)v7;
          objc_msgSend(v9, "enumerateValuesWithBlock:", v39);
          v10 = objc_msgSend(v6, "fixed64List");
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_10029B234;
          v37[3] = &unk_100364CD0;
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
                sub_10029B26C(v16, v2);
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
                -[__CFString appendString:](v2, "appendString:", GPBTextFormatForUnknownFieldSet(v22, -[__CFString stringByAppendingString:](v4, "stringByAppendingString:", CFSTR("  "))));
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

id sub_10029B1C4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: %llu\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_10029B1FC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%X\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_10029B234(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%d: 0x%llX\n"), *(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), a2);
}

id sub_10029B26C(void *a1, void *a2)
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

NSString *GPBDecodeTextFormatName(char *a1, int a2, void *a3)
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
    v6 = sub_10029B5F0(&v23);
    if (v6 < 1)
    {
      return 0;
    }
    else
    {
      v7 = v6;
      while (1)
      {
        v8 = sub_10029B5F0(&v23);
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

uint64_t sub_10029B5F0(char **a1)
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

_QWORD *GPBSetInt32IvarWithFieldInternal(_QWORD *a1, uint64_t a2, int a3)
{
  if (a1)
  {
    if (a2)
      return GPBSetInt32IvarWithFieldPrivate(a1, a2, a3);
  }
  return a1;
}

_QWORD *GPBMaybeClearOneof(_QWORD *a1, void *a2, uint64_t a3)
{
  return sub_100299444(a1, a2, a3, 0);
}

BOOL GPBClassHasSel(objc_class *a1, const char *a2)
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

id sub_10029B770(void *a1, void *a2, uint64_t a3, void *a4, void *a5)
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
              v16 = &stru_100366D80;
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
                sub_10029B26C(v19, a4);
                break;
              case 0xEu:
                sub_10029BB64(v19, a4);
                break;
              case 0xFu:
              case 0x10u:
                objc_msgSend(a4, "appendFormat:", CFSTR("{%@\n"), v16);
                sub_10029A5E4(v19, a4, objc_msgSend(a5, "stringByAppendingString:", CFSTR("  ")));
                objc_msgSend(a4, "appendFormat:", CFSTR("%@}"), a5);
                v16 = &stru_100366D80;
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

id sub_10029BB64(void *a1, void *a2)
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

id sub_10029BCE8(uint64_t a1, void *a2, void *a3)
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
  sub_10029BB64(a2, *(void **)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 64));
  v8 = *(unsigned __int8 *)(a1 + 96);
  switch(v8)
  {
    case 13:
      sub_10029B26C(a3, *(void **)(a1 + 32));
      break;
    case 15:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      sub_10029A5E4(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      break;
    case 14:
      sub_10029BB64(a3, *(void **)(a1 + 32));
      break;
    default:
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void AppendTextFormatForMapMessageField(id, GPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke"), CFSTR("GPBUtilities.m"), 1672, CFSTR("Can't happen"));
      break;
  }
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 80));
}

id sub_10029BE68(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;

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
    sub_10029BB64(a2, *(void **)(a1 + 32));
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
      sub_10029B26C(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xE:
      sub_10029BB64(a3, *(void **)(a1 + 32));
      goto LABEL_18;
    case 0xF:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("{\n"));
      sub_10029A5E4(a3, *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(a1 + 72), "stringByAppendingString:", CFSTR("    ")));
      objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@  }"), *(_QWORD *)(a1 + 72));
      goto LABEL_18;
    case 0x10:
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void AppendTextFormatForMapMessageField(id, GPBFieldDescriptor *, NSMutableString *, NSString *, NSString *, NSString *)_block_invoke_2"), CFSTR("GPBUtilities.m"), 1731, CFSTR("Can't happen"));
      goto LABEL_16;
    case 0x11:
      v9 = objc_msgSend(a3, "intValue");
      v10 = objc_msgSend(*(id *)(a1 + 80), "enumDescriptor");
      if (v10 && (v11 = objc_msgSend(v10, "textFormatNameForValue:", v9)) != 0)
      {
        v12 = v11;
        v13 = *(void **)(a1 + 32);
LABEL_17:
        objc_msgSend(v13, "appendString:", v12);
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%d"), v9);
      }
LABEL_18:
      objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("\n"));
      return objc_msgSend(*(id *)(a1 + 32), "appendString:", *(_QWORD *)(a1 + 88));
    default:
LABEL_16:
      v13 = *(void **)(a1 + 32);
      v12 = a3;
      goto LABEL_17;
  }
}

GPBFileDescriptor *sub_10029C108()
{
  GPBFileDescriptor *result;

  result = (GPBFileDescriptor *)qword_100389400;
  if (!qword_100389400)
  {
    result = -[GPBFileDescriptor initWithPackage:objcPrefix:syntax:]([GPBFileDescriptor alloc], "initWithPackage:objcPrefix:syntax:", CFSTR("CSHWProto"), CFSTR("CSHWProto"), 2);
    qword_100389400 = (uint64_t)result;
  }
  return result;
}

unint64_t CSHWProtoValue_ValueType_EnumDescriptor()
{
  id v1;

  if (!atomic_load(&qword_1003893E0))
  {
    v1 = +[GPBEnumDescriptor allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:](GPBEnumDescriptor, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:", CFSTR("CSHWProtoValue_ValueType"), "ValueTypeNull", &unk_1002EE384, 4, CSHWProtoValue_ValueType_IsValidValue, &unk_1002EE394);
    while (!__ldaxr(&qword_1003893E0))
    {
      if (!__stlxr((unint64_t)v1, &qword_1003893E0))
        return atomic_load(&qword_1003893E0);
    }
    __clrex();

  }
  return atomic_load(&qword_1003893E0);
}

BOOL CSHWProtoValue_ValueType_IsValidValue(int a1)
{
  return (a1 - 1) < 4;
}

void sub_10029C480(uint64_t a1, void *a2, void *a3)
{
  id v4;

  v4 = objc_msgSend(a2, "copy");
  objc_msgSend(a3, "addField:", v4);

}

int sub_10029C760(id a1, const void *a2, const void *a3)
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

int sub_10029C8AC(id a1, const void *a2, const void *a3)
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

id sub_10029C974(uint64_t a1, void *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend(a2, "serializedSize");
  *a3 += result;
  return result;
}

id sub_10029C9BC(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeAsMessageSetExtensionToOutput:");
}

id sub_10029C9FC(uint64_t a1, void *a2, _QWORD *a3)
{
  id result;

  result = objc_msgSend(a2, "serializedSizeAsMessageSetExtension");
  *a3 += result;
  return result;
}

void sub_10029CBE8(uint64_t a1, void *a2, void *a3)
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
    objc_msgSend(v6, "mergeFromField:", a2);
  }
  else
  {
    v7 = objc_msgSend(a2, "copy");
    objc_msgSend(a3, "addField:", v7);

  }
}

uint64_t GPBDictionaryComputeSizeInternalHelper(void *a1, uint64_t a2)
{
  unsigned int v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(a2 + 8) + 30);
  v5 = objc_msgSend(a1, "keyEnumerator");
  v6 = objc_msgSend(v5, "nextObject");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    do
    {
      v9 = objc_msgSend(a1, "objectForKeyedSubscript:", v7);
      v10 = GPBComputeStringSize(1, v7);
      v11 = &v10[(_QWORD)sub_10029D150(v9, v4)];
      v8 += (uint64_t)&v11[GPBComputeRawVarint32SizeForInteger(v11)];
      v7 = objc_msgSend(v5, "nextObject");
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v12 = GPBComputeWireFormatTagSize(*(_DWORD *)(*(_QWORD *)(a2 + 8) + 16), 15);
  return v8 + (_QWORD)objc_msgSend(a1, "count") * v12;
}

char *sub_10029D150(void *a1, unsigned int a2)
{
  switch(a2)
  {
    case 0xDu:
      return GPBComputeBytesSize(2, a1);
    case 0xEu:
      return GPBComputeStringSize(2, a1);
    case 0xFu:
      return GPBComputeMessageSize(2, a1);
  }
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictObjectFieldSize(id, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 312, CFSTR("Unexpected type %d"), a2);
  return 0;
}

id GPBDictionaryWriteToStreamInternalHelper(void *a1, void *a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t Tag;
  id v9;
  id result;
  void *v11;
  id v12;
  unsigned int v13;

  if (objc_msgSend(a3, "mapKeyDataType") != 14)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBDictionaryWriteToStreamInternalHelper(GPBCodedOutputStream *, NSDictionary *, GPBFieldDescriptor *)"), CFSTR("GPBDictionary.m"), 351, CFSTR("Unexpected key type"));
  v6 = a3[1];
  v7 = *(unsigned __int8 *)(v6 + 30);
  Tag = GPBWireFormatMakeTag(*(_DWORD *)(v6 + 16), 2);
  v9 = objc_msgSend(a2, "keyEnumerator");
  result = objc_msgSend(v9, "nextObject");
  if (result)
  {
    v11 = result;
    do
    {
      v12 = objc_msgSend(a2, "objectForKeyedSubscript:", v11);
      objc_msgSend(a1, "writeInt32NoTag:", Tag);
      v13 = GPBComputeStringSize(1, v11);
      objc_msgSend(a1, "writeInt32NoTag:", sub_10029D150(v12, v7) + v13);
      objc_msgSend(a1, "writeString:value:", 1, v11);
      sub_10029D360(a1, (uint64_t)v12, v7);
      result = objc_msgSend(v9, "nextObject");
      v11 = result;
    }
    while (result);
  }
  return result;
}

id sub_10029D360(void *a1, uint64_t a2, unsigned int a3)
{
  switch(a3)
  {
    case 0xDu:
      return objc_msgSend(a1, "writeBytes:value:", 2, a2);
    case 0xEu:
      return objc_msgSend(a1, "writeString:value:", 2, a2);
    case 0xFu:
      return objc_msgSend(a1, "writeMessage:value:", 2, a2);
  }
  return -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictObjectField(GPBCodedOutputStream *, id, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 325, CFSTR("Unexpected type %d"), a3);
}

BOOL GPBDictionaryIsInitializedInternalHelper(void *a1, _QWORD *a2)
{
  id v4;
  id v5;
  id v6;

  if (objc_msgSend(a2, "mapKeyDataType") != 14)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL GPBDictionaryIsInitializedInternalHelper(NSDictionary *, GPBFieldDescriptor *)"), CFSTR("GPBDictionary.m"), 372, CFSTR("Unexpected key type"));
  if (*(_BYTE *)(a2[1] + 30) != 15)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "BOOL GPBDictionaryIsInitializedInternalHelper(NSDictionary *, GPBFieldDescriptor *)"), CFSTR("GPBDictionary.m"), 373, CFSTR("Unexpected value type"));
  v4 = objc_msgSend(a1, "objectEnumerator");
  do
  {
    v5 = objc_msgSend(v4, "nextObject");
    v6 = v5;
  }
  while (v5 && (objc_msgSend(v5, "isInitialized") & 1) != 0);
  return v6 == 0;
}

void GPBDictionaryReadEntry(void *a1, uint64_t *a2, uint64_t a3, _QWORD *a4, void *a5)
{
  id v10;
  int v11;
  int v12;
  int Tag;
  int v14;
  int v15;
  uint64_t v16;
  id *v17;
  uint64_t *v18;
  int v19;
  uint64_t v20;
  __CFString *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;

  v10 = objc_msgSend(a4, "mapKeyDataType");
  v11 = *(unsigned __int8 *)(a4[1] + 30);
  v24 = 0;
  v25 = 0;
  if (v11 == 17)
    v24 = (__CFString *)objc_msgSend(a4, "defaultValue");
  v12 = GPBWireFormatForType((int)v10, 0);
  Tag = GPBWireFormatMakeTag(1, v12);
  v14 = GPBWireFormatForType(v11, 0);
  v15 = GPBWireFormatMakeTag(2, v14);
  while (1)
  {
    while (1)
    {
      v16 = GPBCodedInputStreamReadTag((uint64_t)(a2 + 1));
      if ((_DWORD)v16 == Tag)
      {
        v17 = (id *)&v25;
        v18 = a2;
        v19 = (int)v10;
        goto LABEL_8;
      }
      v20 = v16;
      if ((_DWORD)v16 != v15)
        break;
      v17 = (id *)&v24;
      v18 = a2;
      v19 = v11;
LABEL_8:
      sub_10029D7D0(v18, v17, v19, a3, a4);
    }
    if (!(_DWORD)v16)
      break;
    if ((objc_msgSend(a2, "skipField:", v16) & 1) == 0)
      goto LABEL_32;
  }
  v21 = v25;
  if ((_DWORD)v10 == 14 && !v25)
  {
    v21 = &stru_100366D80;
    v25 = v21;
  }
  v22 = v24;
  if ((v11 - 13) > 3u || v24)
    goto LABEL_25;
  switch(v11)
  {
    case 13:
      v23 = (__CFString *)(id)GPBEmptyNSData();
LABEL_23:
      v22 = v23;
      v24 = v23;
      goto LABEL_25;
    case 15:
      v23 = (__CFString *)objc_alloc_init((Class)objc_msgSend(a4, "msgClass", v20));
      goto LABEL_23;
    case 14:
      v23 = &stru_100366D80;
      goto LABEL_23;
  }
  v22 = 0;
LABEL_25:
  if ((_DWORD)v10 == 14 && (v11 - 13) <= 3u)
  {
    objc_msgSend(a1, "setObject:forKey:", v22, v21);
    goto LABEL_34;
  }
  if (v11 != 17
    || objc_msgSend(objc_msgSend(objc_msgSend(a5, "descriptor", v20), "file"), "syntax") == 3
    || objc_msgSend(a4, "isValidEnumValue:", v22))
  {
    objc_msgSend(a1, "setGPBGenericValue:forGPBGenericValueKey:", &v24, &v25);
  }
  else
  {
    objc_msgSend(a5, "addUnknownMapEntry:value:", *(unsigned int *)(a4[1] + 16), objc_msgSend(a1, "serializedDataForUnknownValue:forKey:keyDataType:", v22, &v25, v10));
  }
LABEL_32:
  if (((_BYTE)v10 - 13) > 3u)
    goto LABEL_35;
  v21 = v25;
LABEL_34:

LABEL_35:
  if ((v11 - 13) <= 3u)

}

void sub_10029D7D0(uint64_t *a1, id *a2, int a3, uint64_t a4, void *a5)
{
  int Fixed32;
  uint64_t Fixed64;
  id v10;

  switch(a3)
  {
    case 0:
      *(_BYTE *)a2 = GPBCodedInputStreamReadBool(a1 + 1);
      return;
    case 1:
      Fixed32 = GPBCodedInputStreamReadFixed32(a1 + 1);
      goto LABEL_21;
    case 2:
      Fixed32 = GPBCodedInputStreamReadSFixed32(a1 + 1);
      goto LABEL_21;
    case 3:
      *(float *)a2 = GPBCodedInputStreamReadFloat(a1 + 1);
      return;
    case 4:
      Fixed64 = GPBCodedInputStreamReadFixed64(a1 + 1);
      goto LABEL_17;
    case 5:
      Fixed64 = GPBCodedInputStreamReadSFixed64(a1 + 1);
      goto LABEL_17;
    case 6:
      *(double *)a2 = GPBCodedInputStreamReadDouble(a1 + 1);
      return;
    case 7:
      Fixed32 = GPBCodedInputStreamReadInt32(a1 + 1);
      goto LABEL_21;
    case 8:
      Fixed64 = GPBCodedInputStreamReadInt64(a1 + 1);
      goto LABEL_17;
    case 9:
      Fixed32 = GPBCodedInputStreamReadSInt32(a1 + 1);
      goto LABEL_21;
    case 10:
      Fixed64 = GPBCodedInputStreamReadSInt64(a1 + 1);
      goto LABEL_17;
    case 11:
      Fixed32 = GPBCodedInputStreamReadUInt32(a1 + 1);
      goto LABEL_21;
    case 12:
      Fixed64 = GPBCodedInputStreamReadUInt64(a1 + 1);
      goto LABEL_17;
    case 13:

      Fixed64 = (uint64_t)GPBCodedInputStreamReadRetainedBytes(a1 + 1);
      goto LABEL_17;
    case 14:

      Fixed64 = (uint64_t)GPBCodedInputStreamReadRetainedString(a1 + 1);
LABEL_17:
      *a2 = (id)Fixed64;
      break;
    case 15:
      v10 = objc_alloc_init((Class)objc_msgSend(a5, "msgClass"));
      objc_msgSend(a1, "readMessage:extensionRegistry:", v10, a4);

      *a2 = v10;
      break;
    case 16:
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void ReadValue(GPBCodedInputStream *, GPBGenericValue *, GPBDataType, GPBExtensionRegistry *, GPBFieldDescriptor *)"), CFSTR("GPBDictionary.m"), 447, CFSTR("Can't happen"));
      break;
    case 17:
      Fixed32 = GPBCodedInputStreamReadEnum(a1 + 1);
LABEL_21:
      *(_DWORD *)a2 = Fixed32;
      break;
    default:
      return;
  }
}

uint64_t sub_10029DEA4(unsigned int a1, int a2, unsigned int a3)
{
  if (a3 == 1)
    return GPBComputeFixed32Size(a2);
  if (a3 == 11)
    return GPBComputeUInt32Size(a2, a1);
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictUInt32FieldSize(uint32_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 183, CFSTR("Unexpected type %d"), a3);
  return 0;
}

id sub_10029E090(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 == 1)
    return objc_msgSend(a1, "writeFixed32:value:", a3, a2);
  if (a4 == 11)
    return objc_msgSend(a1, "writeUInt32:value:", a3, a2);
  return -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictUInt32Field(GPBCodedOutputStream *, uint32_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 194, CFSTR("Unexpected type %d"), a4);
}

uint64_t sub_10029E1DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_10029E810(unsigned int a1, int a2, unsigned int a3)
{
  switch(a3)
  {
    case 2u:
      return GPBComputeSFixed32Size(a2);
    case 9u:
      return GPBComputeSInt32Size(a2, a1);
    case 7u:
      return GPBComputeInt32Size(a2, a1);
  }
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictInt32FieldSize(int32_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 160, CFSTR("Unexpected type %d"), a3);
  return 0;
}

id sub_10029EA1C(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  switch(a4)
  {
    case 2u:
      return objc_msgSend(a1, "writeSFixed32:value:", a3, a2);
    case 9u:
      return objc_msgSend(a1, "writeSInt32:value:", a3, a2);
    case 7u:
      return objc_msgSend(a1, "writeInt32:value:", a3, a2);
  }
  return -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictInt32Field(GPBCodedOutputStream *, int32_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 173, CFSTR("Unexpected type %d"), a4);
}

uint64_t sub_10029EB84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_10029F1B0(unint64_t a1, int a2, unsigned int a3)
{
  if (a3 == 4)
    return GPBComputeFixed64Size(a2);
  if (a3 == 12)
    return GPBComputeUInt64Size(a2, a1);
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictUInt64FieldSize(uint64_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 229, CFSTR("Unexpected type %d"), a3);
  return 0;
}

id sub_10029F39C(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4 == 4)
    return objc_msgSend(a1, "writeFixed64:value:", a3, a2);
  if (a4 == 12)
    return objc_msgSend(a1, "writeUInt64:value:", a3, a2);
  return -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictUInt64Field(GPBCodedOutputStream *, uint64_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 240, CFSTR("Unexpected type %d"), a4);
}

uint64_t sub_10029F4E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_10029FB14(unint64_t a1, int a2, unsigned int a3)
{
  switch(a3)
  {
    case 5u:
      return GPBComputeSFixed64Size(a2);
    case 0xAu:
      return GPBComputeSInt64Size(a2, a1);
    case 8u:
      return GPBComputeInt64Size(a2, a1);
  }
  -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictInt64FieldSize(int64_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 206, CFSTR("Unexpected type %d"), a3);
  return 0;
}

id sub_10029FD20(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  switch(a4)
  {
    case 5u:
      return objc_msgSend(a1, "writeSFixed64:value:", a3, a2);
    case 0xAu:
      return objc_msgSend(a1, "writeSInt64:value:", a3, a2);
    case 8u:
      return objc_msgSend(a1, "writeInt64:value:", a3, a2);
  }
  return -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictInt64Field(GPBCodedOutputStream *, int64_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 219, CFSTR("Unexpected type %d"), a4);
}

uint64_t sub_10029FE88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_1002A04B4(uint64_t a1, int a2, unsigned int a3)
{
  if (a3)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictBoolFieldSize(BOOL, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 245, CFSTR("bad type: %d"), a3);
  return GPBComputeBoolSize(a2);
}

id sub_1002A0678(void *a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a4)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictBoolField(GPBCodedOutputStream *, BOOL, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 251, CFSTR("bad type: %d"), a4);
  return objc_msgSend(a1, "writeBool:value:", a3, a2);
}

uint64_t sub_1002A07BC(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_1002A0DD4(unsigned int a1)
{
  if (a1 != 3)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictFloatFieldSize(float, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 269, CFSTR("bad type: %d"), a1);
  return GPBComputeFloatSize(2);
}

id sub_1002A0F90(void *a1, unsigned int a2, double a3)
{
  int v3;

  v3 = LODWORD(a3);
  if (a2 != 3)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictFloatField(GPBCodedOutputStream *, float, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 275, CFSTR("bad type: %d"), a2);
  LODWORD(a3) = v3;
  return objc_msgSend(a1, "writeFloat:value:", 2, a3);
}

uint64_t sub_1002A10D4(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_1002A170C(unsigned int a1)
{
  if (a1 != 6)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictDoubleFieldSize(double, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 281, CFSTR("bad type: %d"), a1);
  return GPBComputeDoubleSize(2);
}

id sub_1002A18C8(void *a1, unsigned int a2, double a3)
{
  if (a2 != 6)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictDoubleField(GPBCodedOutputStream *, double, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 287, CFSTR("bad type: %d"), a2);
  return objc_msgSend(a1, "writeDouble:value:", 2, a3);
}

uint64_t sub_1002A1A0C(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

BOOL sub_1002A1CE0(int a1)
{
  return a1 != -72499473;
}

uint64_t sub_1002A2094(unsigned int a1, unsigned int a2)
{
  if (a2 != 17)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictEnumFieldSize(int32_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 257, CFSTR("bad type: %d"), a2);
  return GPBComputeEnumSize(2, a1);
}

id sub_1002A2250(void *a1, uint64_t a2, unsigned int a3)
{
  if (a3 != 17)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictEnumField(GPBCodedOutputStream *, int32_t, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 263, CFSTR("bad type: %d"), a3);
  return objc_msgSend(a1, "writeEnum:value:", 2, a2);
}

uint64_t sub_1002A2434(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_1002A2FB4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a2), a3);
}

uint64_t sub_1002A377C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_1002A3F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_1002A478C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_1002A4F90(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_1002A5794(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_1002A5F7C(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_1002A6784(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_1002A7070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_1002A7BF0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a2), a3);
}

uint64_t sub_1002A83B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_1002A8BBC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_1002A93C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_1002A9BCC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_1002AA3D0(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_1002AABB8(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_1002AB3C0(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_1002ABCAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_1002AC82C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a2), a3);
}

uint64_t sub_1002ACFF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_1002AD7F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_1002ADFFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_1002AE800(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_1002AF00C(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4;
  NSString *v5;
  const __CFString *v6;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2);
  if (a3)
    v6 = CFSTR("true");
  else
    v6 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, NSString *, const __CFString *))(v4 + 16))(v4, v5, v6);
}

uint64_t sub_1002AF7F4(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_1002AFFFC(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_1002B08E8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", a3));
}

uint64_t sub_1002B1468(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, NSString *, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a2), a3);
}

char *sub_1002B1A5C(void *a1, unsigned int a2)
{
  if (a2 != 14)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "size_t ComputeDictStringFieldSize(NSString *, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 293, CFSTR("bad type: %d"), a2);
  return GPBComputeStringSize(1, a1);
}

id sub_1002B1C0C(void *a1, uint64_t a2, unsigned int a3)
{
  if (a3 != 14)
    -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void WriteDictStringField(GPBCodedOutputStream *, NSString *, uint32_t, GPBDataType)"), CFSTR("GPBDictionary.m"), 299, CFSTR("bad type: %d"), a3);
  return objc_msgSend(a1, "writeString:value:", 1, a2);
}

uint64_t sub_1002B1D30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%u"), a3));
}

uint64_t sub_1002B24C0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%d"), a3));
}

uint64_t sub_1002B2C50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%llu"), a3));
}

uint64_t sub_1002B33E0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lld"), a3));
}

uint64_t sub_1002B3B70(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  const __CFString *v4;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
    v4 = CFSTR("true");
  else
    v4 = CFSTR("false");
  return (*(uint64_t (**)(uint64_t, uint64_t, const __CFString *))(v3 + 16))(v3, a2, v4);
}

uint64_t sub_1002B42C4(uint64_t a1, uint64_t a2, float a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*g"), 6, a3));
}

uint64_t sub_1002B4A5C(uint64_t a1, uint64_t a2, double a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSString *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%.*lg"), 15, *(_QWORD *)&a3));
}

uint64_t sub_1002B52D0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, NSNumber *))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2, +[NSNumber numberWithInt:](NSNumber, "numberWithInt:"));
}

uint64_t sub_1002B9D50(uint64_t a1, uint64_t a2)
{
  return a2;
}

CFStringRef sub_1002B9D5C(char *cStr)
{
  return CFStringCreateWithCString(kCFAllocatorDefault, cStr, 0x8000100u);
}

BOOL sub_1002B9D78(const char *a1, const char *a2)
{
  return strcmp(a1, a2) == 0;
}

uint64_t sub_1002B9D94(_BYTE *a1)
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

uint64_t GPBResolveExtensionClassMethod(objc_class *a1, const char *a2)
{
  uint64_t result;
  uint64_t v5;
  char *v6;
  const char *Name;
  objc_class *MetaClass;
  void (*v9)(void);
  _QWORD block[5];

  result = (uint64_t)sub_1002B9EFC(a1, a2);
  if (result)
  {
    v5 = result;
    v6 = GPBMessageEncodingForSelector("getClassValue", 0);
    Name = class_getName(a1);
    MetaClass = objc_getMetaClass(Name);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002BA080;
    block[3] = &unk_100365418;
    block[4] = v5;
    v9 = imp_implementationWithBlock(block);
    return class_addMethod(MetaClass, a2, v9, v6) || GPBClassHasSel(MetaClass, a2);
  }
  return result;
}

const void *sub_1002B9EFC(objc_class *a1, SEL sel)
{
  const char *Name;
  int v5;
  const void *Value;
  const char *v7;
  uint64_t v8;
  const char *v9;
  size_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  Name = sel_getName(sel);
  v5 = *(unsigned __int8 *)Name;
  if (v5 == 95)
    return 0;
  v7 = Name;
  v8 = 1;
  if (*Name)
  {
    while (v5 != 58)
    {
      v5 = Name[v8++];
      if (!v5)
        goto LABEL_6;
    }
    return 0;
  }
LABEL_6:
  v9 = class_getName(a1);
  v10 = strlen(v9);
  __chkstk_darwin(v10);
  v12 = (char *)&v14 - v11;
  memcpy((char *)&v14 - v11, v9, v10);
  v12[v10] = 95;
  memcpy(&v12[v10 + 1], v7, v8 - 1);
  v12[v10 + v8] = 0;
  if (!qword_100389408)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", sel, a1, CFSTR("GPBRootObject.m"), 190, CFSTR("Startup order broken!"));
  dispatch_semaphore_wait((dispatch_semaphore_t)qword_100389410, 0xFFFFFFFFFFFFFFFFLL);
  Value = CFDictionaryGetValue((CFDictionaryRef)qword_100389408, v12);
  dispatch_semaphore_signal((dispatch_semaphore_t)qword_100389410);
  return Value;
}

uint64_t sub_1002BA080(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t *sub_1002BA2A0(uint64_t *result, uint64_t a2)
{
  uint64_t *v3;
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

  v3 = result;
  v4 = result[2];
  if (v4 == result[1])
  {
    result = sub_1002BCDE8(result);
    v4 = v3[2];
  }
  v5 = *v3;
  v3[2] = v4 + 1;
  *(_BYTE *)(v5 + v4) = a2;
  v6 = v3[2];
  if (v6 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v6 = v3[2];
  }
  v7 = *v3;
  v3[2] = v6 + 1;
  *(_BYTE *)(v7 + v6) = BYTE1(a2);
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = BYTE2(a2);
  v10 = v3[2];
  if (v10 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v10 = v3[2];
  }
  v11 = *v3;
  v3[2] = v10 + 1;
  *(_BYTE *)(v11 + v10) = BYTE3(a2);
  v12 = v3[2];
  if (v12 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v12 = v3[2];
  }
  v13 = *v3;
  v3[2] = v12 + 1;
  *(_BYTE *)(v13 + v12) = BYTE4(a2);
  v14 = v3[2];
  if (v14 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v14 = v3[2];
  }
  v15 = *v3;
  v3[2] = v14 + 1;
  *(_BYTE *)(v15 + v14) = BYTE5(a2);
  v16 = v3[2];
  if (v16 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v16 = v3[2];
  }
  v17 = *v3;
  v3[2] = v16 + 1;
  *(_BYTE *)(v17 + v16) = BYTE6(a2);
  v18 = v3[2];
  if (v18 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v18 = v3[2];
  }
  v19 = *v3;
  v3[2] = v18 + 1;
  *(_BYTE *)(v19 + v18) = HIBYTE(a2);
  return result;
}

uint64_t *sub_1002BA470(uint64_t *result, int a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = result;
  v4 = result[2];
  if (v4 == result[1])
  {
    result = sub_1002BCDE8(result);
    v4 = v3[2];
  }
  v5 = *v3;
  v3[2] = v4 + 1;
  *(_BYTE *)(v5 + v4) = a2;
  v6 = v3[2];
  if (v6 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v6 = v3[2];
  }
  v7 = *v3;
  v3[2] = v6 + 1;
  *(_BYTE *)(v7 + v6) = BYTE1(a2);
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = BYTE2(a2);
  v10 = v3[2];
  if (v10 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v10 = v3[2];
  }
  v11 = *v3;
  v3[2] = v10 + 1;
  *(_BYTE *)(v11 + v10) = HIBYTE(a2);
  return result;
}

uint64_t *sub_1002BA590(uint64_t *result, unint64_t a2)
{
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      v5 = v3[2];
      if (v5 == v3[1])
      {
        result = sub_1002BCDE8(v3);
        v5 = v3[2];
      }
      v6 = *v3;
      v3[2] = v5 + 1;
      *(_BYTE *)(v6 + v5) = v2 | 0x80;
      v4 = v2 >> 7;
      v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_1002BA6C4(uint64_t *result, unsigned int a2)
{
  if ((a2 & 0x80000000) != 0)
    return sub_1002BA590(result, (int)a2);
  else
    return sub_1002BAA34(result, a2);
}

uint64_t *sub_1002BAA34(uint64_t *result, unsigned int a2)
{
  unsigned int v2;
  uint64_t *v3;
  unsigned int v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = result;
  if (a2 >= 0x80)
  {
    do
    {
      v5 = v3[2];
      if (v5 == v3[1])
      {
        result = sub_1002BCDE8(v3);
        v5 = v3[2];
      }
      v6 = *v3;
      v3[2] = v5 + 1;
      *(_BYTE *)(v6 + v5) = v2 | 0x80;
      v4 = v2 >> 7;
      v7 = v2 >= 0x4000;
      v2 >>= 7;
    }
    while (v7);
  }
  else
  {
    LOBYTE(v4) = a2;
  }
  v8 = v3[2];
  if (v8 == v3[1])
  {
    result = sub_1002BCDE8(v3);
    v8 = v3[2];
  }
  v9 = *v3;
  v3[2] = v8 + 1;
  *(_BYTE *)(v9 + v8) = v4;
  return result;
}

uint64_t *sub_1002BAD90(uint64_t *a1, int a2, unsigned int a3)
{
  unsigned int Tag;

  Tag = GPBWireFormatMakeTag(a2, 0);
  sub_1002BAA34(a1, Tag);
  return sub_1002BAA34(a1, a3);
}

void sub_1002BB0A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BB0B8(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t GPBComputeDoubleSizeNoTag()
{
  return 8;
}

id sub_1002BB0D8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDoubleNoTag:");
}

id sub_1002BB0E0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeDouble:value:", *(unsigned int *)(a1 + 40));
}

void sub_1002BB234(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BB24C(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t GPBComputeFloatSizeNoTag()
{
  return 4;
}

id sub_1002BB26C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloatNoTag:");
}

id sub_1002BB274(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFloat:value:", *(unsigned int *)(a1 + 40));
}

void sub_1002BB3C8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BB3E0(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = GPBComputeRawVarint64Size(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1002BB41C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt64NoTag:", a2);
}

id sub_1002BB428(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BB580(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BB598(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  result = GPBComputeRawVarint64Size(a2);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

id sub_1002BB5D4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt64NoTag:", a2);
}

id sub_1002BB5E0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BB738(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BB750(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 10;
  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a2 >> 28)
    v6 = 5;
  if (a2 >= 0x200000)
    v5 = v6;
  if (a2 >= 0x4000)
    v4 = v5;
  if (a2 >= 0x80)
    v3 = v4;
  if ((a2 & 0x80000000) == 0)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t GPBComputeInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (a1 >> 28)
    v4 = 5;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v1 = v2;
  if ((a1 & 0x80000000) == 0)
    return v1;
  else
    return 10;
}

id sub_1002BB7EC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt32NoTag:", a2);
}

id sub_1002BB7F8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BB950(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BB968(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (a2 >> 28)
    v5 = 5;
  if (a2 >= 0x200000)
    v4 = v5;
  if (a2 >= 0x4000)
    v3 = v4;
  if (a2 >= 0x80)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t GPBComputeUInt32SizeNoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

id sub_1002BB9EC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt32NoTag:", a2);
}

id sub_1002BB9F8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeUInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BBB50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BBB68(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t GPBComputeFixed64SizeNoTag()
{
  return 8;
}

id sub_1002BBB88(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed64NoTag:", a2);
}

id sub_1002BBB94(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BBCEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BBD04(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t GPBComputeFixed32SizeNoTag()
{
  return 4;
}

id sub_1002BBD24(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed32NoTag:", a2);
}

id sub_1002BBD30(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeFixed32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BBE88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BBEA0(uint64_t result, int a2)
{
  unsigned int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = (2 * a2) ^ (a2 >> 31);
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v2 >> 28)
    v5 = 5;
  if (v2 >= 0x200000)
    v4 = v5;
  if (v2 >= 0x4000)
    v3 = v4;
  if (v2 >= 0x80)
    v6 = v3;
  else
    v6 = 1;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v6;
  return result;
}

uint64_t GPBComputeSInt32SizeNoTag(int a1)
{
  unsigned int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = (2 * a1) ^ (a1 >> 31);
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (v1 >> 28)
    v4 = 5;
  if (v1 >= 0x200000)
    v3 = v4;
  if (v1 >= 0x4000)
    v2 = v3;
  if (v1 >= 0x80)
    return v2;
  else
    return 1;
}

id sub_1002BBF34(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt32NoTag:", a2);
}

id sub_1002BBF40(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BC098(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BC0B0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = GPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

uint64_t GPBComputeSInt64SizeNoTag(uint64_t a1)
{
  return GPBComputeRawVarint64Size((2 * a1) ^ (a1 >> 63));
}

id sub_1002BC0F8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt64NoTag:", a2);
}

id sub_1002BC104(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSInt64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BC25C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BC274(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 8;
  return result;
}

uint64_t GPBComputeSFixed64SizeNoTag()
{
  return 8;
}

id sub_1002BC294(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed64NoTag:", a2);
}

id sub_1002BC2A0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed64:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BC3F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BC410(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += 4;
  return result;
}

uint64_t GPBComputeSFixed32SizeNoTag()
{
  return 4;
}

id sub_1002BC430(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed32NoTag:", a2);
}

id sub_1002BC43C(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeSFixed32:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BC594(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BC5AC(uint64_t result)
{
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

uint64_t GPBComputeBoolSizeNoTag()
{
  return 1;
}

id sub_1002BC5CC(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeBoolNoTag:", a2);
}

id sub_1002BC5D8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeBool:value:", *(unsigned int *)(a1 + 40), a2);
}

void sub_1002BC730(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1002BC748(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = 10;
  v3 = 1;
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (a2 >> 28)
    v6 = 5;
  if (a2 >= 0x200000)
    v5 = v6;
  if (a2 >= 0x4000)
    v4 = v5;
  if (a2 >= 0x80)
    v3 = v4;
  if ((a2 & 0x80000000) == 0)
    v2 = v3;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += v2;
  return result;
}

uint64_t GPBComputeEnumSizeNoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (a1 >> 28)
    v4 = 5;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v1 = v2;
  if ((a1 & 0x80000000) == 0)
    return v1;
  else
    return 10;
}

id sub_1002BC7E4(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeEnumNoTag:", a2);
}

id sub_1002BC7F0(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "writeEnum:value:", *(unsigned int *)(a1 + 40), a2);
}

_QWORD *sub_1002BCDE8(_QWORD *result)
{
  _QWORD *v1;

  v1 = result;
  if (!result[3])
    result = +[NSException raise:format:](NSException, "raise:format:", CFSTR("OutOfSpace"), &stru_100366D80);
  if (v1[2])
  {
    result = objc_msgSend((id)v1[3], "write:maxLength:", *v1);
    if (result != (_QWORD *)v1[2])
      result = +[NSException raise:format:](NSException, "raise:format:", CFSTR("WriteFailed"), &stru_100366D80);
    v1[2] = 0;
  }
  return result;
}

uint64_t GPBComputeRawVarint64Size(unint64_t a1)
{
  uint64_t v2;

  if (a1 < 0x80)
    return 1;
  if (a1 < 0x4000)
    return 2;
  if (a1 < 0x200000)
    return 3;
  if (!(a1 >> 28))
    return 4;
  if (!(a1 >> 35))
    return 5;
  if (!(a1 >> 42))
    return 6;
  if (!(a1 >> 49))
    return 7;
  v2 = 9;
  if ((a1 & 0x8000000000000000) != 0)
    v2 = 10;
  if (HIBYTE(a1))
    return v2;
  else
    return 8;
}

uint64_t GPBComputeRawVarint32Size(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

uint64_t GPBComputeSizeTSizeAsInt32NoTag(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = 1;
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (a1 >> 28)
    v4 = 5;
  if (a1 >= 0x200000)
    v3 = v4;
  if (a1 >= 0x4000)
    v2 = v3;
  if (a1 >= 0x80)
    v1 = v2;
  if ((a1 & 0x80000000) == 0)
    return v1;
  else
    return 10;
}

char *GPBComputeStringSizeNoTag(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (char *)objc_msgSend(a1, "lengthOfBytesUsingEncoding:", 4);
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return &v1[v2];
}

uint64_t GPBComputeRawVarint32SizeForInteger(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = 2;
  v2 = 3;
  v3 = 4;
  if (a1 >> 28)
    v3 = 5;
  if (a1 >= 0x200000)
    v2 = v3;
  if (a1 >= 0x4000)
    v1 = v2;
  if (a1 >= 0x80)
    return v1;
  else
    return 1;
}

char *GPBComputeMessageSizeNoTag(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (char *)objc_msgSend(a1, "serializedSize");
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return &v1[v2];
}

char *GPBComputeBytesSizeNoTag(void *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1 = (char *)objc_msgSend(a1, "length");
  v2 = 1;
  v3 = 2;
  v4 = 3;
  v5 = 4;
  if (v1 >> 28)
    v5 = 5;
  if (v1 >= 0x200000)
    v4 = v5;
  if (v1 >= 0x4000)
    v3 = v4;
  if (v1 >= 0x80)
    v2 = v3;
  return &v1[v2];
}

uint64_t GPBComputeDoubleSize(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if (Tag >> 28)
    v4 = 13;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 9;
}

uint64_t GPBComputeTagSize(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 2;
  v3 = 3;
  v4 = 4;
  if (Tag >> 28)
    v4 = 5;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 1;
}

uint64_t GPBComputeFloatSize(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if (Tag >> 28)
    v4 = 9;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 5;
}

uint64_t GPBComputeUInt64Size(int a1, unint64_t a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (Tag >> 28)
    v6 = 5;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  return GPBComputeRawVarint64Size(a2) + v7;
}

uint64_t GPBComputeInt64Size(int a1, unint64_t a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (Tag >> 28)
    v6 = 5;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  return GPBComputeRawVarint64Size(a2) + v7;
}

uint64_t GPBComputeInt32Size(int a1, unsigned int a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (Tag >> 28)
    v7 = 5;
  if (Tag >= 0x200000)
    v6 = v7;
  if (Tag >= 0x4000)
    v5 = v6;
  if (Tag >= 0x80)
    v4 = v5;
  v8 = 10;
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (a2 >> 28)
    v12 = 5;
  if (a2 >= 0x200000)
    v11 = v12;
  if (a2 >= 0x4000)
    v10 = v11;
  if (a2 >= 0x80)
    v9 = v10;
  if ((a2 & 0x80000000) == 0)
    v8 = v9;
  return v8 + v4;
}

uint64_t GPBComputeFixed64Size(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if (Tag >> 28)
    v4 = 13;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 9;
}

uint64_t GPBComputeFixed32Size(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if (Tag >> 28)
    v4 = 9;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 5;
}

uint64_t GPBComputeBoolSize(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 3;
  v3 = 4;
  v4 = 5;
  if (Tag >> 28)
    v4 = 6;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 2;
}

char *GPBComputeStringSize(int a1, void *a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (Tag >> 28)
    v6 = 5;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  v8 = (char *)objc_msgSend(a2, "lengthOfBytesUsingEncoding:", 4);
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (v8 >> 28)
    v12 = 5;
  if (v8 >= 0x200000)
    v11 = v12;
  if (v8 >= 0x4000)
    v10 = v11;
  if (v8 >= 0x80)
    v9 = v10;
  return &v8[v7 + v9];
}

char *GPBComputeGroupSize(int a1, void *a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 4;
  v5 = 6;
  v6 = 10;
  if (!(Tag >> 28))
    v6 = 8;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 2;
  return (char *)objc_msgSend(a2, "serializedSize") + v7;
}

char *GPBComputeUnknownGroupSize(int a1, void *a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 4;
  v5 = 6;
  v6 = 10;
  if (!(Tag >> 28))
    v6 = 8;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 2;
  return (char *)objc_msgSend(a2, "serializedSize") + v7;
}

char *GPBComputeMessageSize(int a1, void *a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (Tag >> 28)
    v6 = 5;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  v8 = (char *)objc_msgSend(a2, "serializedSize");
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (v8 >> 28)
    v12 = 5;
  if (v8 >= 0x200000)
    v11 = v12;
  if (v8 >= 0x4000)
    v10 = v11;
  if (v8 >= 0x80)
    v9 = v10;
  return &v8[v7 + v9];
}

char *GPBComputeBytesSize(int a1, void *a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (Tag >> 28)
    v6 = 5;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  v8 = (char *)objc_msgSend(a2, "length");
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (v8 >> 28)
    v12 = 5;
  if (v8 >= 0x200000)
    v11 = v12;
  if (v8 >= 0x4000)
    v10 = v11;
  if (v8 >= 0x80)
    v9 = v10;
  return &v8[v7 + v9];
}

uint64_t GPBComputeUInt32Size(int a1, unsigned int a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (Tag >> 28)
    v7 = 5;
  if (Tag >= 0x200000)
    v6 = v7;
  if (Tag >= 0x4000)
    v5 = v6;
  if (Tag >= 0x80)
    v4 = v5;
  v8 = 1;
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (a2 >> 28)
    v11 = 5;
  if (a2 >= 0x200000)
    v10 = v11;
  if (a2 >= 0x4000)
    v9 = v10;
  if (a2 >= 0x80)
    v8 = v9;
  return v8 + v4;
}

uint64_t GPBComputeEnumSize(int a1, unsigned int a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (Tag >> 28)
    v7 = 5;
  if (Tag >= 0x200000)
    v6 = v7;
  if (Tag >= 0x4000)
    v5 = v6;
  if (Tag >= 0x80)
    v4 = v5;
  v8 = 10;
  v9 = 1;
  v10 = 2;
  v11 = 3;
  v12 = 4;
  if (a2 >> 28)
    v12 = 5;
  if (a2 >= 0x200000)
    v11 = v12;
  if (a2 >= 0x4000)
    v10 = v11;
  if (a2 >= 0x80)
    v9 = v10;
  if ((a2 & 0x80000000) == 0)
    v8 = v9;
  return v8 + v4;
}

uint64_t GPBComputeSFixed32Size(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 6;
  v3 = 7;
  v4 = 8;
  if (Tag >> 28)
    v4 = 9;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 5;
}

uint64_t GPBComputeSFixed64Size(int a1)
{
  unsigned int Tag;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v2 = 10;
  v3 = 11;
  v4 = 12;
  if (Tag >> 28)
    v4 = 13;
  if (Tag >= 0x200000)
    v3 = v4;
  if (Tag >= 0x4000)
    v2 = v3;
  if (Tag >= 0x80)
    return v2;
  else
    return 9;
}

uint64_t GPBComputeSInt32Size(int a1, int a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (Tag >> 28)
    v7 = 5;
  if (Tag >= 0x200000)
    v6 = v7;
  if (Tag >= 0x4000)
    v5 = v6;
  if (Tag >= 0x80)
    v4 = v5;
  v8 = (2 * a2) ^ (a2 >> 31);
  v9 = 2;
  v10 = 3;
  v11 = 4;
  if (v8 >> 28)
    v11 = 5;
  if (v8 >= 0x200000)
    v10 = v11;
  if (v8 >= 0x4000)
    v9 = v10;
  if (v8 >= 0x80)
    v12 = v9;
  else
    v12 = 1;
  return v12 + v4;
}

uint64_t GPBComputeSInt64Size(int a1, uint64_t a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 2;
  v5 = 3;
  v6 = 4;
  if (Tag >> 28)
    v6 = 5;
  if (Tag >= 0x200000)
    v5 = v6;
  if (Tag >= 0x4000)
    v4 = v5;
  if (Tag >= 0x80)
    v7 = v4;
  else
    v7 = 1;
  return GPBComputeRawVarint64Size((2 * a2) ^ (a2 >> 63)) + v7;
}

char *GPBComputeMessageSetExtensionSize(unsigned int a1, void *a2)
{
  unsigned int Tag;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  Tag = GPBWireFormatMakeTag(1, 0);
  v5 = 4;
  v6 = 6;
  v7 = 10;
  if (!(Tag >> 28))
    v7 = 8;
  if (Tag >= 0x200000)
    v6 = v7;
  if (Tag >= 0x4000)
    v5 = v6;
  if (Tag >= 0x80)
    v8 = v5;
  else
    v8 = 2;
  v9 = GPBComputeUInt32Size(2, a1) + v8;
  return &GPBComputeMessageSize(3, a2)[v9];
}

char *GPBComputeRawMessageSetExtensionSize(unsigned int a1, void *a2)
{
  unsigned int Tag;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  Tag = GPBWireFormatMakeTag(1, 0);
  v5 = 4;
  v6 = 6;
  v7 = 10;
  if (!(Tag >> 28))
    v7 = 8;
  if (Tag >= 0x200000)
    v6 = v7;
  if (Tag >= 0x4000)
    v5 = v6;
  if (Tag >= 0x80)
    v8 = v5;
  else
    v8 = 2;
  v9 = GPBComputeUInt32Size(2, a1) + v8;
  return &GPBComputeBytesSize(3, a2)[v9];
}

uint64_t GPBComputeWireFormatTagSize(int a1, int a2)
{
  unsigned int Tag;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  Tag = GPBWireFormatMakeTag(a1, 0);
  v4 = 1;
  v5 = 2;
  v6 = 3;
  v7 = 4;
  if (Tag >> 28)
    v7 = 5;
  if (Tag >= 0x200000)
    v6 = v7;
  if (Tag >= 0x4000)
    v5 = v6;
  if (Tag >= 0x80)
    v4 = v5;
  return v4 << (a2 == 16);
}

void sub_1002BDEAC(void *key, const __CFDictionary *a2, CFDictionaryRef theDict)
{
  void *Value;
  CFMutableDictionaryRef MutableCopy;

  Value = (void *)CFDictionaryGetValue(theDict, key);
  if (Value)
  {
    CFDictionaryApplyFunction(a2, (CFDictionaryApplierFunction)sub_1002BDF38, Value);
  }
  else
  {
    MutableCopy = CFDictionaryCreateMutableCopy(kCFAllocatorDefault, 0, a2);
    CFDictionarySetValue(theDict, key, MutableCopy);
    CFRelease(MutableCopy);
  }
}

void sub_1002BDF38(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

BOOL sub_1002C1EBC(int a1)
{
  return a1 != -72499473;
}

void GPBExtensionMergeFromInputStream(_QWORD *a1, int a2, uint64_t *a3, uint64_t a4, void *a5)
{
  uint64_t v9;
  int Int32;
  unint64_t v11;
  __CFString *v12;
  id v13;
  __CFString *v14;

  v9 = a1[1];
  if (a2)
  {
    if ((*(_BYTE *)(v9 + 45) & 1) == 0)
      -[NSAssertionHandler handleFailureInFunction:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "void GPBExtensionMergeFromInputStream(GPBExtensionDescriptor *, BOOL, GPBCodedInputStream *, GPBExtensionRegistry *, GPBMessage *)"), CFSTR("GPBExtensionInternals.m"), 282, CFSTR("How was it packed if it isn't repeated?"));
    Int32 = GPBCodedInputStreamReadInt32(a3 + 1);
    v11 = GPBCodedInputStreamPushLimit((uint64_t)(a3 + 1), Int32);
    while (GPBCodedInputStreamBytesUntilLimit((uint64_t)(a3 + 1)))
    {
      v12 = (__CFString *)sub_1002C2FDC(a1, a3, a4, 0);
      objc_msgSend(a5, "addExtension:value:", a1, v12);

    }
    GPBCodedInputStreamPopLimit((uint64_t)(a3 + 1), v11);
  }
  else
  {
    if ((*(_BYTE *)(v9 + 45) & 1) != 0)
    {
      v14 = (__CFString *)sub_1002C2FDC(a1, a3, a4, 0);
      objc_msgSend(a5, "addExtension:value:", a1);
    }
    else
    {
      if (*(unsigned __int8 *)(v9 + 44) - 15 > 1)
        v13 = 0;
      else
        v13 = objc_msgSend(a5, "getExistingExtension:", a1);
      v14 = (__CFString *)sub_1002C2FDC(a1, a3, a4, v13);
      objc_msgSend(a5, "setExtension:value:", a1);
    }

  }
}

const __CFString *sub_1002C2FDC(_QWORD *a1, uint64_t *a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t *v6;
  id v8;
  id v9;
  uint64_t SFixed32;
  id v11;
  id v12;
  uint64_t Fixed64;
  id v14;
  uint64_t Fixed32;
  id v16;
  id v17;
  _BOOL8 Bool;
  id v19;
  unint64_t SFixed64;
  id v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a1[1];
  v6 = a2 + 1;
  switch(*(_BYTE *)(v4 + 44))
  {
    case 0:
      v17 = objc_alloc((Class)NSNumber);
      Bool = GPBCodedInputStreamReadBool(v6);
      return (const __CFString *)objc_msgSend(v17, "initWithBool:", Bool);
    case 1:
      v14 = objc_alloc((Class)NSNumber);
      Fixed32 = GPBCodedInputStreamReadFixed32(v6);
      return (const __CFString *)objc_msgSend(v14, "initWithUnsignedInt:", Fixed32);
    case 2:
      v9 = objc_alloc((Class)NSNumber);
      SFixed32 = GPBCodedInputStreamReadSFixed32(v6);
      return (const __CFString *)objc_msgSend(v9, "initWithInt:", SFixed32);
    case 3:
      v11 = objc_alloc((Class)NSNumber);
      GPBCodedInputStreamReadFloat(v6);
      return (const __CFString *)objc_msgSend(v11, "initWithFloat:", v23);
    case 4:
      v12 = objc_alloc((Class)NSNumber);
      Fixed64 = GPBCodedInputStreamReadFixed64(v6);
      return (const __CFString *)objc_msgSend(v12, "initWithUnsignedLongLong:", Fixed64);
    case 5:
      v19 = objc_alloc((Class)NSNumber);
      SFixed64 = GPBCodedInputStreamReadSFixed64(v6);
      return (const __CFString *)objc_msgSend(v19, "initWithLongLong:", SFixed64);
    case 6:
      v21 = objc_alloc((Class)NSNumber);
      GPBCodedInputStreamReadDouble(v6);
      return (const __CFString *)objc_msgSend(v21, "initWithDouble:", v22);
    case 7:
      v9 = objc_alloc((Class)NSNumber);
      SFixed32 = GPBCodedInputStreamReadInt32(v6);
      return (const __CFString *)objc_msgSend(v9, "initWithInt:", SFixed32);
    case 8:
      v19 = objc_alloc((Class)NSNumber);
      SFixed64 = GPBCodedInputStreamReadInt64(v6);
      return (const __CFString *)objc_msgSend(v19, "initWithLongLong:", SFixed64);
    case 9:
      v9 = objc_alloc((Class)NSNumber);
      SFixed32 = GPBCodedInputStreamReadSInt32(v6);
      return (const __CFString *)objc_msgSend(v9, "initWithInt:", SFixed32);
    case 0xA:
      v19 = objc_alloc((Class)NSNumber);
      SFixed64 = GPBCodedInputStreamReadSInt64(v6);
      return (const __CFString *)objc_msgSend(v19, "initWithLongLong:", SFixed64);
    case 0xB:
      v14 = objc_alloc((Class)NSNumber);
      Fixed32 = GPBCodedInputStreamReadUInt32(v6);
      return (const __CFString *)objc_msgSend(v14, "initWithUnsignedInt:", Fixed32);
    case 0xC:
      v12 = objc_alloc((Class)NSNumber);
      Fixed64 = GPBCodedInputStreamReadUInt64(v6);
      return (const __CFString *)objc_msgSend(v12, "initWithUnsignedLongLong:", Fixed64);
    case 0xD:
      return (const __CFString *)GPBCodedInputStreamReadRetainedBytes(a2 + 1);
    case 0xE:
      return GPBCodedInputStreamReadRetainedString(a2 + 1);
    case 0xF:
    case 0x10:
      if (a4)
        v8 = a4;
      else
        v8 = objc_alloc_init((Class)objc_msgSend(objc_msgSend(objc_msgSend(a1, "msgClass"), "descriptor"), "messageClass"));
      v16 = v8;
      if (*(_BYTE *)(v4 + 44) == 16)
      {
        objc_msgSend(a2, "readGroup:message:extensionRegistry:", *(unsigned int *)(v4 + 40), v8, a3);
      }
      else if ((*(_BYTE *)(v4 + 45) & 4) != 0)
      {
        objc_msgSend(v8, "mergeFromCodedInputStream:extensionRegistry:", a2, a3);
      }
      else
      {
        objc_msgSend(a2, "readMessage:extensionRegistry:", v8, a3);
      }
      return (const __CFString *)v16;
    case 0x11:
      v9 = objc_alloc((Class)NSNumber);
      SFixed32 = GPBCodedInputStreamReadEnum(v6);
      return (const __CFString *)objc_msgSend(v9, "initWithInt:", SFixed32);
    default:
      return 0;
  }
}

id GPBWriteExtensionValueToOutputStream(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  id result;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  id v17;
  uint64_t v18;
  void *v19;
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
  _BYTE v32[128];

  v5 = *(_QWORD *)(a1 + 8);
  if ((*(_BYTE *)(v5 + 45) & 1) == 0)
    return sub_1002C3748(a2, v5, a3);
  if ((*(_BYTE *)(v5 + 45) & 2) != 0)
  {
    objc_msgSend(a3, "writeTag:format:", *(unsigned int *)(v5 + 40), 2);
    v10 = *(char *)(v5 + 44);
    if (v10 > 6)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v13)
      {
        v14 = v13;
        v12 = 0;
        v15 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v25 != v15)
              objc_enumerationMutation(a2);
            v12 += sub_1002C3E5C(*(unsigned __int8 *)(v5 + 44), *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i));
          }
          v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v14);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v11 = qword_1002EE440[v10];
      v12 = (_QWORD)objc_msgSend(a2, "count") * v11;
    }
    objc_msgSend(a3, "writeRawVarintSizeTAs32:", v12);
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, &v28, 16);
    if (result)
    {
      v17 = result;
      v18 = *(_QWORD *)v21;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(a2);
          switch(*(_BYTE *)(v5 + 44))
          {
            case 0:
              objc_msgSend(a3, "writeBoolNoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "BOOLValue"));
              break;
            case 1:
              objc_msgSend(a3, "writeFixed32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedIntValue"));
              break;
            case 2:
              objc_msgSend(a3, "writeSFixed32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 3:
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "floatValue");
              objc_msgSend(a3, "writeFloatNoTag:");
              break;
            case 4:
              objc_msgSend(a3, "writeFixed64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedLongLongValue"));
              break;
            case 5:
              objc_msgSend(a3, "writeSFixed64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 6:
              objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "doubleValue");
              objc_msgSend(a3, "writeDoubleNoTag:");
              break;
            case 7:
              objc_msgSend(a3, "writeInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 8:
              objc_msgSend(a3, "writeInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 9:
              objc_msgSend(a3, "writeSInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            case 0xA:
              objc_msgSend(a3, "writeSInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "longLongValue"));
              break;
            case 0xB:
              objc_msgSend(a3, "writeUInt32NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedIntValue"));
              break;
            case 0xC:
              objc_msgSend(a3, "writeUInt64NoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "unsignedLongLongValue"));
              break;
            case 0xD:
              objc_msgSend(a3, "writeBytesNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0xE:
              objc_msgSend(a3, "writeStringNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0xF:
              objc_msgSend(a3, "writeMessageNoTag:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0x10:
              objc_msgSend(a3, "writeGroupNoTag:value:", *(unsigned int *)(v5 + 40), *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19));
              break;
            case 0x11:
              objc_msgSend(a3, "writeEnumNoTag:", objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v19), "intValue"));
              break;
            default:
              break;
          }
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v20, &v28, 16);
        v17 = result;
      }
      while (result);
    }
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (result)
    {
      v7 = result;
      v8 = *(_QWORD *)v29;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(a2);
          sub_1002C3748(*(id *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)v9), v5, a3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        result = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        v7 = result;
      }
      while (result);
    }
  }
  return result;
}

id sub_1002C3748(id result, uint64_t a2, void *a3)
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

  switch(*(_BYTE *)(a2 + 44))
  {
    case 0:
      result = objc_msgSend(a3, "writeBool:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "BOOLValue"));
      break;
    case 1:
      v9 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "unsignedIntValue");
      result = objc_msgSend(a3, "writeFixed32:value:", v9);
      break;
    case 2:
      v4 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "intValue");
      result = objc_msgSend(a3, "writeSFixed32:value:", v4);
      break;
    case 3:
      v10 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "floatValue");
      result = objc_msgSend(a3, "writeFloat:value:", v10);
      break;
    case 4:
      v5 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "unsignedLongLongValue");
      result = objc_msgSend(a3, "writeFixed64:value:", v5);
      break;
    case 5:
      v11 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "longLongValue");
      result = objc_msgSend(a3, "writeSFixed64:value:", v11);
      break;
    case 6:
      v12 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "doubleValue");
      result = objc_msgSend(a3, "writeDouble:value:", v12);
      break;
    case 7:
      v13 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "intValue");
      result = objc_msgSend(a3, "writeInt32:value:", v13);
      break;
    case 8:
      v14 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "longLongValue");
      result = objc_msgSend(a3, "writeInt64:value:", v14);
      break;
    case 9:
      v6 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "intValue");
      result = objc_msgSend(a3, "writeSInt32:value:", v6);
      break;
    case 0xA:
      v15 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "longLongValue");
      result = objc_msgSend(a3, "writeSInt64:value:", v15);
      break;
    case 0xB:
      v7 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "unsignedIntValue");
      result = objc_msgSend(a3, "writeUInt32:value:", v7);
      break;
    case 0xC:
      v8 = *(unsigned int *)(a2 + 40);
      objc_msgSend(result, "unsignedLongLongValue");
      result = objc_msgSend(a3, "writeUInt64:value:", v8);
      break;
    case 0xD:
      result = objc_msgSend(a3, "writeBytes:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0xE:
      result = objc_msgSend(a3, "writeString:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0xF:
      v16 = *(unsigned int *)(a2 + 40);
      if ((*(_BYTE *)(a2 + 45) & 4) != 0)
        result = objc_msgSend(a3, "writeMessageSetExtension:value:", v16);
      else
        result = objc_msgSend(a3, "writeMessage:value:", v16, result);
      break;
    case 0x10:
      result = objc_msgSend(a3, "writeGroup:value:", *(unsigned int *)(a2 + 40), result);
      break;
    case 0x11:
      result = objc_msgSend(a3, "writeEnum:value:", *(unsigned int *)(a2 + 40), objc_msgSend(result, "intValue"));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t GPBComputeExtensionSerializedSizeIncludingTag(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *j;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v3 = *(_QWORD *)(a1 + 8);
  if ((*(_BYTE *)(v3 + 45) & 1) == 0)
    return sub_1002C3C14(*(_QWORD *)(a1 + 8), a2);
  if ((*(_BYTE *)(v3 + 45) & 2) != 0)
  {
    v10 = *(char *)(v3 + 44);
    if (v10 > 6)
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v13 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v13)
      {
        v14 = v13;
        v12 = 0;
        v15 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v15)
              objc_enumerationMutation(a2);
            v12 += sub_1002C3E5C(*(unsigned __int8 *)(v3 + 44), *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i));
          }
          v14 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v14);
      }
      else
      {
        v12 = 0;
      }
    }
    else
    {
      v11 = qword_1002EE440[v10];
      v12 = (_QWORD)objc_msgSend(a2, "count") * v11;
    }
    v17 = GPBComputeTagSize(*(_DWORD *)(v3 + 40));
    return v17 + v12 + GPBComputeRawVarint32SizeForInteger(v12);
  }
  else
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v6; j = (char *)j + 1)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(a2);
          v7 += sub_1002C3C14(v3, *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j));
        }
        v6 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }
    else
    {
      return 0;
    }
  }
  return v7;
}

uint64_t sub_1002C3C14(uint64_t result, void *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  int v8;
  char v9;
  unsigned int v10;

  switch(*(_BYTE *)(result + 44))
  {
    case 0:
      v2 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "BOOLValue");
      result = GPBComputeBoolSize(v2);
      break;
    case 1:
      v5 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "unsignedIntValue");
      result = GPBComputeFixed32Size(v5);
      break;
    case 2:
      v3 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "intValue");
      result = GPBComputeSFixed32Size(v3);
      break;
    case 3:
      v6 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "floatValue");
      result = GPBComputeFloatSize(v6);
      break;
    case 4:
      v4 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "unsignedLongLongValue");
      result = GPBComputeFixed64Size(v4);
      break;
    case 5:
      v7 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "longLongValue");
      result = GPBComputeSFixed64Size(v7);
      break;
    case 6:
      v8 = *(_DWORD *)(result + 40);
      objc_msgSend(a2, "doubleValue");
      result = GPBComputeDoubleSize(v8);
      break;
    case 7:
      result = GPBComputeInt32Size(*(_DWORD *)(result + 40), objc_msgSend(a2, "intValue"));
      break;
    case 8:
      result = GPBComputeInt64Size(*(_DWORD *)(result + 40), (unint64_t)objc_msgSend(a2, "longLongValue"));
      break;
    case 9:
      result = GPBComputeSInt32Size(*(_DWORD *)(result + 40), (int)objc_msgSend(a2, "intValue"));
      break;
    case 0xA:
      result = GPBComputeSInt64Size(*(_DWORD *)(result + 40), (uint64_t)objc_msgSend(a2, "longLongValue"));
      break;
    case 0xB:
      result = GPBComputeUInt32Size(*(_DWORD *)(result + 40), objc_msgSend(a2, "unsignedIntValue"));
      break;
    case 0xC:
      result = GPBComputeUInt64Size(*(_DWORD *)(result + 40), (unint64_t)objc_msgSend(a2, "unsignedLongLongValue"));
      break;
    case 0xD:
      result = (uint64_t)GPBComputeBytesSize(*(_DWORD *)(result + 40), a2);
      break;
    case 0xE:
      result = (uint64_t)GPBComputeStringSize(*(_DWORD *)(result + 40), a2);
      break;
    case 0xF:
      v9 = *(_BYTE *)(result + 45);
      v10 = *(_DWORD *)(result + 40);
      if ((v9 & 4) != 0)
        result = (uint64_t)GPBComputeMessageSetExtensionSize(v10, a2);
      else
        result = (uint64_t)GPBComputeMessageSize(v10, a2);
      break;
    case 0x10:
      result = (uint64_t)GPBComputeGroupSize(*(_DWORD *)(result + 40), a2);
      break;
    case 0x11:
      result = GPBComputeEnumSize(*(_DWORD *)(result + 40), objc_msgSend(a2, "intValue"));
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_1002C3E5C(uint64_t result, void *a2)
{
  switch((int)result)
  {
    case 0:
      objc_msgSend(a2, "BOOLValue");
      result = GPBComputeBoolSizeNoTag();
      break;
    case 1:
      objc_msgSend(a2, "unsignedIntValue");
      result = GPBComputeFixed32SizeNoTag();
      break;
    case 2:
      objc_msgSend(a2, "intValue");
      result = GPBComputeSFixed32SizeNoTag();
      break;
    case 3:
      objc_msgSend(a2, "floatValue");
      result = GPBComputeFloatSizeNoTag();
      break;
    case 4:
      objc_msgSend(a2, "unsignedLongLongValue");
      result = GPBComputeFixed64SizeNoTag();
      break;
    case 5:
      objc_msgSend(a2, "longLongValue");
      result = GPBComputeSFixed64SizeNoTag();
      break;
    case 6:
      objc_msgSend(a2, "doubleValue");
      result = GPBComputeDoubleSizeNoTag();
      break;
    case 7:
      result = GPBComputeInt32SizeNoTag(objc_msgSend(a2, "intValue"));
      break;
    case 8:
      result = GPBComputeInt64SizeNoTag(objc_msgSend(a2, "longLongValue"));
      break;
    case 9:
      result = GPBComputeSInt32SizeNoTag((int)objc_msgSend(a2, "intValue"));
      break;
    case 10:
      result = GPBComputeSInt64SizeNoTag((uint64_t)objc_msgSend(a2, "longLongValue"));
      break;
    case 11:
      result = GPBComputeUInt32SizeNoTag(objc_msgSend(a2, "unsignedIntValue"));
      break;
    case 12:
      result = GPBComputeUInt64SizeNoTag(objc_msgSend(a2, "unsignedLongLongValue"));
      break;
    case 13:
      result = (uint64_t)GPBComputeBytesSizeNoTag(a2);
      break;
    case 14:
      result = (uint64_t)GPBComputeStringSizeNoTag(a2);
      break;
    case 15:
      result = (uint64_t)GPBComputeMessageSizeNoTag(a2);
      break;
    case 16:
      result = GPBComputeGroupSizeNoTag(a2);
      break;
    case 17:
      result = GPBComputeEnumSizeNoTag(objc_msgSend(a2, "intValue"));
      break;
    default:
      return result;
  }
  return result;
}

void sub_1002C4148(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  void *v15;
  void *v16;
  void *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

id sub_1002C4190()
{
  if (qword_100387380 != -1)
    dispatch_once(&qword_100387380, &stru_1003657B8);
  return (id)qword_100387388;
}

void sub_1002C41D0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "updateIDSStatus");

}

void sub_1002C4204(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1002C4BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1002C4F50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C523C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C5510(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1002C56F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_1002C58D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1002C5A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1002C5AD4(id a1)
{
  id v1;
  void *v2;

  v1 = objc_msgSend(objc_alloc((Class)CLDispatchSilo), "initWithIdentifier:", CFSTR("CSCompanionServiceSilo"));
  v2 = (void *)qword_100389420;
  qword_100389420 = (uint64_t)v1;

}

void sub_1002C5C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1002C5CB0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  CompanionDelegate *v11;
  void *v12;
  void *v13;
  CompanionDelegate *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _QWORD block[5];
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;
  _QWORD v26[5];
  id v27;
  _QWORD v28[5];
  id v29;
  uint64_t buf;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (v6)
  {
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v9 = qword_100387388;
    if (os_log_type_enabled((os_log_t)qword_100387388, OS_LOG_TYPE_FAULT))
    {
      buf = 68289282;
      v31 = 2082;
      v32 = "";
      v33 = 2114;
      v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"IDS service failed to initialize\", \"Error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
    if (qword_100387380 != -1)
      dispatch_once(&qword_100387380, &stru_1003657B8);
    v10 = qword_100387388;
    if (os_signpost_enabled((os_log_t)qword_100387388))
    {
      buf = 68289282;
      v31 = 2082;
      v32 = "";
      v33 = 2114;
      v34 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "IDS service failed to initialize", "{\"msg%{public}.0s\":\"IDS service failed to initialize\", \"Error\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    objc_msgSend(WeakRetained, "setIdsService:", v5);
    v11 = [CompanionDelegate alloc];
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "silo"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "idsService"));
    v14 = -[CompanionDelegate initWithSilo:idsService:](v11, "initWithSilo:idsService:", v12, v13);
    objc_msgSend(v8, "setDelegate:", v14);

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1002C6184;
    v28[3] = &unk_100365680;
    v28[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v29, (id *)(a1 + 40));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    objc_msgSend(v15, "setTestTriggerHandler:", v28);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1002C6298;
    v26[3] = &unk_1003656D0;
    v26[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v27, (id *)(a1 + 40));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    objc_msgSend(v16, "setMessageHandler:", v26);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1002C63F0;
    v24[3] = &unk_100365720;
    v24[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v25, (id *)(a1 + 40));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    objc_msgSend(v17, "setStatusHandler:", v24);

    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1002C6548;
    v22[3] = &unk_100365770;
    v22[4] = *(_QWORD *)(a1 + 32);
    objc_copyWeak(&v23, (id *)(a1 + 40));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "delegate"));
    objc_msgSend(v18, "setCompanionStatusHandler:", v22);

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "silo"));
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1002C667C;
    block[3] = &unk_10034B158;
    block[4] = v8;
    dispatch_async(v20, block);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
  }

}

void sub_1002C60BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  id *v3;
  id *v4;
  void *v5;
  id *v6;
  id *v7;

  objc_destroyWeak(v7);
  objc_destroyWeak(v6);
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);

  _Unwind_Resume(a1);
}

void sub_1002C6184(uint64_t a1, double a2)
{
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7[2];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "silo"));
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "queue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002C6248;
  v6[3] = &unk_100365658;
  objc_copyWeak(v7, (id *)(a1 + 40));
  v7[1] = *(id *)&a2;
  dispatch_async(v5, v6);

  objc_destroyWeak(v7);
}

void sub_1002C6238(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C6248(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "testTriggerHandler:", *(double *)(a1 + 40));

}

void sub_1002C6284(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1002C6298(uint64_t a1, int a2, void *a3, double a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  int v14;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "silo"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002C6398;
  v11[3] = &unk_1003656A8;
  objc_copyWeak(v13, (id *)(a1 + 40));
  v14 = a2;
  v12 = v7;
  v13[1] = *(id *)&a4;
  v10 = v7;
  dispatch_async(v9, v11);

  objc_destroyWeak(v13);
}

void sub_1002C637C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002C6398(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "messageHandler:data:timestamp:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

void sub_1002C63DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1002C63F0(uint64_t a1, char a2, void *a3, double a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13[2];
  char v14;

  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "silo"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1002C64F0;
  v11[3] = &unk_1003656F8;
  objc_copyWeak(v13, (id *)(a1 + 40));
  v14 = a2;
  v12 = v7;
  v13[1] = *(id *)&a4;
  v10 = v7;
  dispatch_async(v9, v11);

  objc_destroyWeak(v13);
}

void sub_1002C64D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002C64F0(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "statusHandler:pairedDevice:timestamp:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(double *)(a1 + 48));

}

void sub_1002C6534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1002C6548(uint64_t a1, void *a2, int a3, double a4)
{
  void *v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11[3];
  int v12;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "silo"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "queue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002C6624;
  v10[3] = &unk_100365748;
  objc_copyWeak(v11, (id *)(a1 + 40));
  v12 = a3;
  v11[1] = *(id *)&a4;
  v11[2] = a2;
  dispatch_async(v9, v10);

  objc_destroyWeak(v11);
}

void sub_1002C6614(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C6624(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onCompanionConnectionStatusUpdate:cftime:sputime:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48), *(double *)(a1 + 40));

}

void sub_1002C6668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

id sub_1002C667C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "notifyCompanionOfForwardMsgCompatibility");
}

void sub_1002C680C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002C6998(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C6BC0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002C6D78(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C6E4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C6F10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C7080(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C730C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002C7410(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C7530(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C7600(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C7704(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C786C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "Companion");
  v2 = (void *)qword_100387388;
  qword_100387388 = (uint64_t)v1;

}

void sub_1002C789C(NSObject **a1)
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[40];

  v2 = sub_1002C4190();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    sub_1000249BC();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Invalid client mode\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x26u);
  }

  v4 = sub_1002C4190();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    sub_1000249BC();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Invalid client mode", "{\"msg%{public}.0s\":\"Invalid client mode\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x26u);
  }

  v6 = sub_1002C4190();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  *a1 = v7;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    sub_1000249BC();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Invalid client mode\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x26u);
  }
}

void sub_1002C7A78(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  CSPlatformInfo *v4;
  void *v5;
  int v6;
  uint64_t v7;

  if (qword_100387350 != -1)
    dispatch_once(&qword_100387350, &stru_100365858);
  v2 = qword_100387358;
  if (os_log_type_enabled((os_log_t)qword_100387358, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 134217984;
    v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "creating CSPlatformInfo shared Instance with hardware %lu", (uint8_t *)&v6, 0xCu);
  }
  v4 = -[CSPlatformInfo initWithHardware:]([CSPlatformInfo alloc], "initWithHardware:", *(_QWORD *)(a1 + 32));
  v5 = (void *)qword_100389430;
  qword_100389430 = (uint64_t)v4;

}

id sub_1002C7B64()
{
  if (qword_100387350 != -1)
    dispatch_once(&qword_100387350, &stru_100365858);
  return (id)qword_100387358;
}

void sub_1002C7BE4(id a1)
{
  NSObject *v1;
  CSPlatformInfo *v2;
  void *v3;
  uint8_t v4[16];

  if (qword_100387350 != -1)
    dispatch_once(&qword_100387350, &stru_100365858);
  v1 = qword_100387358;
  if (os_log_type_enabled((os_log_t)qword_100387358, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "creating CSPlatformInfo shared instance", v4, 2u);
  }
  v2 = objc_alloc_init(CSPlatformInfo);
  v3 = (void *)qword_100389430;
  qword_100389430 = (uint64_t)v2;

}

void sub_1002C8C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002C8D40(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C8D94(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C9114(id a1)
{
  const __CFString *v1;
  const __CFString *v2;
  CFTypeID v3;
  int v4;

  v1 = (const __CFString *)MGCopyAnswer(CFSTR("ReleaseType"), 0);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFStringGetTypeID())
    {
      if (CFStringCompare(v2, CFSTR("Beta"), 0) == kCFCompareEqualTo)
      {
        v4 = 0;
        goto LABEL_18;
      }
      if (CFStringCompare(v2, CFSTR("Carrier"), 0) == kCFCompareEqualTo)
      {
        v4 = 1;
        goto LABEL_18;
      }
      if (CFStringCompare(v2, CFSTR("Internal"), 0) == kCFCompareEqualTo)
      {
        v4 = 2;
        goto LABEL_18;
      }
      if (CFStringCompare(v2, CFSTR("Desense"), 0) == kCFCompareEqualTo)
      {
        v4 = 3;
        goto LABEL_18;
      }
      if (CFStringCompare(v2, CFSTR("Lite Internal"), 0) == kCFCompareEqualTo)
      {
        v4 = 4;
        goto LABEL_18;
      }
      if (CFStringCompare(v2, CFSTR("Vendor"), 0) == kCFCompareEqualTo)
      {
        v4 = 5;
        goto LABEL_18;
      }
      if (CFStringCompare(v2, CFSTR("NonUI"), 0) == kCFCompareEqualTo)
      {
        v4 = 6;
LABEL_18:
        dword_1003891B8 = v4;
      }
    }
    CFRelease(v2);
  }
}

void sub_1002C9390(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002C93A8(id a1)
{
  const __CFBoolean *v1;
  const __CFBoolean *v2;
  CFTypeID v3;

  v1 = (const __CFBoolean *)MGCopyAnswer(CFSTR("InternalBuild"), 0);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == CFBooleanGetTypeID() && CFBooleanGetValue(v2) == 1)
      byte_100389448 = 1;
    CFRelease(v2);
  }
}

void sub_1002C9518(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "getSystem:", "hw.model"));
  v2 = (void *)qword_100389458;
  qword_100389458 = v1;

}

void sub_1002C9640(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_1002C973C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1002C97D8(uint64_t a1)
{
  const __CFBoolean *v2;
  const __CFBoolean *v3;
  CFTypeID v4;
  uint64_t v5;

  v2 = (const __CFBoolean *)MGCopyAnswer(CFSTR("IsSimulator"), 0);
  if (v2)
  {
    v3 = v2;
    v4 = CFGetTypeID(v2);
    if (v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3))
      v5 = 24;
    else
      v5 = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "queryEmbeddedSystemHardware");
    qword_100389468 = v5;
    CFRelease(v3);
  }
  else
  {
    qword_100389468 = (uint64_t)objc_msgSend(*(id *)(a1 + 32), "queryEmbeddedSystemHardware");
  }
}

void sub_1002CC184(id a1)
{
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  void *CFProperty;

  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    CFProperty = (void *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("IOPlatformSerialNumber"), kCFAllocatorDefault, 0);
    if (CFProperty)
      objc_storeStrong((id *)&qword_100389478, CFProperty);
    IOObjectRelease(v3);
  }
}

void sub_1002CC22C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "Platform");
  v2 = (void *)qword_100387358;
  qword_100387358 = (uint64_t)v1;

}

void sub_1002CC2E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002CC4A4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002CC9A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1002CCCB0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,id location,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  if (a29 < 0)
    operator delete(__p);
  operator delete();
}

void sub_1002CCD54(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  id WeakRetained;
  CSConnection *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  CSConnection *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  void *v17;
  CSConnectionMessage *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  CSConnectionMessage *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  std::__shared_weak_count *v31;
  uint64_t v32;
  std::__shared_weak_count *v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  std::__shared_weak_count *v37;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (*a2)
    operator new();
  v37 = 0;
  *a2 = 0;
  v6 = [CSConnection alloc];
  v34 = 0;
  v35 = 0;
  v7 = (std::__shared_weak_count *)a3[1];
  v32 = *a3;
  v33 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v10 = -[CSConnection initWithConnection:message:delegate:](v6, "initWithConnection:message:delegate:", &v34, &v32, WeakRetained);
  v11 = v33;
  if (v33)
  {
    v12 = (unint64_t *)&v33->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v35;
  if (v35)
  {
    v15 = (unint64_t *)&v35->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "mutableConnections"));
  objc_msgSend(v17, "addObject:", v10);

  -[CSConnection start](v10, "start");
  v18 = [CSConnectionMessage alloc];
  v19 = (std::__shared_weak_count *)a3[1];
  v30 = *a3;
  v31 = v19;
  if (v19)
  {
    v20 = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(v20);
    while (__stxr(v21 + 1, v20));
  }
  v22 = -[CSConnectionMessage initWithConnectionMessage:](v18, "initWithConnectionMessage:", &v30);
  v23 = v31;
  if (v31)
  {
    v24 = (unint64_t *)&v31->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate", v30));
  objc_msgSend(v26, "connectionCreated:withMessage:", v10, v22);

  v27 = v37;
  if (v37)
  {
    v28 = (unint64_t *)&v37->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
      std::__shared_weak_count::__release_weak(v27);
    }
  }

}

void sub_1002CCFAC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CD090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;

  a9.super_class = (Class)CSConnectionServer;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

CLConnectionServer *sub_1002CD0CC(CLConnectionServer **a1, CLConnectionServer *a2)
{
  CLConnectionServer *result;

  result = *a1;
  *a1 = a2;
  if (result)
  {
    CLConnectionServer::~CLConnectionServer(result);
    operator delete();
  }
  return result;
}

void sub_1002CD170(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CD2F0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1002CD460(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002CD5C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002CD6A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "CSConnection");
  v2 = (void *)qword_100387398;
  qword_100387398 = (uint64_t)v1;

}

void sub_1002CD6D8(std::__shared_weak_count *a1)
{
  std::__shared_weak_count::~__shared_weak_count(a1);
  operator delete();
}

CLConnection *sub_1002CD6FC(uint64_t a1)
{
  CLConnection *result;

  result = *(CLConnection **)(a1 + 24);
  if (result)
    return (CLConnection *)CLConnection::deferredDelete(result);
  return result;
}

uint64_t sub_1002CD71C(uint64_t a1, uint64_t a2)
{
    return a1 + 24;
  else
    return 0;
}

void sub_1002CD79C(id a1)
{
  CSPower *v1;
  void *v2;

  v1 = objc_alloc_init(CSPower);
  v2 = (void *)qword_100389490;
  qword_100389490 = (uint64_t)v1;

}

void sub_1002CD988(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  _Unwind_Resume(a1);
}

void sub_1002CDA24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)CSPower;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_1002CDB68(uint64_t a1)
{
  NSObject *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t buf[4];
  int v14;

  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v2 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
    *(_DWORD *)buf = 67109120;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "createPowerAssertion ref %d", buf, 8u);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isAssertionActive") & 1) == 0)
  {
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
    {
      if (qword_1003873D0 != -1)
        dispatch_once(&qword_1003873D0, &stru_100365998);
      v4 = qword_1003873D8;
      if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "os_transaction_object not nil before power assertion", buf, 2u);
      }
    }
    else
    {
      v5 = os_transaction_create(objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = CFStringCreateWithFormat(0, 0, CFSTR("%@(%s)"), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    if (&_CPPowerAssertionCreate)
    {
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = CPPowerAssertionCreate(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 180.0);
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 24));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
      {
        if (qword_1003873D0 != -1)
          dispatch_once(&qword_1003873D0, &stru_100365998);
        v8 = qword_1003873D8;
        if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          v9 = "Power assertion failed";
          v10 = v8;
          v11 = OS_LOG_TYPE_FAULT;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, 2u);
        }
      }
    }
    else
    {
      if (qword_1003873D0 != -1)
        dispatch_once(&qword_1003873D0, &stru_100365998);
      v12 = qword_1003873D8;
      if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v9 = "Power assertion failed, no CPPowerAssertionCreate";
        v10 = v12;
        v11 = OS_LOG_TYPE_ERROR;
        goto LABEL_22;
      }
    }
  }
}

void sub_1002CDE7C(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _DWORD v13[2];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v2 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v13[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "releasePowerAssertion", (uint8_t *)v13, 2u);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "isAssertionActive") & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_DWORD *)(v3 + 48);
    if (!v4)
    {
      if (qword_1003873D0 != -1)
        dispatch_once(&qword_1003873D0, &stru_100365998);
      v5 = qword_1003873D8;
      if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "double release of power assertion", (uint8_t *)v13, 2u);
      }
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(_DWORD *)(v3 + 48);
    }
    *(_DWORD *)(v3 + 48) = v4 - 1;
    if (qword_1003873D0 != -1)
      dispatch_once(&qword_1003873D0, &stru_100365998);
    v6 = qword_1003873D8;
    if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48);
      v13[0] = 67109120;
      v13[1] = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "releasePowerAssertion ref %d", (uint8_t *)v13, 8u);
    }
    v8 = *(_QWORD *)(a1 + 32);
    if (*(int *)(v8 + 48) <= 0)
    {
      CFRelease(*(CFTypeRef *)(v8 + 16));
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = 0;

LABEL_27:
      *(_DWORD *)(*(_QWORD *)(a1 + 32) + 48) = 0;
    }
  }
  else
  {
    if (qword_1003873D0 != -1)
      dispatch_once(&qword_1003873D0, &stru_100365998);
    v11 = qword_1003873D8;
    if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Attempting to release power assertion when there is none", (uint8_t *)v13, 2u);
    }
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48))
    {
      if (qword_1003873D0 != -1)
        dispatch_once(&qword_1003873D0, &stru_100365998);
      v12 = qword_1003873D8;
      if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v13[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "ref count is not zero but there is no power assertion", (uint8_t *)v13, 2u);
      }
      goto LABEL_27;
    }
  }
}

void sub_1002CE198(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const void *v4;
  const void *v5;
  uint8_t v6[16];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v2 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "releaseAllCFObjects", v6, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(const void **)(v3 + 24);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v3 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(const void **)(v3 + 16);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
}

void sub_1002CE33C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CE42C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CE49C(uint64_t a1)
{
  NSObject *v2;
  int v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  id *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  _DWORD v14[2];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v2 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_DWORD *)(a1 + 48);
    v14[0] = 67109120;
    v14[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "powerlogActivity reason:%d", (uint8_t *)v14, 8u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectAtIndex:", *(unsigned int *)(a1 + 48)));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v6 = v4 == v5;

  v7 = *(id **)(a1 + 32);
  if (v6)
  {
    v11 = v7[8];
    v12 = *(unsigned int *)(a1 + 48);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
    objc_msgSend(v11, "replaceObjectAtIndex:withObject:", v12, v13);

  }
  else
  {
    v8 = *(unsigned int *)(a1 + 48);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7[8], "objectAtIndex:", v8));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", *(double *)(a1 + 40)));
    objc_msgSend(v7, "sendPowerlogMetrics:start:end:", v8, v9, v10);

    objc_msgSend(*(id *)(a1 + 32), "clearPowerloggingInfo:", *(unsigned int *)(a1 + 48));
  }
}

void sub_1002CE644(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CE7E0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1002CE874(uint64_t a1)
{
  NSObject *v2;
  int v3;
  int v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  double Current;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unsigned int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  CFAbsoluteTime v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  _DWORD v28[2];

  if (qword_1003873D0 != -1)
    dispatch_once(&qword_1003873D0, &stru_100365998);
  v2 = qword_1003873D8;
  if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_DWORD *)(a1 + 40);
    v28[0] = 67109120;
    v28[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "onKappaSessionUpdate type:%d", (uint8_t *)v28, 8u);
  }
  v4 = *(_DWORD *)(a1 + 40);
  if (v4 == 3)
  {
    if (!*(_DWORD *)(*(_QWORD *)(a1 + 32) + 52))
    {
      if (qword_1003873D0 != -1)
        dispatch_once(&qword_1003873D0, &stru_100365998);
      v9 = qword_1003873D8;
      if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "No powerlogging sessionType set before session finished", (uint8_t *)v28, 2u);
      }
    }
    Current = CFAbsoluteTimeGetCurrent();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(unsigned int *)(v11 + 52);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v11 + 64), "objectAtIndex:", v12));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    objc_msgSend((id)v11, "sendPowerlogMetrics:start:end:", v12, v13, v14);

    objc_msgSend(*(id *)(a1 + 32), "clearPowerloggingInfo:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 52));
  }
  else if (v4 == 2)
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(_DWORD *)(v15 + 52);
    if (!v16)
    {
      if (qword_1003873D0 != -1)
        dispatch_once(&qword_1003873D0, &stru_100365998);
      v17 = qword_1003873D8;
      if (os_log_type_enabled((os_log_t)qword_1003873D8, OS_LOG_TYPE_FAULT))
      {
        LOWORD(v28[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "No powerlogging sessionType set before trigger found", (uint8_t *)v28, 2u);
      }
      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(_DWORD *)(v15 + 52);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(v15 + 64), "objectAtIndex:", v16));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v20 = v18 == v19;

    if (v20)
    {
      v21 = CFAbsoluteTimeGetCurrent();
      v22 = *(_QWORD *)(a1 + 32);
      v23 = *(void **)(v22 + 64);
      v24 = *(unsigned int *)(v22 + 52);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v21));
      objc_msgSend(v23, "replaceObjectAtIndex:withObject:", v24, v25);

    }
  }
  else
  {
    if (v4)
      return;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
    v6 = objc_msgSend(v5, "isKappaDetectionDevice");

    if (v6)
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 1;
    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[CSPlatformInfo sharedInstance](CSPlatformInfo, "sharedInstance"));
      v27 = objc_msgSend(v26, "isKappaLoggingDevice");

      if (!v27)
        return;
      v7 = *(_QWORD *)(a1 + 32);
      v8 = 2;
    }
    *(_DWORD *)(v7 + 52) = v8;
  }
}

void sub_1002CEB84(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CEBF4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "Power");
  v2 = (void *)qword_1003873D8;
  qword_1003873D8 = (uint64_t)v1;

}

CSHSM::State *CSHSM::State::State(CSHSM::State *this, const char *a2)
{
  *(_QWORD *)this = &off_1003659C8;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_QWORD *)this + 5) = a2;
  CSHSM::State::initializeChain(this);
  return this;
}

void sub_1002CEC64(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 16);
  if (v3)
  {
    *(_QWORD *)(v1 + 24) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void CSHSM::State::initializeChain(CSHSM::State *this)
{
  char **v2;
  char *v3;
  CSHSM::State **v4;
  CSHSM::State *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  CSHSM::State **v12;
  char *v13;
  char *v14;
  CSHSM::State *v15;

  if (this)
  {
    v2 = (char **)((char *)this + 16);
    v3 = (char *)this + 32;
    v4 = (CSHSM::State **)*((_QWORD *)this + 3);
    v5 = this;
    do
    {
      v6 = *((_QWORD *)this + 4);
      if ((unint64_t)v4 >= v6)
      {
        v7 = ((char *)v4 - *v2) >> 3;
        if ((unint64_t)(v7 + 1) >> 61)
          sub_10000D5F8();
        v8 = v6 - (_QWORD)*v2;
        v9 = v8 >> 2;
        if (v8 >> 2 <= (unint64_t)(v7 + 1))
          v9 = v7 + 1;
        if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF8)
          v10 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v10 = v9;
        if (v10)
          v11 = (char *)sub_10000D60C((uint64_t)v3, v10);
        else
          v11 = 0;
        v12 = (CSHSM::State **)&v11[8 * v7];
        *v12 = v5;
        v4 = v12 + 1;
        v14 = (char *)*((_QWORD *)this + 2);
        v13 = (char *)*((_QWORD *)this + 3);
        if (v13 != v14)
        {
          do
          {
            v15 = (CSHSM::State *)*((_QWORD *)v13 - 1);
            v13 -= 8;
            *--v12 = v15;
          }
          while (v13 != v14);
          v13 = *v2;
        }
        *((_QWORD *)this + 2) = v12;
        *((_QWORD *)this + 3) = v4;
        *((_QWORD *)this + 4) = &v11[8 * v10];
        if (v13)
          operator delete(v13);
      }
      else
      {
        *v4++ = v5;
      }
      *((_QWORD *)this + 3) = v4;
      v5 = (CSHSM::State *)*((_QWORD *)v5 + 1);
    }
    while (v5);
  }
}

CSHSM::State *CSHSM::State::State(CSHSM::State *this, const char *a2, CSHSM::State *a3)
{
  *(_QWORD *)this = &off_1003659C8;
  *((_QWORD *)this + 1) = a3;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = a2;
  CSHSM::State::initializeChain(this);
  return this;
}

void sub_1002CEDC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void **v2;
  void **v3;
  void *v5;

  v3 = v2;
  v5 = *v3;
  if (*v3)
  {
    *(_QWORD *)(v1 + 24) = v5;
    operator delete(v5);
  }
  _Unwind_Resume(exception_object);
}

uint64_t CSHSM::State::initial(CSHSM::State *this)
{
  return 0;
}

uint64_t CSHSM::State::trigger(CSHSM::State *this, unint64_t a2, const void *a3)
{
  return 0;
}

BOOL CSHSM::isIn(CSHSM *this, CSHSM::State *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  CSHSM::State *v5;
  _BOOL8 result;
  BOOL v7;

  v3 = *(_QWORD *)(*(_QWORD *)this + 16);
  v2 = *(_QWORD *)(*(_QWORD *)this + 24);
  if (v3 == v2)
    return 0;
  v4 = v3 + 8;
  do
  {
    v5 = *(CSHSM::State **)(v4 - 8);
    result = v5 == a2;
    v7 = v5 == a2 || v4 == v2;
    v4 += 8;
  }
  while (!v7);
  return result;
}

CSHSM::State *CSHSM::initial(CSHSM *this, CSHSM::State *a2)
{
  CSHSM::State *v4;
  NSObject *v5;
  uint64_t v6;
  CSHSM::State *result;
  uint8_t buf[4];
  uint64_t v9;

  v4 = a2;
  do
  {
    *(_QWORD *)this = v4;
    v5 = *((_QWORD *)this + 1);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *((_QWORD *)v4 + 5);
      *(_DWORD *)buf = 136315138;
      v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "initial, enter(%s)", buf, 0xCu);
      v4 = *(CSHSM::State **)this;
    }
    (*(void (**)(CSHSM::State *, _QWORD, _QWORD))(*(_QWORD *)v4 + 24))(v4, 0, 0);
    result = (CSHSM::State *)(*(uint64_t (**)(CSHSM::State *))(*(_QWORD *)a2 + 8))(a2);
    v4 = result;
  }
  while (result);
  return result;
}

void CSHSM::signal(CSHSM *this, uint64_t a2, const void *a3)
{
  _QWORD *v3;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  char *v12;
  BOOL v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  char *i;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  void *__p;
  uint64_t v24;
  void *v25;
  char *v26;
  uint64_t v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;

  v3 = *(_QWORD **)this;
  if (*(_QWORD *)this)
  {
    while (1)
    {
      v7 = (*(uint64_t (**)(_QWORD *, uint64_t, const void *))*v3)(v3, a2, a3);
      if (v7)
        break;
      v3 = (_QWORD *)v3[1];
      if (!v3)
        return;
    }
    v8 = v7;
    if ((_QWORD *)v7 == v3)
    {
      (*(void (**)(_QWORD *, uint64_t, const void *))(*v3 + 16))(v3, a2, a3);
    }
    else
    {
      v9 = *(_QWORD **)this;
      v26 = 0;
      v27 = 0;
      v25 = 0;
      sub_1002CF300(&v25, (const void *)v9[2], v9[3], (uint64_t)(v9[3] - v9[2]) >> 3);
      __p = 0;
      v24 = 0;
      v22 = 0;
      sub_1002CF300(&v22, *(const void **)(v8 + 16), *(_QWORD *)(v8 + 24), (uint64_t)(*(_QWORD *)(v8 + 24) - *(_QWORD *)(v8 + 16)) >> 3);
      v10 = v25;
      if (v25 != v26)
      {
        v11 = (char *)__p - 8;
        v12 = v26 - 8;
        while (v11 + 1 != (_QWORD *)v22 && *(_QWORD *)v12 == *v11)
        {
          v26 = v12;
          __p = v11--;
          v13 = v12 == v25;
          v12 -= 8;
          if (v13)
            goto LABEL_18;
        }
        v14 = v12 + 8;
        if (v12 + 8 != v25)
        {
          do
          {
            v15 = *v10;
            (*(void (**)(_QWORD, uint64_t, const void *))(*(_QWORD *)*v10 + 32))(*v10, a2, a3);
            v16 = *((_QWORD *)this + 1);
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              v17 = *(_QWORD *)(v15 + 40);
              *(_DWORD *)buf = 134218242;
              v29 = a2;
              v30 = 2080;
              v31 = v17;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "event %llu, exit(%s)", buf, 0x16u);
            }
            ++v10;
          }
          while (v14 != v10);
        }
      }
LABEL_18:
      (*(void (**)(_QWORD *, uint64_t, const void *))(*v3 + 16))(v3, a2, a3);
      for (i = (char *)__p; i != v22; i -= 8)
      {
        v19 = *((_QWORD *)this + 1);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = *(_QWORD *)(*((_QWORD *)i - 1) + 40);
          *(_DWORD *)buf = 134218242;
          v29 = a2;
          v30 = 2080;
          v31 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "event %llu, enter(%s)", buf, 0x16u);
        }
        v21 = *((_QWORD *)i - 1);
        (*(void (**)(uint64_t, uint64_t, const void *))(*(_QWORD *)v21 + 24))(v21, a2, a3);
      }
      *(_QWORD *)this = v8;
      if (i)
      {
        __p = i;
        operator delete(i);
      }
      if (v25)
      {
        v26 = (char *)v25;
        operator delete(v25);
      }
    }
  }
}

void sub_1002CF234(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, uint64_t a13, void *a14, uint64_t a15)
{
  if (__p)
    operator delete(__p);
  if (a14)
    operator delete(a14);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_1002CF278(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1003659C8;
  v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  return a1;
}

void sub_1002CF2B4(_QWORD *a1)
{
  void *v2;

  *a1 = &off_1003659C8;
  v2 = (void *)a1[2];
  if (v2)
  {
    a1[3] = v2;
    operator delete(v2);
  }
  operator delete();
}

_QWORD *sub_1002CF300(_QWORD *result, const void *a2, uint64_t a3, unint64_t a4)
{
  _QWORD *v6;
  uint64_t v7;
  size_t v8;

  if (a4)
  {
    v6 = result;
    result = sub_10000F450(result, a4);
    v7 = v6[1];
    v8 = a3 - (_QWORD)a2;
    if (v8)
      result = memmove((void *)v6[1], a2, v8);
    v6[1] = v7 + v8;
  }
  return result;
}

void sub_1002CF35C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

uint64_t getKappaToken(int a1)
{
  return sub_1002CF3D4(a1, CFSTR("CSKappaTokenReplenishTimestamp"), CFSTR("CSKappaTokenCount"), CFSTR("CSKappaTokenReplenishPeriod"), CFSTR("CSKappaTokenCountDefault"), 1);
}

uint64_t sub_1002CF3D4(int a1, void *a2, void *a3, void *a4, void *a5, int a6)
{
  uint64_t v6;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  id v21;
  double Current;
  unsigned int v23;
  uint64_t v24;
  NSObject *v25;
  double v26;
  NSObject *v27;
  int v29;
  double v30;
  __int16 v31;
  int v32;

  LODWORD(v6) = a6;
  v11 = a2;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSPermissions sharedInstance](CSPermissions, "sharedInstance"));
  v16 = objc_msgSend(v15, "isAuthorizedToCollectData");

  if ((v16 & 1) != 0)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSPersistentConfiguration sharedConfiguration](CSPersistentConfiguration, "sharedConfiguration"));
    objc_msgSend(v17, "doubleForKey:", v11);
    v19 = v18;
    v20 = (uint64_t)objc_msgSend(v17, "integerForKey:", v12);
    v21 = objc_msgSend(v17, "integerForKey:", v13);
    Current = CFAbsoluteTimeGetCurrent();
    v23 = objc_msgSend(v17, "integerForKey:", v14);
    if (v23)
      v6 = v23;
    else
      v6 = v6;
    if (v21)
      v24 = (uint64_t)v21;
    else
      v24 = 86400;
    if (qword_1003872F0 != -1)
      dispatch_once(&qword_1003872F0, &stru_100365A10);
    v25 = qword_1003872F8;
    if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
    {
      if (v19 == 0.0)
        v26 = (double)v24;
      else
        v26 = Current - v19;
      v29 = 134218240;
      v30 = v26;
      v31 = 1024;
      v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "tokenTS delta %f threshold %d", (uint8_t *)&v29, 0x12u);
    }
    if (v19 == 0.0 || Current - v19 >= (double)v24)
    {
      if ((a1 & 1) == 0)
        goto LABEL_28;
    }
    else
    {
      if (v20 < 1 || v20 <= v6)
      {
        if (v20 < 1)
        {
          v6 = 0;
        }
        else
        {
          if (a1)
            objc_msgSend(v17, "setInteger:forKey:", v20 - 1, v12);
          v6 = v20;
        }
        goto LABEL_28;
      }
      if (!a1)
      {
LABEL_28:

        goto LABEL_29;
      }
    }
    objc_msgSend(v17, "setDouble:forKey:", v11, Current);
    objc_msgSend(v17, "setInteger:forKey:", (v6 - 1), v12);
    goto LABEL_28;
  }
  if (qword_1003872F0 != -1)
    dispatch_once(&qword_1003872F0, &stru_100365A10);
  v27 = qword_1003872F8;
  if (os_log_type_enabled((os_log_t)qword_1003872F8, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v29) = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Not authorized to collect data, returning 0 tokens", (uint8_t *)&v29, 2u);
  }
  v6 = 0;
LABEL_29:

  return v6;
}

void sub_1002CF6A0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

uint64_t getMartyPunchThruToken(int a1)
{
  return sub_1002CF3D4(a1, CFSTR("CSMartyPunchThruTokenReplenishTimestamp"), CFSTR("CSMartyPunchThruTokenCount"), CFSTR("CSMartyPunchThruTokenReplenishPeriod"), CFSTR("CSMartyPunchThruTokenCountDefault"), 10);
}

uint64_t getMartyToken(int a1)
{
  return sub_1002CF3D4(a1, CFSTR("CSMartyTokenReplenishTimestamp"), CFSTR("CSMartyTokenCount"), CFSTR("CSMartyTokenReplenishPeriod"), CFSTR("CSMartyTokenCountDefault"), 2);
}

uint64_t getMartyAlphaCrashToken(int a1)
{
  return sub_1002CF3D4(a1, CFSTR("CSMartyAlphaCrashTokenReplenishTimestamp"), CFSTR("CSMartyAlphaCrashTokenCount"), CFSTR("CSMartyAlphaCrashTokenReplenishPeriod"), CFSTR("CSMartyAlphaCrashTokenCountDefault"), 2);
}

uint64_t getMartyEarlyCrashToken(int a1)
{
  return sub_1002CF3D4(a1, CFSTR("CSMartyEarlyCrashTokenReplenishTimestamp"), CFSTR("CSMartyEarlyCrashTokenCount"), CFSTR("CSMartyEarlyCrashTokenReplenishPeriod"), CFSTR("CSMartyEarlyCrashTokenCountDefault"), 2);
}

uint64_t getIgneousToken(int a1)
{
  return sub_1002CF3D4(a1, CFSTR("CSIgneousTokenReplenishTimestamp"), CFSTR("CSIgneousTokenCount"), CFSTR("CSIgneousTokenReplenishPeriod"), CFSTR("CSIgneousTokenCountDefault"), 3);
}

void sub_1002CF7B8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "AnomalyEvent");
  v2 = (void *)qword_1003872F8;
  qword_1003872F8 = (uint64_t)v1;

}

void sub_1002CF934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10000A718((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1002CFA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10000A718((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1002CFB00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10000A718((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1002CFBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  sub_10000A718((uint64_t)&a9);

  _Unwind_Resume(a1);
}

void sub_1002CFCC0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CFD10(id a1)
{
  CSPersistentConfiguration *v1;
  void *v2;

  v1 = objc_alloc_init(CSPersistentConfiguration);
  v2 = (void *)qword_1003894A0;
  qword_1003894A0 = (uint64_t)v1;

}

void sub_1002CFE64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002CFEF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1002CFFF0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002D026C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1002D0374(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D0400(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D0490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1002D051C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1002D05A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1002D062C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1002D06B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1002D078C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D085C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1002D0940(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1002D0A28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v4 = v3;

  _Unwind_Resume(a1);
}

void sub_1002D0B08(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1002D0CDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, __int16 buf)
{
  void *v11;
  void *v12;
  void *v13;
  id v16;
  void *v17;
  unsigned int v18;
  id v19;
  NSObject *v20;

  if (a2 == 1)
  {
    v16 = objc_begin_catch(a1);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "name"));
    v18 = objc_msgSend(v17, "isEqual:", NSRangeException);

    if (v18)
    {
      v19 = sub_1002D0DF8();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Index out of bounds for server configuration value", (uint8_t *)&buf, 2u);
      }

      objc_end_catch();
      JUMPOUT(0x1002D0CA8);
    }
    objc_exception_throw(objc_retainAutorelease(v16));
  }

  _Unwind_Resume(a1);
}

id sub_1002D0DF8()
{
  if (qword_100387430 != -1)
    dispatch_once(&qword_100387430, &stru_100365A98);
  return (id)qword_100387438;
}

void sub_1002D0FF0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D10D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D1220(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D12CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D1358(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1002D1470(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002D181C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_1002D18A0(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *WeakRetained;
  void *v5;
  void *v6;
  xpc_object_t v7;
  void *v8;
  _xpc_activity_s *activity;

  activity = a2;
  if (!xpc_activity_get_state(activity))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CSPower sharedInstance](CSPower, "sharedInstance"));
    objc_msgSend(v3, "powerlogActivity:state:", 3, CFAbsoluteTimeGetCurrent());

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKey:", CFSTR("CLPersistentConfigurationServerDefaults")));
    v6 = v5;
    if (v5 && objc_msgSend(v5, "unsignedLongLongValue") != (id)WeakRetained[3])
    {
      v7 = xpc_activity_copy_criteria(activity);
      xpc_dictionary_set_int64(v7, XPC_ACTIVITY_INTERVAL, (int64_t)objc_msgSend(v6, "unsignedLongLongValue"));
      xpc_activity_set_criteria(activity, v7);
      WeakRetained[3] = objc_msgSend(v6, "unsignedLongLongValue");

    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSPower sharedInstance](CSPower, "sharedInstance"));
    objc_msgSend(v8, "powerlogActivity:state:", 3, CFAbsoluteTimeGetCurrent());

  }
}

void sub_1002D19B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1002D1A30(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "Alg");
  v2 = (void *)qword_100387318;
  qword_100387318 = (uint64_t)v1;

}

void sub_1002D1A60(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "PersistentConfiguration");
  v2 = (void *)qword_100387438;
  qword_100387438 = (uint64_t)v1;

}

void sub_1002D1AD0(id a1)
{
  NSObject *v1;
  CSPermissions *v2;
  void *v3;
  uint8_t v4[16];

  if (qword_100387360 != -1)
    dispatch_once(&qword_100387360, &stru_100365AD8);
  v1 = qword_100387368;
  if (os_log_type_enabled((os_log_t)qword_100387368, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "creating CSPermissions", v4, 2u);
  }
  v2 = objc_alloc_init(CSPermissions);
  v3 = (void *)qword_1003894A8;
  qword_1003894A8 = (uint64_t)v2;

}

void sub_1002D1BC4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002D1D10(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002D1F0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002D1F34(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "Permissions");
  v2 = (void *)qword_100387368;
  qword_100387368 = (uint64_t)v1;

}

void sub_1002D22F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,int a26,__int16 a27,char a28,char a29)
{
  void *v29;
  void *v30;
  void *v31;

  _Unwind_Resume(a1);
}

void sub_1002D23C4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  objc_msgSend(v1, "connectionHandleDisconnection:", WeakRetained);

}

void sub_1002D240C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1002D242C(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  objc_msgSend(v1, "connectionHandleInterruption:", WeakRetained);

}

void sub_1002D2474(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1002D2494(uint64_t a1, uint64_t *a2)
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  CSConnectionMessage *v7;
  std::__shared_weak_count *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  CSConnectionMessage *v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  uint64_t v15;
  std::__shared_weak_count *v16;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "name"));
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Connection, name: %@, pid: %d"), v4, objc_msgSend(WeakRetained, "remotePid"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "delegate"));
  v7 = [CSConnectionMessage alloc];
  v8 = (std::__shared_weak_count *)a2[1];
  v15 = *a2;
  v16 = v8;
  if (v8)
  {
    p_shared_owners = (unint64_t *)&v8->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  v11 = -[CSConnectionMessage initWithConnectionMessage:](v7, "initWithConnectionMessage:", &v15);
  objc_msgSend(v6, "connection:handleMessage:", WeakRetained, v11);

  v12 = v16;
  if (v16)
  {
    v13 = (unint64_t *)&v16->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }

}

void sub_1002D25A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  void *v3;
  void *v4;
  void *v5;
  va_list va;

  va_start(va, a3);

  sub_10000A718((uint64_t)va);
  _Unwind_Resume(a1);
}

void sub_1002D269C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)CSConnection;
  -[_Unwind_Exception dealloc](&a9, "dealloc");
  _Unwind_Resume(a1);
}

void sub_1002D2730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10000A718((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1002D2850(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17)
{
  if (a17 < 0)
    operator delete(__p);
  sub_10000A718((uint64_t)&a10);
  _Unwind_Resume(a1);
}

void sub_1002D294C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_10000A718((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1002D2ABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, void *__p, uint64_t a13, int a14, __int16 a15, char a16, char a17, char a18)
{
  void *v18;
  uint64_t v19;

  sub_10000A718((uint64_t)&a10);
  sub_10000A718((uint64_t)&__p);
  sub_10000A718((uint64_t)&a18);

  _Unwind_Resume(a1);
}

void sub_1002D2CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, char a14, uint64_t a15, void *__p, uint64_t a17, int a18, __int16 a19, char a20,char a21)
{
  void *v21;
  void *v22;
  uint64_t v23;

  sub_10000A718((uint64_t)&a14);
  sub_10000A718((uint64_t)&__p);
  sub_10000A718(v23 - 64);

  _Unwind_Resume(a1);
}

void sub_1002D2D3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  CSConnectionMessage *v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  CSConnectionMessage *v8;
  std::__shared_weak_count *v9;
  unint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = [CSConnectionMessage alloc];
  v5 = (std::__shared_weak_count *)a2[1];
  v12 = *a2;
  v13 = v5;
  if (v5)
  {
    p_shared_owners = (unint64_t *)&v5->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  v8 = -[CSConnectionMessage initWithConnectionMessage:](v4, "initWithConnectionMessage:", &v12);
  (*(void (**)(uint64_t, CSConnectionMessage *))(v3 + 16))(v3, v8);

  v9 = v13;
  if (v13)
  {
    v10 = (unint64_t *)&v13->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

void sub_1002D2DE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;

  sub_10000A718((uint64_t)&a9);
  _Unwind_Resume(a1);
}

void sub_1002D2ED8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1002D2F54(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.anomalydetectiond", "CSConnection");
  v2 = (void *)qword_100387398;
  qword_100387398 = (uint64_t)v1;

}

_QWORD *sub_1002D2F84@<X0>(uint64_t a1@<X1>, _QWORD *a2@<X2>, _QWORD *a3@<X8>)
{
  _QWORD *v6;
  _QWORD *result;

  v6 = operator new(0x70uLL);
  result = sub_1002D2FE4(v6, a1, a2);
  *a3 = v6 + 3;
  a3[1] = v6;
  return result;
}

void sub_1002D2FD0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_1002D2FE4(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  a1[1] = 0;
  a1[2] = 0;
  *a1 = off_10035C8D0;
  CLConnectionMessage::CLConnectionMessage(a1 + 3, a2, *a3);
  return a1;
}

void sub_1002D3020(_Unwind_Exception *a1)
{
  std::__shared_weak_count *v1;

  std::__shared_weak_count::~__shared_weak_count(v1);
  _Unwind_Resume(a1);
}

void sub_1002D3034()
{
  __assert_rtn("-[CSHealthWrapEncryptor _writeStream:length:hash:error:]", "CSHealthWrapEncryptor.m", 265, "length < UINT32_MAX");
}

void sub_1002D305C()
{
  __assert_rtn("-[CSHealthWrapEncryptor _writeStream:length:hash:error:]", "CSHealthWrapEncryptor.m", 278, "(size_t)bytesWritten <= length");
}

uint64_t sub_1002D30A4()
{
  id v0;
  NSObject *v1;
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t buf[40];

  v0 = sub_100007A6C();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    sub_10000A8E8();
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"Q empty\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v2 = sub_100007A6C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_signpost_enabled(v3))
  {
    sub_10000A8E8();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Q empty", "{\"msg%{public}.0s\":\"Q empty\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v4 = sub_100007A6C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    sub_10000A8E8();
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"Q empty\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", buf, 0x26u);
  }

  v6 = abort_report_np("%s:%d: assertion failure in %s", "/Library/Caches/com.apple.xbs/Sources/CoreSafety/SafetyAlgorithms/CLKappaFeaturesAlgZg.mm", 585, "queryGyroAndAngAccelIdx");
  return sub_1002D3210(v6);
}

void sub_1002D3210()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000212B0(__stack_chk_guard);
  sub_10002126C();
  sub_100021280();
  sub_1000212A0((void *)&_mh_execute_header, &_os_log_default, v0, "ERROR,Die,Time,%.3f,Function,\"%s\",invalid index %zu >= %zu\n", v1, v2, v3, v4, v5);
  sub_1000212B8();
}

void sub_1002D328C()
{
  uint8_t v0[14];
  const char *v1;

  CFAbsoluteTimeGetCurrent();
  sub_10002126C();
  v1 = "Element CMVectorBufferBase<float, 3>::front() const [T = float, N = 3]";
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR,Die,Time,%.3f,Function,\"%s\",front() on empty buffer\n", v0, 0x16u);
}

void sub_1002D3314(uint64_t a1)
{
  uint8_t v2[14];
  const char *v3;
  __int16 v4;
  uint64_t v5;

  sub_1000212B0(__stack_chk_guard);
  sub_10002126C();
  v3 = "Element &CMVectorBufferBase<float, 3>::operator[](const size_t) [T = float, N = 3]";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "ERROR,Die,Time,%.3f,Function,\"%s\",out of buffer range %zu\n", v2, 0x20u);
}

void sub_1002D33B0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  sub_1000212B0(__stack_chk_guard);
  sub_10002126C();
  sub_100021280();
  sub_1000212A0((void *)&_mh_execute_header, &_os_log_default, v0, "ERROR,Die,Time,%.3f,Function,\"%s\",invalid index %zu >= %zu\n", v1, v2, v3, v4, v5);
  sub_1000212B8();
}

void sub_1002D342C(NSObject **a1)
{
  id v2;
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[40];

  v2 = sub_100022074();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    sub_1000249BC();
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"cannot raise none type marty TTR\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x26u);
  }

  v4 = sub_100022074();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    sub_1000249BC();
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "cannot raise none type marty TTR", "{\"msg%{public}.0s\":\"cannot raise none type marty TTR\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x26u);
  }

  v6 = sub_100022074();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  *a1 = v7;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    sub_1000249BC();
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"cannot raise none type marty TTR\", \"event\":%{public, location:escape_only}s, \"condition\":%{private, location:escape_only}s}", v8, 0x26u);
  }
}

void operator delete[]()
{
  while (1)
    ;
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void operator new[]()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

id objc_msgSend_DSLPublisher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "DSLPublisher");
}

id objc_msgSend_Device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "Device");
}

id objc_msgSend_JSONObjectWithData_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "JSONObjectWithData:options:error:");
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MIMEType");
}

id objc_msgSend_SPU_estimate_current_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "SPU_estimate_current_timestamp");
}

id objc_msgSend_ScreenLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ScreenLocked");
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_URLByAppendingPathComponent_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathComponent:isDirectory:");
}

id objc_msgSend_URLByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByAppendingPathExtension:");
}

id objc_msgSend_URLByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingLastPathComponent");
}

id objc_msgSend_URLByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLByDeletingPathExtension");
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLQueryAllowedCharacterSet");
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLsForDirectory_inDomains_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "URLsForDirectory:inDomains:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUID");
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UUIDString");
}

id objc_msgSend__appendEncryptedBytes_length_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_appendEncryptedBytes:length:error:");
}

id objc_msgSend__cleanup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_cleanup");
}

id objc_msgSend__codableKeyValuePairsFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_codableKeyValuePairsFromDictionary:");
}

id objc_msgSend__copyAndVerifyPublicKeyFromCertificate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_copyAndVerifyPublicKeyFromCertificate:error:");
}

id objc_msgSend__decodeEngineFunction_algorithm_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_decodeEngineFunction:algorithm:");
}

id objc_msgSend__deliverDestinationContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_deliverDestinationContent");
}

id objc_msgSend__encryptData_withCertificate_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encryptData:withCertificate:error:");
}

id objc_msgSend__finalizeCryptorWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_finalizeCryptorWithError:");
}

id objc_msgSend__gatherReadSinkContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_gatherReadSinkContent:");
}

id objc_msgSend__initializeStream(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_initializeStream");
}

id objc_msgSend__processIncomingData_length_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_processIncomingData:length:flags:");
}

id objc_msgSend__run_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_run:error:");
}

id objc_msgSend__startCryptorWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startCryptorWithError:");
}

id objc_msgSend__startWithOutputStream_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_startWithOutputStream:error:");
}

id objc_msgSend__updateArmingTimes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateArmingTimes");
}

id objc_msgSend__updateHeaderWithKey_iv_hmacKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_updateHeaderWithKey:iv:hmacKey:error:");
}

id objc_msgSend__writeDataToCompressor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeDataToCompressor:");
}

id objc_msgSend__writeStream_length_hash_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_writeStream:length:hash:error:");
}

id objc_msgSend_abortSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "abortSession");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "absoluteString");
}

id objc_msgSend_action(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "action");
}

id objc_msgSend_actionQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "actionQueue");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_addDelegate_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDelegate:queue:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addExtension_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addExtension:value:");
}

id objc_msgSend_addExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addExtensions:");
}

id objc_msgSend_addField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addField:");
}

id objc_msgSend_addFixed32_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFixed32:");
}

id objc_msgSend_addFixed64_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addFixed64:");
}

id objc_msgSend_addGroup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addGroup:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addIndexesInRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addIndexesInRange:");
}

id objc_msgSend_addLengthDelimited_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addLengthDelimited:");
}

id objc_msgSend_addNotificationRequest_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addNotificationRequest:withCompletionHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addOutOfBandMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addOutOfBandMetadata:error:");
}

id objc_msgSend_addRawEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawEntriesFromDictionary:");
}

id objc_msgSend_addRawValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawValue:");
}

id objc_msgSend_addRawValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawValues:count:");
}

id objc_msgSend_addRawValuesFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawValuesFromArray:");
}

id objc_msgSend_addUnknownMapEntry_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addUnknownMapEntry:value:");
}

id objc_msgSend_addValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValue:");
}

id objc_msgSend_addValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValues:count:");
}

id objc_msgSend_addValuesFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addValuesFromArray:");
}

id objc_msgSend_addVarint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addVarint:");
}

id objc_msgSend_algorithmBoolNumber_inArrayForKey_defaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algorithmBoolNumber:inArrayForKey:defaultValue:");
}

id objc_msgSend_algorithmIntegerNumber_inArrayForKey_withMinValue_maxValue_defaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algorithmIntegerNumber:inArrayForKey:withMinValue:maxValue:defaultValue:");
}

id objc_msgSend_algorithmThresholdNumber_inArrayForKey_withMinValue_maxValue_defaultValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "algorithmThresholdNumber:inArrayForKey:withMinValue:maxValue:defaultValue:");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_allocDescriptorForClass_rootClass_file_fields_fieldCount_storageSize_flags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForClass:rootClass:file:fields:fieldCount:storageSize:flags:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:");
}

id objc_msgSend_allocDescriptorForName_valueNames_values_count_enumVerifier_extraTextFormatInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocDescriptorForName:valueNames:values:count:enumVerifier:extraTextFormatInfo:");
}

id objc_msgSend_allocWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allocWithZone:");
}

id objc_msgSend_allowBattery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowBattery");
}

id objc_msgSend_allowOnBattery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allowOnBattery");
}

id objc_msgSend_alternateWireType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "alternateWireType");
}

id objc_msgSend_appLaunch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appLaunch");
}

id objc_msgSend_appendData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:");
}

id objc_msgSend_appendData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendData:error:");
}

id objc_msgSend_appendDataFromFileURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendDataFromFileURL:error:");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_applicationData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "applicationData");
}

id objc_msgSend_armedSec(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "armedSec");
}

id objc_msgSend_armedSecMartyBicycle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "armedSecMartyBicycle");
}

id objc_msgSend_armedSecMartyLocal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "armedSecMartyLocal");
}

id objc_msgSend_armedSecMartyRemote(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "armedSecMartyRemote");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayForKey:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_assignError_code_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignError:code:description:");
}

id objc_msgSend_assignError_code_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "assignError:code:format:");
}

id objc_msgSend_async_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "async:");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_auth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "auth");
}

id objc_msgSend_authorization(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authorization");
}

id objc_msgSend_backgroundSessionConfigurationWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backgroundSessionConfigurationWithIdentifier:");
}

id objc_msgSend_becameFatallyBlocked_index_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "becameFatallyBlocked:index:");
}

id objc_msgSend_binValueForAge_bins_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "binValueForAge:bins:");
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "body");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleID");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_c_struct(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "c_struct");
}

id objc_msgSend_cacheUserInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cacheUserInfo");
}

id objc_msgSend_calcValueNameOffsets(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calcValueNameOffsets");
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "calendarWithIdentifier:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_categoryWithIdentifier_actions_intentIdentifiers_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "categoryWithIdentifier:actions:intentIdentifiers:options:");
}

id objc_msgSend_centerCoordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "centerCoordinate");
}

id objc_msgSend_certificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "certificate");
}

id objc_msgSend_channel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "channel");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_checkForPersistedRegistration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkForPersistedRegistration");
}

id objc_msgSend_checkIntervalInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkIntervalInSeconds");
}

id objc_msgSend_checkLastTagWas_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkLastTagWas:");
}

id objc_msgSend_classInjectionMap(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "classInjectionMap");
}

id objc_msgSend_clearAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearAll");
}

id objc_msgSend_clearCAStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearCAStats");
}

id objc_msgSend_clearPowerloggingInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearPowerloggingInfo:");
}

id objc_msgSend_clearSessionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearSessionInfo");
}

id objc_msgSend_clearUserInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clearUserInfo");
}

id objc_msgSend_clients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "clients");
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "close");
}

id objc_msgSend_coinflip_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coinflip:");
}

id objc_msgSend_companionConnectedAck_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionConnectedAck:");
}

id objc_msgSend_companionConnectedAckHandler_data_receivedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionConnectedAckHandler:data:receivedTimestamp:");
}

id objc_msgSend_companionConnectedAckHandler_Deprecated_data_receivedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionConnectedAckHandler_Deprecated:data:receivedTimestamp:");
}

id objc_msgSend_companionDecidedToUpload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionDecidedToUpload:");
}

id objc_msgSend_companionDecidedToUploadHandler_data_receivedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionDecidedToUploadHandler:data:receivedTimestamp:");
}

id objc_msgSend_companionTriggerHandler_data_receivedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "companionTriggerHandler:data:receivedTimestamp:");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_components_fromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:");
}

id objc_msgSend_components_fromDate_toDate_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "components:fromDate:toDate:options:");
}

id objc_msgSend_componentsSeparatedByCharactersInSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByCharactersInSet:");
}

id objc_msgSend_computeSerializedSizeAsField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "computeSerializedSizeAsField:");
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "config");
}

id objc_msgSend_configBaseKey_forFeatureMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configBaseKey:forFeatureMode:");
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "configuration");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_connection_handleMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection:handleMessage:");
}

id objc_msgSend_connectionCreated_withMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionCreated:withMessage:");
}

id objc_msgSend_connectionDisconnected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionDisconnected:");
}

id objc_msgSend_connectionHandleDisconnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionHandleDisconnection:");
}

id objc_msgSend_connectionHandleInterruption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionHandleInterruption:");
}

id objc_msgSend_connectionInterrupted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectionInterrupted:");
}

id objc_msgSend_containingMessageClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingMessageClass");
}

id objc_msgSend_containingType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containingType");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsValueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsValueForKey:");
}

id objc_msgSend_coolDownPeriodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coolDownPeriodInSeconds");
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coordinate");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyFieldsInto_zone_descriptor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyFieldsInto:zone:descriptor:");
}

id objc_msgSend_copyItemAtPath_toPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtPath:toPath:error:");
}

id objc_msgSend_copyItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyItemAtURL:toURL:error:");
}

id objc_msgSend_copyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyWithZone:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countOfFields");
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countryCode");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_createNotification_confirmation_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createNotification:confirmation:error:");
}

id objc_msgSend_createPowerAssertion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPowerAssertion:");
}

id objc_msgSend_createSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSession");
}

id objc_msgSend_createSubmitterIfRegistered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createSubmitterIfRegistered");
}

id objc_msgSend_curationSampling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "curationSampling");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCalendar");
}

id objc_msgSend_currentCountrySupportsDirections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentCountrySupportsDirections");
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentHandler");
}

id objc_msgSend_currentSOSStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentSOSStatus");
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "data");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataType");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_dataWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithContentsOfURL:");
}

id objc_msgSend_dataWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithData:");
}

id objc_msgSend_dataWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithLength:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dateWithTimeIntervalSinceReferenceDate:");
}

id objc_msgSend_day(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "day");
}

id objc_msgSend_daysSinceTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceTimestamp:");
}

id objc_msgSend_decideToShowTTR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decideToShowTTR");
}

id objc_msgSend_decodeBoolForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeBoolForKey:");
}

id objc_msgSend_decodeDoubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeDoubleForKey:");
}

id objc_msgSend_decodeInt64ForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeInt64ForKey:");
}

id objc_msgSend_decodeObjectOfClass_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClass:forKey:");
}

id objc_msgSend_decodeObjectOfClasses_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "decodeObjectOfClasses:forKey:");
}

id objc_msgSend_deepCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deepCopyWithZone:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_defaultMessageHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultMessageHandler:");
}

id objc_msgSend_defaultValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultValue");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultWorkspace");
}

id objc_msgSend_defaultsRegistrationDateKeyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultsRegistrationDateKeyName");
}

id objc_msgSend_defaultsSubjectAuthTokenKeyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultsSubjectAuthTokenKeyName");
}

id objc_msgSend_defaultsSubjectIDKeyName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultsSubjectIDKeyName");
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "delegate");
}

id objc_msgSend_deletePendingFiles_ttrManagedMsl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletePendingFiles:ttrManagedMsl:");
}

id objc_msgSend_deletePendingMSLFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletePendingMSLFile:");
}

id objc_msgSend_deletePendingMetadatafile_ttrManagedMsl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deletePendingMetadatafile:ttrManagedMsl:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_descriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "descriptor");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didInitWithUnprocessedCrash_withCompanionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didInitWithUnprocessedCrash:withCompanionUUID:");
}

id objc_msgSend_didReceiveSOSAck_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveSOSAck:forMode:");
}

id objc_msgSend_didReceiveSOSStatusUpdate_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "didReceiveSOSStatusUpdate:forMode:");
}

id objc_msgSend_disableCompression(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disableCompression");
}

id objc_msgSend_dispatchSilo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dispatchSilo");
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_doubleForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleForKey:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "doubleValue");
}

id objc_msgSend_downgradeMsgToOlderType_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "downgradeMsgToOlderType:type:");
}

id objc_msgSend_dumpMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dumpMetadata");
}

id objc_msgSend_enableMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enableMode");
}

id objc_msgSend_encodeBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeBool:forKey:");
}

id objc_msgSend_encodeDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeDouble:forKey:");
}

id objc_msgSend_encodeInt64_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeInt64:forKey:");
}

id objc_msgSend_encodeObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodeObject:forKey:");
}

id objc_msgSend_encodedData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encodedData");
}

id objc_msgSend_encryptMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "encryptMonitor");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_enqueueFileWithFilename_andMetadata_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueFileWithFilename:andMetadata:error:");
}

id objc_msgSend_enqueueTTRWithTriggerUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueTTRWithTriggerUUID:error:");
}

id objc_msgSend_enqueueTTRWithTriggerUUID_ttrManagedFiles_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueueTTRWithTriggerUUID:ttrManagedFiles:error:");
}

id objc_msgSend_ensureServiceIsRunning_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ensureServiceIsRunning:");
}

id objc_msgSend_enumDescriptor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumDescriptor");
}

id objc_msgSend_enumVerifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumVerifier");
}

id objc_msgSend_enumerateForTextFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateForTextFormat:");
}

id objc_msgSend_enumerateKeysAndBoolsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndBoolsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndDoublesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndDoublesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndFloatsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndFloatsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndInt32sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndInt64sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateKeysAndRawValuesUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndRawValuesUsingBlock:");
}

id objc_msgSend_enumerateKeysAndUInt32sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndUInt32sUsingBlock:");
}

id objc_msgSend_enumerateKeysAndUInt64sUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndUInt64sUsingBlock:");
}

id objc_msgSend_enumerateRawValuesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateRawValuesWithBlock:");
}

id objc_msgSend_enumerateValuesWithBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateValuesWithBlock:");
}

id objc_msgSend_enumeratorAtURL_includingPropertiesForKeys_options_errorHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:");
}

id objc_msgSend_ephemeralSessionConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ephemeralSessionConfiguration");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_escalateCrashDecision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escalateCrashDecision");
}

id objc_msgSend_escalateUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "escalateUI");
}

id objc_msgSend_evaluateCrashWithPOI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateCrashWithPOI");
}

id objc_msgSend_evaluatePossibleCrashDetectorDecision(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluatePossibleCrashDetectorDecision");
}

id objc_msgSend_evaluateSamplingAlgFeatures(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "evaluateSamplingAlgFeatures");
}

id objc_msgSend_eventBody(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eventBody");
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "exceptionWithName:reason:userInfo:");
}

id objc_msgSend_extension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extension");
}

id objc_msgSend_extensionForDescriptor_fieldNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionForDescriptor:fieldNumber:");
}

id objc_msgSend_extensionRanges(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRanges");
}

id objc_msgSend_extensionRangesCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRangesCount");
}

id objc_msgSend_extensionRegistry(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionRegistry");
}

id objc_msgSend_extensionsCurrentlySet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "extensionsCurrentlySet");
}

id objc_msgSend_feedAccel800_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedAccel800:");
}

id objc_msgSend_feedAccel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedAccel:");
}

id objc_msgSend_feedCompanionDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedCompanionDetected");
}

id objc_msgSend_feedCompanionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedCompanionStatus:");
}

id objc_msgSend_feedDetectionDecision_uuid_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedDetectionDecision:uuid:forMode:");
}

id objc_msgSend_feedDeviceMotion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedDeviceMotion:");
}

id objc_msgSend_feedGPS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedGPS:");
}

id objc_msgSend_feedHertzSample_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedHertzSample:");
}

id objc_msgSend_feedHgAccel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedHgAccel:");
}

id objc_msgSend_feedKappaTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedKappaTrigger:");
}

id objc_msgSend_feedLocationManagerResults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedLocationManagerResults:");
}

id objc_msgSend_feedPotentialEventWithTimestamp_forMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedPotentialEventWithTimestamp:forMode:");
}

id objc_msgSend_feedPotentialEventWithTimestamp_forMode_martyIsBicycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedPotentialEventWithTimestamp:forMode:martyIsBicycle:");
}

id objc_msgSend_feedPressure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedPressure:");
}

id objc_msgSend_feedRemoteSample_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedRemoteSample:");
}

id objc_msgSend_feedRoads_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedRoads:");
}

id objc_msgSend_feedSignificantUserInteraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedSignificantUserInteraction:");
}

id objc_msgSend_feedSortedSamples_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedSortedSamples:");
}

id objc_msgSend_feedSoundPressureLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedSoundPressureLevel:");
}

id objc_msgSend_feedSteps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedSteps:");
}

id objc_msgSend_feedTrustedAudioResult_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "feedTrustedAudioResult:");
}

id objc_msgSend_fieldNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fieldNumber");
}

id objc_msgSend_fieldType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fieldType");
}

id objc_msgSend_fieldWithNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fieldWithNumber:");
}

id objc_msgSend_file(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "file");
}

id objc_msgSend_fileCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileCreationDate");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileExistsAtPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:isDirectory:");
}

id objc_msgSend_fileProtectionType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileProtectionType");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_filterWithKeyPath_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "filterWithKeyPath:value:");
}

id objc_msgSend_finalizeWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finalizeWithError:");
}

id objc_msgSend_finishAnomalyEvent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishAnomalyEvent");
}

id objc_msgSend_finishDecoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishDecoding");
}

id objc_msgSend_finishEncoding(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishEncoding");
}

id objc_msgSend_finishSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishSession");
}

id objc_msgSend_finishTasksAndInvalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "finishTasksAndInvalidate");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_firstOrThirdPartyEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstOrThirdPartyEnabled");
}

id objc_msgSend_fixed32List(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixed32List");
}

id objc_msgSend_fixed64List(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fixed64List");
}

id objc_msgSend_floatForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatForKey:");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_flowState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flowState");
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flush");
}

id objc_msgSend_folderURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "folderURL");
}

id objc_msgSend_forceBehavior_withValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceBehavior:withValue:");
}

id objc_msgSend_forceCompanionTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceCompanionTrigger:");
}

id objc_msgSend_forceDetectionDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forceDetectionDevice");
}

id objc_msgSend_fullName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fullName");
}

id objc_msgSend_generateMslUrl_andSessionType_ttrManagedMsl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateMslUrl:andSessionType:ttrManagedMsl:");
}

id objc_msgSend_getBooleanDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBooleanDefault:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getBytes_maxLength_usedLength_encoding_options_range_remainingRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:");
}

id objc_msgSend_getCrashBlock(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCrashBlock");
}

id objc_msgSend_getDeescalationPath(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeescalationPath");
}

id objc_msgSend_getEnumTextFormatNameForIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getEnumTextFormatNameForIndex:");
}

id objc_msgSend_getExistingExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExistingExtension:");
}

id objc_msgSend_getExtension_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getExtension:");
}

id objc_msgSend_getFloatDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFloatDefault:");
}

id objc_msgSend_getForceDecision_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getForceDecision:");
}

id objc_msgSend_getFractionalAudio(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getFractionalAudio");
}

id objc_msgSend_getIntegerDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIntegerDefault:");
}

id objc_msgSend_getKappaThirdPartyDisplayNameForApp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getKappaThirdPartyDisplayNameForApp");
}

id objc_msgSend_getMaxTriggerSessionInSecondsDefault(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMaxTriggerSessionInSecondsDefault");
}

id objc_msgSend_getNotificationResponse_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getNotificationResponse:error:");
}

id objc_msgSend_getReport_reportLength_withIdentifier_forType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getReport:reportLength:withIdentifier:forType:error:");
}

id objc_msgSend_getSecondsSinceReboot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSecondsSinceReboot");
}

id objc_msgSend_getSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSerialNumber");
}

id objc_msgSend_getSystem_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystem:");
}

id objc_msgSend_getSystemHardware(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemHardware");
}

id objc_msgSend_getSystemModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemModel");
}

id objc_msgSend_getSystemReleaseType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemReleaseType");
}

id objc_msgSend_getSystemVersionDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemVersionDescription");
}

id objc_msgSend_getSystemVersionDescriptionNoBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSystemVersionDescriptionNoBuild");
}

id objc_msgSend_getTasksWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTasksWithCompletionHandler:");
}

id objc_msgSend_getUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getUUIDBytes:");
}

id objc_msgSend_groupList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "groupList");
}

id objc_msgSend_handleConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleConnection:");
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInFunction:file:lineNumber:description:");
}

id objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleFailureInMethod:object:file:lineNumber:description:");
}

id objc_msgSend_hardware(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hardware");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hash");
}

id objc_msgSend_hour(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hour");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsService");
}

id objc_msgSend_igneousCMPrototypingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "igneousCMPrototypingConfiguration");
}

id objc_msgSend_igneousGMConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "igneousGMConfiguration");
}

id objc_msgSend_igneousStagingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "igneousStagingConfiguration");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "indexSet");
}

id objc_msgSend_inertialX(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inertialX");
}

id objc_msgSend_inertialY(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inertialY");
}

id objc_msgSend_inertialZ(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inertialZ");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initFileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFileURLWithPath:isDirectory:");
}

id objc_msgSend_initFlowController(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initFlowController");
}

id objc_msgSend_initForReadingFromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initForReadingFromData:error:");
}

id objc_msgSend_initRequiringSecureCoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initRequiringSecureCoding:");
}

id objc_msgSend_initSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initSession");
}

id objc_msgSend_initStateMachine(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initStateMachine");
}

id objc_msgSend_initWithAllowOnBattery_checkIntervalInSeconds_coolDownPeriodInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAllowOnBattery:checkIntervalInSeconds:coolDownPeriodInSeconds:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBase64EncodedString_options_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBase64EncodedString:options:");
}

id objc_msgSend_initWithBools_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBools:forKeys:count:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithBytes_length_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:encoding:");
}

id objc_msgSend_initWithBytesNoCopy_length_deallocator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:deallocator:");
}

id objc_msgSend_initWithBytesNoCopy_length_freeWhenDone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytesNoCopy:length:freeWhenDone:");
}

id objc_msgSend_initWithCString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:");
}

id objc_msgSend_initWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCString:encoding:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithCategory_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCategory:state:");
}

id objc_msgSend_initWithCertificate_messageUUID_subjectUUID_studyUUID_channel_payloadType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCertificate:messageUUID:subjectUUID:studyUUID:channel:payloadType:");
}

id objc_msgSend_initWithClass_file_fields_storageSize_wireFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClass:file:fields:storageSize:wireFormat:");
}

id objc_msgSend_initWithCodedInputStream_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCodedInputStream:extensionRegistry:error:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithConnection_message_delegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:message:delegate:");
}

id objc_msgSend_initWithConnectionMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnectionMessage:");
}

id objc_msgSend_initWithCoordinate_radius_categories_maxResultCount_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCoordinate:radius:categories:maxResultCount:");
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithData_extensionRegistry_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:extensionRegistry:error:");
}

id objc_msgSend_initWithDispatchSilo_andDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDispatchSilo:andDelegate:");
}

id objc_msgSend_initWithDoubles_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDoubles:forKeys:count:");
}

id objc_msgSend_initWithEffectiveBundle_delegate_onQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEffectiveBundle:delegate:onQueue:");
}

id objc_msgSend_initWithEndpoint_authorization_cellularAccess_timeoutInSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEndpoint:authorization:cellularAccess:timeoutInSeconds:");
}

id objc_msgSend_initWithEndpoint_authorization_subjectToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEndpoint:authorization:subjectToken:");
}

id objc_msgSend_initWithEpochTimestamp_planarResult_rolloverResult_historicalLoudness_maxRMS_numShortAudio_numPointsInEpoch_epochMinTimestamp_epochMaxTimestamp_dramDuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEpochTimestamp:planarResult:rolloverResult:historicalLoudness:maxRMS:numShortAudio:numPointsInEpoch:epochMinTimestamp:epochMaxTimestamp:dramDuration:");
}

id objc_msgSend_initWithFieldDescription_includesDefault_usesClassRefs_proto3OptionalKnown_syntax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFieldDescription:includesDefault:usesClassRefs:proto3OptionalKnown:syntax:");
}

id objc_msgSend_initWithFileProtectionType_allowBattery_periodInseconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFileProtectionType:allowBattery:periodInseconds:");
}

id objc_msgSend_initWithFloats_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFloats:forKeys:count:");
}

id objc_msgSend_initWithFolder_fileExtension_queue_postfix_andAction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFolder:fileExtension:queue:postfix:andAction:");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithFormat_arguments_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:arguments:");
}

id objc_msgSend_initWithFunction_algorithm_destination_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFunction:algorithm:destination:");
}

id objc_msgSend_initWithGEOCountryConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithGEOCountryConfiguration:");
}

id objc_msgSend_initWithHardware_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHardware:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_targetQueue_waking_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIdentifier:targetQueue:waking:");
}

id objc_msgSend_initWithInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt32s:forKeys:count:");
}

id objc_msgSend_initWithInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInt64s:forKeys:count:");
}

id objc_msgSend_initWithLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLength:");
}

id objc_msgSend_initWithLookingBack_keyValuePairs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithLookingBack:keyValuePairs:");
}

id objc_msgSend_initWithMartyUploadHandler_andKappaHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMartyUploadHandler:andKappaHandler:");
}

id objc_msgSend_initWithName_fields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:fields:");
}

id objc_msgSend_initWithNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithNumber:");
}

id objc_msgSend_initWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:count:");
}

id objc_msgSend_initWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithObjects:forKeys:count:");
}

id objc_msgSend_initWithOptions_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOptions:capacity:");
}

id objc_msgSend_initWithOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOutputStream:");
}

id objc_msgSend_initWithOutputStream_certificate_algorithm_options_keySize_uuid_studyUUID_compressionEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOutputStream:certificate:algorithm:options:keySize:uuid:studyUUID:compressionEnabled:");
}

id objc_msgSend_initWithOutputStream_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithOutputStream:data:");
}

id objc_msgSend_initWithPackage_objcPrefix_syntax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackage:objcPrefix:syntax:");
}

id objc_msgSend_initWithPackage_syntax_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPackage:syntax:");
}

id objc_msgSend_initWithPayloadType_channel_keyValuePairs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPayloadType:channel:keyValuePairs:");
}

id objc_msgSend_initWithSPUPacketStruct_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSPUPacketStruct:");
}

id objc_msgSend_initWithServer_certificate_study_andAuthorizationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServer:certificate:study:andAuthorizationID:");
}

id objc_msgSend_initWithSilo_idsService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSilo:idsService:");
}

id objc_msgSend_initWithSilo_vendor_aopService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSilo:vendor:aopService:");
}

id objc_msgSend_initWithSilo_vendor_aopService_sosStateMachine_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSilo:vendor:aopService:sosStateMachine:");
}

id objc_msgSend_initWithSilo_vendor_client_aopService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSilo:vendor:client:aopService:");
}

id objc_msgSend_initWithSpoolerFolder_andConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSpoolerFolder:andConfiguration:");
}

id objc_msgSend_initWithSpoolerFolder_andConfiguration_withQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSpoolerFolder:andConfiguration:withQueue:");
}

id objc_msgSend_initWithSpoolerFolder_serverConfiguration_registrationPeriodInSeconds_retentionPeriodInSeconds_outOfBandMetadataTimeout_defaultsKeyPostfix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSpoolerFolder:serverConfiguration:registrationPeriodInSeconds:retentionPeriodInSeconds:outOfBandMetadataTimeout:defaultsKeyPostfix:");
}

id objc_msgSend_initWithStruct_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithStruct:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTimestamp_armTimeImuConfidences_armTimeActivityHints_windowAfterArmImuConfidences_triggerTimeLastHighImuDrivingConfidenceTimestamp_sessionSwivelAngleDegHistogram_sessionTiltAngleDegHistogram_sessionImuHintPercentage_sessionBtHintPercentage_sessionGpsHintPercentage_sessionWifiHintPercentage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:armTimeImuConfidences:armTimeActivityHints:windowAfterArmImuConfidences:triggerTimeLastHighImuDrivingConfidenceTimestamp:sessionSwivelAngleDegHistogram:sessionTiltAngleDegHistogram:sessionImuHintPercentage:sessionBtHintPercentage:sessionGpsHintPercentage:sessionWifiHintPercentage:");
}

id objc_msgSend_initWithTimestamp_code_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:code:");
}

id objc_msgSend_initWithTimestamp_distanceToNearestRoad_roadClass_horizontalAccuracy_numRoadFeaturesEvaluated_GEOHandlerErrorDomain_GEOHandlerErrorCode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:distanceToNearestRoad:roadClass:horizontalAccuracy:numRoadFeaturesEvaluated:GEOHandlerErrorDomain:GEOHandlerErrorCode:");
}

id objc_msgSend_initWithTimestamp_doubleTS_speedMS_speedAccuracyMS_courseDeg_courseAccuracyDeg_latitude_longitude_wayForm_roadClass_signalEnvironment_horizontalAccuracy_demNumContiguousFlatPoints_demConfidence_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:doubleTS:speedMS:speedAccuracyMS:courseDeg:courseAccuracyDeg:latitude:longitude:wayForm:roadClass:signalEnvironment:horizontalAccuracy:demNumContiguousFlatPoints:demConfidence:type:");
}

id objc_msgSend_initWithTimestamp_dramDurationMs_vehicularFlags_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:dramDurationMs:vehicularFlags:");
}

id objc_msgSend_initWithTimestamp_meta_decel_impact_path_armedSec_motionHint_gpsHint_basebandHint_wifiHint_btHint_lastValidImuTimestamp_vehicleProbabilityLongTermMean_martyPath_enableMode_martyArmedSec_companionAopTs_maxMeanTenMinPreTrigger_lastCompleted15sWindowMean_currentWindowMean_numMaxEnvelopes_igneousPath_igneousGUID_martyImpactMagnitude_martyRotationMagnitude_overrideMode_martyIsBicycle_martyArmedSecBicycle_locallyArmed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:meta:decel:impact:path:armedSec:motionHint:gpsHint:basebandHint:wifiHint:btHint:lastValidImuTimestamp:vehicleProbabilityLongTermMean:martyPath:enableMode:martyArmedSec:companionAopTs:maxMeanTenMinPreTrigger:lastCompleted15sWindowMean:currentWindowMean:numMaxEnvelopes:igneousPath:igneousGUID:martyImpactMagnitude:martyRotationMagnitude:overrideMode:martyIsBicycle:martyArmedSecBicycle:locallyArmed:");
}

id objc_msgSend_initWithTimestamp_pressure_temperature_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:pressure:temperature:");
}

id objc_msgSend_initWithTimestamp_quaternion_rate_userAccel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:quaternion:rate:userAccel:");
}

id objc_msgSend_initWithTimestamp_rms_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:rms:");
}

id objc_msgSend_initWithTimestamp_stepCount_deltaSteps_currentCadence_pedometerArmConstrainedState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:stepCount:deltaSteps:currentCadence:pedometerArmConstrainedState:");
}

id objc_msgSend_initWithTimestamp_x_y_z_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithTimestamp:x:y:z:");
}

id objc_msgSend_initWithUInt32s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUInt32s:forKeys:count:");
}

id objc_msgSend_initWithUInt64s_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUInt64s:forKeys:count:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_append_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithURL:append:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_initWithUUID_senderUUID_studyUUID_channel_payloadType_startDate_endDate_payloadIdentifier_applicationData_certificate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUID:senderUUID:studyUUID:channel:payloadType:startDate:endDate:payloadIdentifier:applicationData:certificate:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithValidationFunction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:");
}

id objc_msgSend_initWithValidationFunction_capacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:capacity:");
}

id objc_msgSend_initWithValidationFunction_rawValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:rawValues:count:");
}

id objc_msgSend_initWithValidationFunction_rawValues_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValidationFunction:rawValues:forKeys:count:");
}

id objc_msgSend_initWithValueArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValueArray:");
}

id objc_msgSend_initWithValues_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithValues:count:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerForKey:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_internalClear_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalClear:");
}

id objc_msgSend_internalResizeToCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "internalResizeToCapacity:");
}

id objc_msgSend_interruptionHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interruptionHandler");
}

id objc_msgSend_invalidateAndCancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateAndCancel");
}

id objc_msgSend_isArmed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isArmed");
}

id objc_msgSend_isAssertionActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAssertionActive");
}

id objc_msgSend_isAuthorizedForIS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuthorizedForIS");
}

id objc_msgSend_isAuthorizedToCollectData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAuthorizedToCollectData");
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isConnected");
}

id objc_msgSend_isDOEDeviceDefaultSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDOEDeviceDefaultSet");
}

id objc_msgSend_isDefaultPairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isDefaultPairedDevice");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isExtendedPretriggerDMDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExtendedPretriggerDMDevice");
}

id objc_msgSend_isExtendedPretriggerMagDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isExtendedPretriggerMagDevice");
}

id objc_msgSend_isFieldTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFieldTag:");
}

id objc_msgSend_isFileOldEnoughForDeletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isFileOldEnoughForDeletion:");
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIdle");
}

id objc_msgSend_isIn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isIn:");
}

id objc_msgSend_isInitialized(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInitialized");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isKappaDetectionDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaDetectionDevice");
}

id objc_msgSend_isKappaDetectionDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaDetectionDevice:");
}

id objc_msgSend_isKappaEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaEnabled");
}

id objc_msgSend_isKappaFlow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaFlow");
}

id objc_msgSend_isKappaFlowActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaFlowActive");
}

id objc_msgSend_isKappaLoggingDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaLoggingDevice");
}

id objc_msgSend_isKappaLoggingDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaLoggingDevice:");
}

id objc_msgSend_isKappaTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaTrigger:");
}

id objc_msgSend_isKappaVisible(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKappaVisible");
}

id objc_msgSend_isKeyInServerDefaultsWithVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeyInServerDefaultsWithVersion:");
}

id objc_msgSend_isKeyInUserDefaults_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isKeyInUserDefaults:");
}

id objc_msgSend_isLocallyPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLocallyPaired");
}

id objc_msgSend_isMDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMDevice");
}

id objc_msgSend_isMartyTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMartyTrigger:");
}

id objc_msgSend_isNearby(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearby");
}

id objc_msgSend_isOptional(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOptional");
}

id objc_msgSend_isPackable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPackable");
}

id objc_msgSend_isPairedDeviceStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPairedDeviceStatus");
}

id objc_msgSend_isRepeated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRepeated");
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isRequired");
}

id objc_msgSend_isSafetyDataSubmissionAllowed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSafetyDataSubmissionAllowed");
}

id objc_msgSend_isStarting(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isStarting");
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_isValidEnumValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidEnumValue:");
}

id objc_msgSend_isWireFormat(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isWireFormat");
}

id objc_msgSend_kappaArmedSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kappaArmedSeconds");
}

id objc_msgSend_kappaCMPrototypingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kappaCMPrototypingConfiguration");
}

id objc_msgSend_kappaGMConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kappaGMConfiguration");
}

id objc_msgSend_kappaInternalConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kappaInternalConfiguration");
}

id objc_msgSend_kappaSessionCompanionHandler_data_receivedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kappaSessionCompanionHandler:data:receivedTimestamp:");
}

id objc_msgSend_kappaStagingConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kappaStagingConfiguration");
}

id objc_msgSend_kappaTriggersEmergencySOS(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kappaTriggersEmergencySOS");
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyEnumerator");
}

id objc_msgSend_keyValuePairs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "keyValuePairs");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastPathComponent");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_lengthDelimitedList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthDelimitedList");
}

id objc_msgSend_lengthOfBytesUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lengthOfBytesUsingEncoding:");
}

id objc_msgSend_limitPending(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "limitPending");
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longLongValue");
}

id objc_msgSend_lookBack(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lookBack");
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lowercaseString");
}

id objc_msgSend_mapItemsForSpatialLookupParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapItemsForSpatialLookupParameters:");
}

id objc_msgSend_mapKeyDataType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapKeyDataType");
}

id objc_msgSend_mapMissBehavior(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mapMissBehavior");
}

id objc_msgSend_martyArmedSecondsLocal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "martyArmedSecondsLocal");
}

id objc_msgSend_maxTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "maxTemp");
}

id objc_msgSend_mcc1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcc1");
}

id objc_msgSend_mcc2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mcc2");
}

id objc_msgSend_medTocFactoryTemp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "medTocFactoryTemp");
}

id objc_msgSend_medianToc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "medianToc");
}

id objc_msgSend_mergeDelimitedFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeDelimitedFromCodedInputStream:extensionRegistry:");
}

id objc_msgSend_mergeFieldFrom_input_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFieldFrom:input:");
}

id objc_msgSend_mergeFrom_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFrom:");
}

id objc_msgSend_mergeFromCodedInputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFromCodedInputStream:");
}

id objc_msgSend_mergeFromCodedInputStream_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFromCodedInputStream:extensionRegistry:");
}

id objc_msgSend_mergeFromData_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeFromData:extensionRegistry:");
}

id objc_msgSend_mergeUnknownFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeUnknownFields:");
}

id objc_msgSend_mergeVarintField_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mergeVarintField:value:");
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "message");
}

id objc_msgSend_messageClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageClass");
}

id objc_msgSend_messageHandler_data_timestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageHandler:data:timestamp:");
}

id objc_msgSend_messageReceived_fromConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageReceived:fromConnection:");
}

id objc_msgSend_messageUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messageUUID");
}

id objc_msgSend_meta(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "meta");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_minute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minute");
}

id objc_msgSend_mnc1(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mnc1");
}

id objc_msgSend_mnc2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mnc2");
}

id objc_msgSend_modelIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelIdentifier");
}

id objc_msgSend_monitoring(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitoring");
}

id objc_msgSend_month(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "month");
}

id objc_msgSend_moveItemAtURL_toURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "moveItemAtURL:toURL:error:");
}

id objc_msgSend_msgClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "msgClass");
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableBytes");
}

id objc_msgSend_mutableConnections(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableConnections");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_mutableCopyWithZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopyWithZone:");
}

id objc_msgSend_mutableFieldForNumber_create_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableFieldForNumber:create:");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_newOutputFileURL(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newOutputFileURL");
}

id objc_msgSend_newOutputFileURLInDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newOutputFileURLInDirectory:");
}

id objc_msgSend_newTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "newTimer");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nextObject");
}

id objc_msgSend_notifyCompanionOfLocalCrash_forMode_martyIsBicycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyCompanionOfLocalCrash:forMode:martyIsBicycle:");
}

id objc_msgSend_notifyCompanionOfSafetyEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyCompanionOfSafetyEventType:");
}

id objc_msgSend_notifyCompanionOfUploadedCompanionUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifyCompanionOfUploadedCompanionUUID");
}

id objc_msgSend_notifySOSDaemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifySOSDaemon");
}

id objc_msgSend_notifySOStoAOP(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notifySOStoAOP");
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "now");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_number(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "number");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objcPrefix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objcPrefix");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectEnumerator");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_onCloseEpoch_epochNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onCloseEpoch:epochNumber:");
}

id objc_msgSend_onCompanionConnectionStatusUpdate_cftime_sputime_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onCompanionConnectionStatusUpdate:cftime:sputime:");
}

id objc_msgSend_onCompanionMessage_data_receivedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onCompanionMessage:data:receivedTimestamp:");
}

id objc_msgSend_onCompanionStatusUpdate_pairedDevice_updatedTimestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onCompanionStatusUpdate:pairedDevice:updatedTimestamp:");
}

id objc_msgSend_onKappaSessionUpdate_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "onKappaSessionUpdate:data:");
}

id objc_msgSend_oobMetadataMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oobMetadataMonitor");
}

id objc_msgSend_oobTimeout(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "oobTimeout");
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "open");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_outgoingResponseIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outgoingResponseIdentifier");
}

id objc_msgSend_package(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "package");
}

id objc_msgSend_pairedDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDevice");
}

id objc_msgSend_parseMessageSet_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseMessageSet:extensionRegistry:");
}

id objc_msgSend_parseUnknownField_extensionRegistry_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseUnknownField:extensionRegistry:tag:");
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "path");
}

id objc_msgSend_pathExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pathExtension");
}

id objc_msgSend_payloadIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadIdentifier");
}

id objc_msgSend_payloadObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadObject");
}

id objc_msgSend_payloadType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "payloadType");
}

id objc_msgSend_performanceSampling(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "performanceSampling");
}

id objc_msgSend_periodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "periodInSeconds");
}

id objc_msgSend_persistToDiskWithSpooledFile_fileURL_enqueueTime_metadata_theError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistToDiskWithSpooledFile:fileURL:enqueueTime:metadata:theError:");
}

id objc_msgSend_persistentConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentConfiguration");
}

id objc_msgSend_persistentConfigurationIgneous(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "persistentConfigurationIgneous");
}

id objc_msgSend_pointerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pointerValue");
}

id objc_msgSend_populateSessionDetails(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateSessionDetails");
}

id objc_msgSend_postfix(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postfix");
}

id objc_msgSend_powerlogActivity_state_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "powerlogActivity:state:");
}

id objc_msgSend_printSamplingDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printSamplingDefaults");
}

id objc_msgSend_processSessionDetails_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processSessionDetails:");
}

id objc_msgSend_productBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productBuildVersion");
}

id objc_msgSend_proxyForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "proxyForService:");
}

id objc_msgSend_publisher(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "publisher");
}

id objc_msgSend_queryCompanion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryCompanion:");
}

id objc_msgSend_queryCompanion_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryCompanion:completion:");
}

id objc_msgSend_queryEmbeddedSystemHardware(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryEmbeddedSystemHardware");
}

id objc_msgSend_queryIfNearAmusementPark(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queryIfNearAmusementPark");
}

id objc_msgSend_querySamplingBin_atIndex_withDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "querySamplingBin:atIndex:withDefault:");
}

id objc_msgSend_querySamplingRate_withDefault_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "querySamplingRate:withDefault:");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_radarWithResult_triggerUUID_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radarWithResult:triggerUUID:error:");
}

id objc_msgSend_radarWithResult_triggerUUID_ttrManagedMsl_eventType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "radarWithResult:triggerUUID:ttrManagedMsl:eventType:error:");
}

id objc_msgSend_raise(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise");
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "raise:format:");
}

id objc_msgSend_rawValueAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rawValueAtIndex:");
}

id objc_msgSend_readGroup_message_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readGroup:message:extensionRegistry:");
}

id objc_msgSend_readMapEntry_extensionRegistry_field_parentMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readMapEntry:extensionRegistry:field:parentMessage:");
}

id objc_msgSend_readMessage_extensionRegistry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readMessage:extensionRegistry:");
}

id objc_msgSend_readSamples(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readSamples");
}

id objc_msgSend_readUnknownGroup_message_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readUnknownGroup:message:");
}

id objc_msgSend_reason(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reason");
}

id objc_msgSend_receiveCompanionTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveCompanionTrigger:");
}

id objc_msgSend_receiveCompanionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveCompanionUUID:");
}

id objc_msgSend_receiveDeviceInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveDeviceInfo:");
}

id objc_msgSend_receiveDeviceInfoProtobuf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveDeviceInfoProtobuf:");
}

id objc_msgSend_receiveForceTriggerProtobuf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveForceTriggerProtobuf:");
}

id objc_msgSend_receiveSinkContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveSinkContent:");
}

id objc_msgSend_receiveUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receiveUUID:");
}

id objc_msgSend_receivedMessage_data_identifierString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "receivedMessage:data:identifierString:");
}

id objc_msgSend_recordAccel800_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordAccel800:");
}

id objc_msgSend_recordAccel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordAccel:");
}

id objc_msgSend_recordActivityPhone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordActivityPhone:");
}

id objc_msgSend_recordCompanionStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordCompanionStatus:");
}

id objc_msgSend_recordDeviceMotion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordDeviceMotion:");
}

id objc_msgSend_recordGPS_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordGPS:");
}

id objc_msgSend_recordHgAccel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordHgAccel:");
}

id objc_msgSend_recordKappaTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordKappaTrigger:");
}

id objc_msgSend_recordMag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordMag:");
}

id objc_msgSend_recordPressure_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordPressure:");
}

id objc_msgSend_recordPressureCalibration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordPressureCalibration:");
}

id objc_msgSend_recordRemoteSample_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordRemoteSample:");
}

id objc_msgSend_recordRoadInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordRoadInfo:");
}

id objc_msgSend_recordSafetyHertzSample_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordSafetyHertzSample:");
}

id objc_msgSend_recordSignificantUserInteraction_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordSignificantUserInteraction:");
}

id objc_msgSend_recordSoundPressureLevel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordSoundPressureLevel:");
}

id objc_msgSend_recordSteps_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordSteps:");
}

id objc_msgSend_recordTrustedAudio_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "recordTrustedAudio:");
}

id objc_msgSend_registerClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerClient:");
}

id objc_msgSend_registerDelegate_inSilo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerDelegate:inSilo:");
}

id objc_msgSend_registerForCoreAnalyticsUserInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForCoreAnalyticsUserInfo");
}

id objc_msgSend_registerForCoreAnalyticsUserInfoWithCriteria_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForCoreAnalyticsUserInfoWithCriteria:");
}

id objc_msgSend_registerForCoreAnalyticsUserInfoWithExplicitCriteria(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForCoreAnalyticsUserInfoWithExplicitCriteria");
}

id objc_msgSend_registerForFolderMonitorActivity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForFolderMonitorActivity");
}

id objc_msgSend_registerForFolderMonitorActivityWithCriteria_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForFolderMonitorActivityWithCriteria:");
}

id objc_msgSend_registerForUploadingWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerForUploadingWithError:");
}

id objc_msgSend_registerWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerWithHandler:");
}

id objc_msgSend_registered(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registered");
}

id objc_msgSend_registrationPeriodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registrationPeriodInSeconds");
}

id objc_msgSend_releaseAllCFObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releaseAllCFObjects");
}

id objc_msgSend_releasePowerAssertion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "releasePowerAssertion");
}

id objc_msgSend_remotePid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remotePid");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeLastObject");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_replaceOccurrencesOfString_withString_options_range_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replaceOccurrencesOfString:withString:options:range:");
}

id objc_msgSend_replyToXPCMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replyToXPCMessage");
}

id objc_msgSend_requestCompanionUpload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestCompanionUpload:");
}

id objc_msgSend_requestDeviceInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestDeviceInfo");
}

id objc_msgSend_requestLocation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLocation");
}

id objc_msgSend_requestLocation_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestLocation:");
}

id objc_msgSend_requestWithIdentifier_content_trigger_destinations_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithIdentifier:content:trigger:destinations:");
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestWithURL:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_resetAllPersistedValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetAllPersistedValues");
}

id objc_msgSend_resetSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetSession");
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "response");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_retentionPeriodInSeconds(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retentionPeriodInSeconds");
}

id objc_msgSend_retireServiceWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retireServiceWithName:");
}

id objc_msgSend_returnQueryToCompanion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "returnQueryToCompanion:");
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseObjectEnumerator");
}

id objc_msgSend_runAllConfigurationUpdateCallbacks(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "runAllConfigurationUpdateCallbacks");
}

id objc_msgSend_saveForceState_withValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "saveForceState:withValue:");
}

id objc_msgSend_scan_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scan:");
}

id objc_msgSend_scanGroup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanGroup");
}

id objc_msgSend_second(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "second");
}

id objc_msgSend_sendCompanionTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCompanionTrigger:");
}

id objc_msgSend_sendCompanionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendCompanionUUID:");
}

id objc_msgSend_sendData_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendData:type:");
}

id objc_msgSend_sendDeviceInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDeviceInfo");
}

id objc_msgSend_sendDeviceInfoProtobuf(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendDeviceInfoProtobuf");
}

id objc_msgSend_sendForceTriggerProtobuf_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendForceTriggerProtobuf:");
}

id objc_msgSend_sendLocalAudioToWatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendLocalAudioToWatch");
}

id objc_msgSend_sendLocalKappaSessionInfoToCompanion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendLocalKappaSessionInfoToCompanion");
}

id objc_msgSend_sendMessage_toDestinations_priority_options_identifier_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:toDestinations:priority:options:identifier:error:");
}

id objc_msgSend_sendPowerlogMetrics_start_end_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendPowerlogMetrics:start:end:");
}

id objc_msgSend_sendRemoteSampleToCompanion_epochTs_epochNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendRemoteSampleToCompanion:epochTs:epochNumber:");
}

id objc_msgSend_sendSessionInfoToCoreAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendSessionInfoToCoreAnalytics");
}

id objc_msgSend_sendUserInfoToCoreAnalytics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendUserInfoToCoreAnalytics");
}

id objc_msgSend_serializedDataForUnknownValue_forKey_keyDataType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedDataForUnknownValue:forKey:keyDataType:");
}

id objc_msgSend_serializedSize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedSize");
}

id objc_msgSend_serializedSizeAsMessageSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedSizeAsMessageSet");
}

id objc_msgSend_serializedSizeAsMessageSetExtension(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serializedSizeAsMessageSetExtension");
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "server");
}

id objc_msgSend_serverConfigurationToUse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverConfigurationToUse:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceName");
}

id objc_msgSend_serviceWithIdentifier_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithIdentifier:completion:");
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "session");
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:");
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_setAllowsCellularAccess_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAllowsCellularAccess:");
}

id objc_msgSend_setApplicationData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setApplicationData:");
}

id objc_msgSend_setArmedSec_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArmedSec:");
}

id objc_msgSend_setArmedSecMartyBicycle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArmedSecMartyBicycle:");
}

id objc_msgSend_setArmedSecMartyLocal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArmedSecMartyLocal:");
}

id objc_msgSend_setArmedSecMartyRemote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArmedSecMartyRemote:");
}

id objc_msgSend_setArmedSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setArmedSeconds:");
}

id objc_msgSend_setBody_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBody:");
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBool:forKey:");
}

id objc_msgSend_setBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBytes:");
}

id objc_msgSend_setCategoryIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCategoryIdentifier:");
}

id objc_msgSend_setChannel_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setChannel:");
}

id objc_msgSend_setCompanionStatusHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompanionStatusHandler:");
}

id objc_msgSend_setCompressed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCompressed:");
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateFormat:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDefaultActionURL_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDefaultActionURL:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDesiredAccuracy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDesiredAccuracy:");
}

id objc_msgSend_setDeviceMatching_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceMatching:");
}

id objc_msgSend_setDeviceNotificationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceNotificationHandler:");
}

id objc_msgSend_setDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDictionary:");
}

id objc_msgSend_setDiscretionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDiscretionary:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDouble_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDouble:forKey:");
}

id objc_msgSend_setEarliestBeginDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEarliestBeginDate:");
}

id objc_msgSend_setEnableMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEnableMode:");
}

id objc_msgSend_setEncryptMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptMonitor:");
}

id objc_msgSend_setEncryptedHmackey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptedHmackey:");
}

id objc_msgSend_setEncryptedMessageKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptedMessageKey:");
}

id objc_msgSend_setEncryptionIdentity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEncryptionIdentity:");
}

id objc_msgSend_setEndDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndDate:");
}

id objc_msgSend_setExtension_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExtension:value:");
}

id objc_msgSend_setFloat_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setFloat:forKey:");
}

id objc_msgSend_setForcedCompanionTrigger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setForcedCompanionTrigger:");
}

id objc_msgSend_setGPBGenericValue_forGPBGenericValueKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setGPBGenericValue:forGPBGenericValueKey:");
}

id objc_msgSend_setHTTPAdditionalHeaders_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPAdditionalHeaders:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setIdsService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIdsService:");
}

id objc_msgSend_setInputReportHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInputReportHandler:");
}

id objc_msgSend_setInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:");
}

id objc_msgSend_setInteger_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInteger:forKey:");
}

id objc_msgSend_setIsArmed_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIsArmed:");
}

id objc_msgSend_setIv_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIv:");
}

id objc_msgSend_setKappaArmedSeconds_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKappaArmedSeconds:");
}

id objc_msgSend_setKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKey:");
}

id objc_msgSend_setKeyValuePairs_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyValuePairs:");
}

id objc_msgSend_setKeyValuePairsArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setKeyValuePairsArray:");
}

id objc_msgSend_setLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLength:");
}

id objc_msgSend_setMapMissBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMapMissBehavior:");
}

id objc_msgSend_setMartyArmedSecondsLocal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMartyArmedSecondsLocal:");
}

id objc_msgSend_setMartyArmedSecondsRemote_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMartyArmedSecondsRemote:");
}

id objc_msgSend_setMcc1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcc1:");
}

id objc_msgSend_setMcc2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMcc2:");
}

id objc_msgSend_setMessageHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessageHandler:");
}

id objc_msgSend_setMnc1_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMnc1:");
}

id objc_msgSend_setMnc2_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMnc2:");
}

id objc_msgSend_setMonitoring_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitoring:");
}

id objc_msgSend_setNextFireDelay_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextFireDelay:");
}

id objc_msgSend_setNextFireDelay_interval_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNextFireDelay:interval:");
}

id objc_msgSend_setNotificationCategories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotificationCategories:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOobMetadataMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOobMetadataMonitor:");
}

id objc_msgSend_setPayloadIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadIdentifier:");
}

id objc_msgSend_setPayloadType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPayloadType:");
}

id objc_msgSend_setPreTriggerForcedCompanionTrigger(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreTriggerForcedCompanionTrigger");
}

id objc_msgSend_setRecording_withUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRecording:withUUID:");
}

id objc_msgSend_setRegistered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setRegistered:");
}

id objc_msgSend_setReport_reportLength_withIdentifier_forType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setReport:reportLength:withIdentifier:forType:error:");
}

id objc_msgSend_setServiceReplacementMap_missBehavior_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceReplacementMap:missBehavior:");
}

id objc_msgSend_setSex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSex:");
}

id objc_msgSend_setShouldDeleteTTR_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldDeleteTTR:");
}

id objc_msgSend_setShouldUpload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setShouldUpload:");
}

id objc_msgSend_setSilo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSilo:");
}

id objc_msgSend_setStartDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStartDate:");
}

id objc_msgSend_setStatusHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStatusHandler:");
}

id objc_msgSend_setString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setString:");
}

id objc_msgSend_setStudyUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setStudyUuid:");
}

id objc_msgSend_setSubjectAuthorizationToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubjectAuthorizationToken:");
}

id objc_msgSend_setSubjectID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubjectID:");
}

id objc_msgSend_setSubjectToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubjectToken:");
}

id objc_msgSend_setSubjectUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubjectUuid:");
}

id objc_msgSend_setSubmitMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubmitMonitor:");
}

id objc_msgSend_setSubmitter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubmitter:");
}

id objc_msgSend_setTaskDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTaskDescription:");
}

id objc_msgSend_setTestTriggerHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTestTriggerHandler:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeZone:");
}

id objc_msgSend_setTimeoutIntervalForResource_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTimeoutIntervalForResource:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTrailingHmaclength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrailingHmaclength:");
}

id objc_msgSend_setTrailingShalength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTrailingShalength:");
}

id objc_msgSend_setTtrManagedMsl_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTtrManagedMsl:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUnknownFields_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUnknownFields:");
}

id objc_msgSend_setUploadUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploadUuid:");
}

id objc_msgSend_setUploader_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUploader:");
}

id objc_msgSend_setUrlToCopyToOnStop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUrlToCopyToOnStop:");
}

id objc_msgSend_setUserAge_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUserAge:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setVersion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setVersion:");
}

id objc_msgSend_setWaitsForConnectivity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWaitsForConnectivity:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_setupExtraTextInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupExtraTextInfo:");
}

id objc_msgSend_setupRecurringScanningWithConfiguration_runNow_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupRecurringScanningWithConfiguration:runNow:");
}

id objc_msgSend_setupXPCHandler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupXPCHandler");
}

id objc_msgSend_sex(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sex");
}

id objc_msgSend_sharedConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConfiguration");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedConnection");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedService");
}

id objc_msgSend_shouldAttemptCoreAnalyticsUploadWithInterval_persistentKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldAttemptCoreAnalyticsUploadWithInterval:persistentKey:");
}

id objc_msgSend_shouldKeepCrashTTR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldKeepCrashTTR");
}

id objc_msgSend_shouldKeepTriggerTTR(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldKeepTriggerTTR");
}

id objc_msgSend_shouldUpload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUpload");
}

id objc_msgSend_shouldUploadRecording(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldUploadRecording");
}

id objc_msgSend_showConfirmationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showConfirmationWithError:");
}

id objc_msgSend_showConfirmationWithError_withEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showConfirmationWithError:withEventType:");
}

id objc_msgSend_showFeedbackAssistantSurveyWithUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showFeedbackAssistantSurveyWithUUID:");
}

id objc_msgSend_showPrivacyNotificationWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showPrivacyNotificationWithError:");
}

id objc_msgSend_showTTRWithTriggerUUID_ttrManagedFiles_withEventType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "showTTRWithTriggerUUID:ttrManagedFiles:withEventType:");
}

id objc_msgSend_signal_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "signal:data:");
}

id objc_msgSend_silo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "silo");
}

id objc_msgSend_singletonName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singletonName");
}

id objc_msgSend_singletonNameC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "singletonNameC");
}

id objc_msgSend_sinkContent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkContent");
}

id objc_msgSend_sinkContentFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkContentFinished");
}

id objc_msgSend_sinkWithCompletion_receiveInput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sinkWithCompletion:receiveInput:");
}

id objc_msgSend_skipField_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipField:");
}

id objc_msgSend_skipMessage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "skipMessage");
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sortedArrayUsingSelector_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedArrayUsingSelector:");
}

id objc_msgSend_sortedFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sortedFields");
}

id objc_msgSend_sosActivated(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sosActivated");
}

id objc_msgSend_sosKappaState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sosKappaState");
}

id objc_msgSend_sosStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sosStatus");
}

id objc_msgSend_sourceContentFinished(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sourceContentFinished");
}

id objc_msgSend_spatialMappedPlaceCategories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialMappedPlaceCategories");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardUserDefaults");
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_startIgneousUploader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startIgneousUploader");
}

id objc_msgSend_startMonitoringWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startMonitoringWithError:");
}

id objc_msgSend_startRecordingWithTTRManagedMsl_andPreempt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startRecordingWithTTRManagedMsl:andPreempt:");
}

id objc_msgSend_startTimer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startTimer:");
}

id objc_msgSend_startUploader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startUploader");
}

id objc_msgSend_startWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithError:");
}

id objc_msgSend_startWithOutputFileURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithOutputFileURL:error:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCode");
}

id objc_msgSend_statusCodeIndicatesSucess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusCodeIndicatesSucess");
}

id objc_msgSend_statusHandler_pairedDevice_timestamp_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "statusHandler:pairedDevice:timestamp:");
}

id objc_msgSend_stop_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop:");
}

id objc_msgSend_stopAndKeep_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopAndKeep:");
}

id objc_msgSend_stopRecurringScanning(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopRecurringScanning");
}

id objc_msgSend_stopSession(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSession");
}

id objc_msgSend_stopSession_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopSession:");
}

id objc_msgSend_stopTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stopTimer");
}

id objc_msgSend_streamError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "streamError");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAddingPercentEncodingWithAllowedCharacters:");
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringByDeletingLastPathComponent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByDeletingLastPathComponent");
}

id objc_msgSend_stringForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForKey:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCapacity:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_studyUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "studyUUID");
}

id objc_msgSend_studyUuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "studyUuid");
}

id objc_msgSend_subarrayWithRange_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subarrayWithRange:");
}

id objc_msgSend_subjectAuthorizationToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subjectAuthorizationToken");
}

id objc_msgSend_subjectID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subjectID");
}

id objc_msgSend_subjectToken(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subjectToken");
}

id objc_msgSend_subjectUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subjectUUID");
}

id objc_msgSend_submitFileWithURL_andCompletionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitFileWithURL:andCompletionHandler:");
}

id objc_msgSend_submitMonitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitMonitor");
}

id objc_msgSend_submitWithHandler_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitWithHandler:queue:");
}

id objc_msgSend_submitter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "submitter");
}

id objc_msgSend_subscribeOn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscribeOn:");
}

id objc_msgSend_substringFromIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringFromIndex:");
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "substringToIndex:");
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "superclass");
}

id objc_msgSend_sync_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sync:");
}

id objc_msgSend_syncgetClassForName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncgetClassForName:");
}

id objc_msgSend_syncget_isCompanionPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syncget_isCompanionPaired");
}

id objc_msgSend_syntax(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "syntax");
}

id objc_msgSend_tap2RadarUserConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tap2RadarUserConfiguration");
}

id objc_msgSend_taskDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "taskDescription");
}

id objc_msgSend_testTriggerHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "testTriggerHandler:");
}

id objc_msgSend_textFormatName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textFormatName");
}

id objc_msgSend_textFormatNameForValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "textFormatNameForValue:");
}

id objc_msgSend_ticketForSpatialPlaceLookupParameters_traits_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ticketForSpatialPlaceLookupParameters:traits:");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceNow");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceReferenceDate");
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeZoneForSecondsFromGMT:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timestamp");
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "title");
}

id objc_msgSend_trailingHmaclength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingHmaclength");
}

id objc_msgSend_trailingShalength(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "trailingShalength");
}

id objc_msgSend_triggerKappaWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerKappaWithCompletion:");
}

id objc_msgSend_triggerWithTimeInterval_repeats_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerWithTimeInterval:repeats:");
}

id objc_msgSend_triggered_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggered:");
}

id objc_msgSend_ttrManagedMsl(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ttrManagedMsl");
}

id objc_msgSend_turnByTurnDirectionsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "turnByTurnDirectionsEnabled");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unknownFields(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unknownFields");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_unsignedLongLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongLongValue");
}

id objc_msgSend_updateCompanion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCompanion");
}

id objc_msgSend_updateCompanionUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateCompanionUUID:");
}

id objc_msgSend_updateFractionalAudioMetadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateFractionalAudioMetadata");
}

id objc_msgSend_updateIDSStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateIDSStatus");
}

id objc_msgSend_updateKappaSessionClients_data_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateKappaSessionClients:data:");
}

id objc_msgSend_updateLocalUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateLocalUUID:");
}

id objc_msgSend_updateMartyUserInfoWithInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMartyUserInfoWithInfo:");
}

id objc_msgSend_updateMetadata_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateMetadata:");
}

id objc_msgSend_updatePersistedUserInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatePersistedUserInfo");
}

id objc_msgSend_updateRegistrationWithSubjectToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateRegistrationWithSubjectToken:");
}

id objc_msgSend_updateUserInfoSettings(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUserInfoSettings");
}

id objc_msgSend_updateUserStats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateUserStats");
}

id objc_msgSend_uploadRecording_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadRecording:");
}

id objc_msgSend_uploadTaskWithRequest_fromFile_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadTaskWithRequest:fromFile:");
}

id objc_msgSend_uploadUserInfoToCoreAnalyticsWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadUserInfoToCoreAnalyticsWithHandler:");
}

id objc_msgSend_uploadUserInfoWithHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uploadUserInfoWithHandler:");
}

id objc_msgSend_uppercaseLetterCharacterSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseLetterCharacterSet");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "url");
}

id objc_msgSend_urlToCopyToOnStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "urlToCopyToOnStop");
}

id objc_msgSend_userAge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userAge");
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfo");
}

id objc_msgSend_userInfoUploader(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "userInfoUploader");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_validationFunc(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "validationFunc");
}

id objc_msgSend_valueAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueAtIndex:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithPointer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithPointer:");
}

id objc_msgSend_varintList(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "varintList");
}

id objc_msgSend_vendor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vendor");
}

id objc_msgSend_wireType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wireType");
}

id objc_msgSend_write_maxLength_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "write:maxLength:");
}

id objc_msgSend_writeBool_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBool:value:");
}

id objc_msgSend_writeBoolNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBoolNoTag:");
}

id objc_msgSend_writeBytes_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytes:value:");
}

id objc_msgSend_writeBytesArray_values_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytesArray:values:");
}

id objc_msgSend_writeBytesNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeBytesNoTag:");
}

id objc_msgSend_writeDelimitedToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDelimitedToCodedOutputStream:");
}

id objc_msgSend_writeDoubleNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeDoubleNoTag:");
}

id objc_msgSend_writeEnum_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeEnum:value:");
}

id objc_msgSend_writeEnumNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeEnumNoTag:");
}

id objc_msgSend_writeExtensionsToCodedOutputStream_range_sortedExtensions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeExtensionsToCodedOutputStream:range:sortedExtensions:");
}

id objc_msgSend_writeField_toCodedOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeField:toCodedOutputStream:");
}

id objc_msgSend_writeFixed32Array_values_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed32Array:values:tag:");
}

id objc_msgSend_writeFixed32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed32NoTag:");
}

id objc_msgSend_writeFixed64Array_values_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed64Array:values:tag:");
}

id objc_msgSend_writeFixed64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFixed64NoTag:");
}

id objc_msgSend_writeFloatNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFloatNoTag:");
}

id objc_msgSend_writeGroup_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeGroup:value:");
}

id objc_msgSend_writeGroupNoTag_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeGroupNoTag:value:");
}

id objc_msgSend_writeInt32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeInt32NoTag:");
}

id objc_msgSend_writeInt64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeInt64NoTag:");
}

id objc_msgSend_writeMessage_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMessage:value:");
}

id objc_msgSend_writeMessageNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMessageNoTag:");
}

id objc_msgSend_writeMetadataToDisk_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeMetadataToDisk:");
}

id objc_msgSend_writeRawMessageSetExtension_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeRawMessageSetExtension:value:");
}

id objc_msgSend_writeRawVarintSizeTAs32_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeRawVarintSizeTAs32:");
}

id objc_msgSend_writeSFixed32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSFixed32NoTag:");
}

id objc_msgSend_writeSFixed64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSFixed64NoTag:");
}

id objc_msgSend_writeSInt32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSInt32NoTag:");
}

id objc_msgSend_writeSInt64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSInt64NoTag:");
}

id objc_msgSend_writeSourceContent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeSourceContent:");
}

id objc_msgSend_writeString_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeString:value:");
}

id objc_msgSend_writeStringNoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeStringNoTag:");
}

id objc_msgSend_writeTag_format_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeTag:format:");
}

id objc_msgSend_writeToCodedOutputStream_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToCodedOutputStream:");
}

id objc_msgSend_writeToOutput_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToOutput:");
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_writeUInt32NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt32NoTag:");
}

id objc_msgSend_writeUInt64Array_values_tag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt64Array:values:tag:");
}

id objc_msgSend_writeUInt64NoTag_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUInt64NoTag:");
}

id objc_msgSend_writeUnknownGroup_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeUnknownGroup:value:");
}

id objc_msgSend_year(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "year");
}

