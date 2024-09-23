@implementation ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4

WTF::JSONImpl::ObjectBase *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2, uint64_t a3, WTF::JSONImpl::Value *a4)
{
  WTF::StringImpl *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::ObjectBase *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  WTF::JSONImpl::ObjectBase *v12;
  WTF::StringImpl *v13;
  WTF::JSONImpl::ObjectBase *result;
  WTF::StringImpl *v15;
  WTF::JSONImpl::ObjectBase *v16;
  WTF::StringImpl *v17;

  WTF::JSONImpl::Object::create(a1);
  if (!a2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("content"));
  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("mimeType"));
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v15 = v17;
  MEMORY[0x2207574E0](&v17, a2);
  WTF::JSONImpl::ObjectBase::setString(v16, (const WTF::String *)&v15, (const WTF::String *)&v17);
  v7 = v17;
  v17 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  v8 = v15;
  v15 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v15 = v17;
  MEMORY[0x2207574E0](&v17, a3);
  WTF::JSONImpl::ObjectBase::setString(v9, (const WTF::String *)&v15, (const WTF::String *)&v17);
  v10 = v17;
  v17 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
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
  v12 = v16;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v15 = v17;
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v15, a4);
  v13 = v15;
  v15 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  Inspector::BackendDispatcher::sendResponse();
  result = v16;
  v16 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1)
      return (WTF::JSONImpl::ObjectBase *)WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)result;
  }
  return result;
}

@end
