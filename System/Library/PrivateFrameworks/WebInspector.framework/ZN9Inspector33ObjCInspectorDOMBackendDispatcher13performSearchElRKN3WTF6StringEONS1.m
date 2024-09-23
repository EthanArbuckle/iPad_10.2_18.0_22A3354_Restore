@implementation ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1

WTF::JSONImpl::ObjectBase *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2, WTF::JSONImpl::Value *a3)
{
  WTF::StringImpl *v5;
  WTF::StringImpl *v6;
  WTF::JSONImpl::ObjectBase *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::ObjectBase *result;
  WTF::StringImpl *v10;
  WTF::JSONImpl::ObjectBase *v11;
  WTF::StringImpl *v12;

  WTF::JSONImpl::Object::create(a1);
  if (!a2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("searchId"));
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v10 = v12;
  MEMORY[0x2207574E0](&v12, a2);
  WTF::JSONImpl::ObjectBase::setString(v11, (const WTF::String *)&v10, (const WTF::String *)&v12);
  v5 = v12;
  v12 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v10;
  v10 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v11;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v10 = v12;
  WTF::JSONImpl::ObjectBase::setInteger(v7, &v10, a3);
  v8 = v10;
  v10 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  Inspector::BackendDispatcher::sendResponse();
  result = v11;
  v11 = 0;
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
