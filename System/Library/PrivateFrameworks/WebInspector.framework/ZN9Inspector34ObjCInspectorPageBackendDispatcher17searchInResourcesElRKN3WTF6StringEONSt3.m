@implementation ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3

uint64_t *___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  _DWORD *v16;
  _DWORD *v17;
  WTF::StringImpl *v18;
  uint64_t *result;
  _DWORD *v20;
  _DWORD *v21;
  WTF::StringImpl *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t *v27;
  WTF::StringImpl *v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  WTF::JSONImpl::Object::create(a1);
  if (!a2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("result"));
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v3 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v24;
    v5 = *MEMORY[0x24BDBCAB8];
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v24 != v4)
          objc_enumerationMutation(a2);
        v7 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v8 = (void *)MEMORY[0x24BDBCE88];
          v9 = (objc_class *)objc_opt_class();
          objc_msgSend(v8, "raise:format:", v5, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v9), v7);
        }
      }
      v3 = objc_msgSend(a2, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v3);
  }
  v10 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = v28;
  Inspector::toJSONObjectArray((Inspector *)a2, (uint64_t *)&v20);
  v11 = (uint64_t)v20;
  v20 = 0;
  v21 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(v10 + 2, &v22, (uint64_t *)&v21, (uint64_t)&v28);
  if (v29)
  {
    v12 = v10 + 3;
    v13 = *((unsigned int *)v10 + 9);
    if ((_DWORD)v13 == *((_DWORD *)v10 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v22);
    }
    else
    {
      v14 = *v12;
      v15 = v22;
      if (v22)
        *(_DWORD *)v22 += 2;
      *(_QWORD *)(v14 + 8 * v13) = v15;
      *((_DWORD *)v10 + 9) = v13 + 1;
    }
  }
  v16 = v21;
  v21 = 0;
  if (v16)
  {
    if (*v16 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v16;
  }
  v17 = v20;
  v20 = 0;
  if (v17)
  {
    if (*v17 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v17;
  }
  v18 = v22;
  v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  Inspector::BackendDispatcher::sendResponse();
  result = v27;
  v27 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1)
      return (uint64_t *)WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)result;
  }
  return result;
}

@end
