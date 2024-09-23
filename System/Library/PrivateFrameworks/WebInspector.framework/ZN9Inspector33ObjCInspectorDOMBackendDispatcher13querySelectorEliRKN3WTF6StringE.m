@implementation ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE

WTF::JSONImpl::ObjectBase *___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1, unsigned int *a2)
{
  WTF::StringImpl *v3;
  WTF::JSONImpl::ObjectBase *result;
  WTF::StringImpl *v5;
  WTF::JSONImpl::ObjectBase *v6;
  WTF::StringImpl *v7;

  WTF::JSONImpl::Object::create(a1);
  if (a2)
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v5 = v7;
    WTF::JSONImpl::ObjectBase::setInteger(v6, &v5, (WTF::JSONImpl::Value *)*a2);
    v3 = v5;
    v5 = 0;
    if (v3)
    {
      if (*(_DWORD *)v3 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v3 -= 2;
    }
  }
  Inspector::BackendDispatcher::sendResponse();
  result = v6;
  v6 = 0;
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
