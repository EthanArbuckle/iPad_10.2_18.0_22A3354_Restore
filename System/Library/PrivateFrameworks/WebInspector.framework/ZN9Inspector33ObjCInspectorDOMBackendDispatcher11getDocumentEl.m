@implementation ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl

_DWORD *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke_2(WTF::JSONImpl::Object *a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  _DWORD *v9;
  WTF::StringImpl *v10;
  _DWORD *result;
  uint64_t v12;
  _DWORD *v13;
  WTF::StringImpl *v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  char v17;

  WTF::JSONImpl::Object::create(a1);
  if (!a2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("root"));
  v3 = v15;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v14 = v16;
  if (a2)
  {
    objc_msgSend(a2, "toJSONObject");
    v4 = v12;
  }
  else
  {
    v4 = 0;
  }
  v13 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v15 + 16), &v14, (uint64_t *)&v13, (uint64_t)&v16);
  if (v17)
  {
    v5 = (uint64_t *)(v3 + 24);
    v6 = *(unsigned int *)(v3 + 36);
    if ((_DWORD)v6 == *(_DWORD *)(v3 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v14);
    }
    else
    {
      v7 = *v5;
      v8 = v14;
      if (v14)
        *(_DWORD *)v14 += 2;
      *(_QWORD *)(v7 + 8 * v6) = v8;
      *(_DWORD *)(v3 + 36) = v6 + 1;
    }
  }
  v9 = v13;
  v13 = 0;
  if (v9)
  {
    if (*v9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v9;
  }
  v10 = v14;
  v14 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  Inspector::BackendDispatcher::sendResponse();
  result = (_DWORD *)v15;
  v15 = 0;
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    else
      --*result;
  }
  return result;
}

@end
