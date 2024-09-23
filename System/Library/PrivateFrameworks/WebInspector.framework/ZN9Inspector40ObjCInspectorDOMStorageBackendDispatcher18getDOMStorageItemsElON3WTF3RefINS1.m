@implementation ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1

uint64_t *___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1, Inspector *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  _DWORD *v9;
  _DWORD *v10;
  WTF::StringImpl *v11;
  uint64_t *result;
  _DWORD *v13;
  _DWORD *v14;
  WTF::StringImpl *v15;
  uint64_t *v16;
  WTF::StringImpl *v17;
  char v18;

  WTF::JSONImpl::Object::create(a1);
  if (!a2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("entries"));
  v3 = v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v15 = v17;
  Inspector::toJSONStringArrayArray(a2, (uint64_t *)&v13);
  v4 = (uint64_t)v13;
  v13 = 0;
  v14 = (_DWORD *)v4;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(v3 + 2, &v15, (uint64_t *)&v14, (uint64_t)&v17);
  if (v18)
  {
    v5 = v3 + 3;
    v6 = *((unsigned int *)v3 + 9);
    if ((_DWORD)v6 == *((_DWORD *)v3 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)&v15);
    }
    else
    {
      v7 = *v5;
      v8 = v15;
      if (v15)
        *(_DWORD *)v15 += 2;
      *(_QWORD *)(v7 + 8 * v6) = v8;
      *((_DWORD *)v3 + 9) = v6 + 1;
    }
  }
  v9 = v14;
  v14 = 0;
  if (v9)
  {
    if (*v9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v9;
  }
  v10 = v13;
  v13 = 0;
  if (v10)
  {
    if (*v10 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v10;
  }
  v11 = v15;
  v15 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  Inspector::BackendDispatcher::sendResponse();
  result = v16;
  v16 = 0;
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
