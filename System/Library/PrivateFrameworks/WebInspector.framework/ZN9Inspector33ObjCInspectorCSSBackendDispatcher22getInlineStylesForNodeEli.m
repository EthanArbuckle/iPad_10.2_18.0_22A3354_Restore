@implementation ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli

_DWORD *___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1, id *a2, id *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  WTF::StringImpl *v10;
  _DWORD *v11;
  WTF::StringImpl *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::StringImpl *v20;
  _DWORD *result;
  uint64_t v22;
  _DWORD *v23;
  WTF::StringImpl *v24;
  uint64_t v25;
  _QWORD v26[2];
  char v27;

  WTF::JSONImpl::Object::create(a1);
  if (a2 && !*a2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("inlineStyle"));
  if (a3 && !*a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("attributesStyle"));
  if (a2)
  {
    v5 = v25;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v24 = (WTF::StringImpl *)v26[0];
    if (*a2)
    {
      objc_msgSend(*a2, "toJSONObject");
      v6 = v22;
    }
    else
    {
      v6 = 0;
    }
    v23 = (_DWORD *)v6;
    WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v25 + 16), &v24, (uint64_t *)&v23, (uint64_t)v26);
    if (v27)
    {
      v7 = (uint64_t *)(v5 + 24);
      v8 = *(unsigned int *)(v5 + 36);
      if ((_DWORD)v8 == *(_DWORD *)(v5 + 32))
      {
        WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v7, (unint64_t)&v24);
      }
      else
      {
        v9 = *v7;
        v10 = v24;
        if (v24)
          *(_DWORD *)v24 += 2;
        *(_QWORD *)(v9 + 8 * v8) = v10;
        *(_DWORD *)(v5 + 36) = v8 + 1;
      }
    }
    v11 = v23;
    v23 = 0;
    if (v11)
    {
      if (*v11 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v11;
    }
    v22 = 0;
    v12 = v24;
    v24 = 0;
    if (v12)
    {
      if (*(_DWORD *)v12 == 2)
      {
        WTF::StringImpl::destroy();
        if (!a3)
          goto LABEL_44;
        goto LABEL_25;
      }
      *(_DWORD *)v12 -= 2;
    }
  }
  if (!a3)
    goto LABEL_44;
LABEL_25:
  v13 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::StringImpl *)v26[0];
  if (*a3)
  {
    objc_msgSend(*a3, "toJSONObject");
    v14 = v22;
  }
  else
  {
    v14 = 0;
  }
  v23 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)(v13 + 16), &v24, (uint64_t *)&v23, (uint64_t)v26);
  if (v27)
  {
    v15 = (uint64_t *)(v13 + 24);
    v16 = *(unsigned int *)(v13 + 36);
    if ((_DWORD)v16 == *(_DWORD *)(v13 + 32))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v24);
    }
    else
    {
      v17 = *v15;
      v18 = v24;
      if (v24)
        *(_DWORD *)v24 += 2;
      *(_QWORD *)(v17 + 8 * v16) = v18;
      *(_DWORD *)(v13 + 36) = v16 + 1;
    }
  }
  v19 = v23;
  v23 = 0;
  if (v19)
  {
    if (*v19 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v19;
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v20 -= 2;
  }
LABEL_44:
  Inspector::BackendDispatcher::sendResponse();
  result = (_DWORD *)v25;
  v25 = 0;
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
