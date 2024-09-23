@implementation ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE

WTF::JSONImpl::ObjectBase *___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, uint64_t a2)
{
  _DWORD *v3;
  _DWORD *v4;
  WTF::JSONImpl::ObjectBase *result;
  _DWORD *v6;
  WTF::JSONImpl::ObjectBase *v7;
  _DWORD *v8;

  WTF::JSONImpl::Object::create(a1);
  if (!a2)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("serializedCertificate"));
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v6 = v8;
  MEMORY[0x2207574E0](&v8, a2);
  WTF::JSONImpl::ObjectBase::setString(v7, (const WTF::String *)&v6, (const WTF::String *)&v8);
  v3 = v8;
  v8 = 0;
  if (v3)
  {
    if (*v3 == 2)
      WTF::StringImpl::destroy();
    else
      *v3 -= 2;
  }
  v4 = v6;
  v6 = 0;
  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
  Inspector::BackendDispatcher::sendResponse();
  result = v7;
  v7 = 0;
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
