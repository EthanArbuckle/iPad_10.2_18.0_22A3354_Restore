@implementation RWIProtocolNetworkDomainEventDispatcher

- (RWIProtocolNetworkDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  RWIProtocolNetworkDomainEventDispatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolNetworkDomainEventDispatcher;
  result = -[RWIProtocolNetworkDomainEventDispatcher init](&v5, sel_init);
  if (result)
    result->_controller = a3;
  return result;
}

- (void)requestWillBeSentWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 documentURL:(id)a6 request:(id)a7 timestamp:(double)a8 walltime:(double)a9 initiator:(id)a10 redirectResponse:(id *)a11 type:(int64_t *)a12 targetId:(id *)a13
{
  WTF::JSONImpl::Object *v21;
  Inspector::FrontendRouter *v22;
  WTF::StringImpl *v23;
  WTF::JSONImpl::Object *v24;
  WTF::JSONImpl::ObjectBase *v25;
  _DWORD *v26;
  WTF::StringImpl *v27;
  WTF::JSONImpl::ObjectBase *v28;
  _DWORD *v29;
  WTF::StringImpl *v30;
  WTF::JSONImpl::ObjectBase *v31;
  _DWORD *v32;
  WTF::StringImpl *v33;
  WTF::JSONImpl::ObjectBase *v34;
  _DWORD *v35;
  WTF::StringImpl *v36;
  WTF::JSONImpl::Object *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  WTF::StringImpl *v42;
  _DWORD *v43;
  WTF::StringImpl *v44;
  WTF::JSONImpl::ObjectBase *v45;
  WTF::StringImpl *v46;
  WTF::JSONImpl::ObjectBase *v47;
  WTF::StringImpl *v48;
  WTF::JSONImpl::Object *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  WTF::StringImpl *v53;
  _DWORD *v54;
  WTF::StringImpl *v55;
  WTF::JSONImpl::Object *v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t v59;
  WTF::StringImpl *v60;
  _DWORD *v61;
  WTF::StringImpl *v62;
  WTF::JSONImpl::ObjectBase *v63;
  _DWORD *v64;
  WTF::StringImpl *v65;
  WTF::JSONImpl::ObjectBase *v66;
  _DWORD *v67;
  WTF::StringImpl *v68;
  WTF::JSONImpl::Value *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  WTF::StringImpl *v74;
  _DWORD *v75;
  WTF::StringImpl *v76;
  _DWORD *v77;
  WTF::JSONImpl::Object *v78;
  WTF::JSONImpl::Value *v79;
  uint64_t v80;
  _DWORD *v81;
  WTF::StringImpl *v82;
  WTF::JSONImpl::Object *v83;
  WTF::JSONImpl::Value *v84;
  _QWORD v85[2];
  char v86;

  v21 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v22 = v21;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_20:
      v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("loaderId"));
      if (a6)
        goto LABEL_5;
      goto LABEL_21;
    }
  }
  v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
  if (!a5)
    goto LABEL_20;
LABEL_4:
  if (a6)
    goto LABEL_5;
LABEL_21:
  v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("documentURL"));
LABEL_5:
  if (!a7)
    v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("request"));
  if (!a10)
    v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("initiator"));
  if (a11 && !*a11)
    v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("redirectResponse"));
  if (a13 && !*a13)
    v21 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("targetId"));
  WTF::JSONImpl::Object::create(v21);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v83 = (WTF::JSONImpl::Object *)v85[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  WTF::JSONImpl::ObjectBase::setString(v84, (const WTF::String *)&v83, (const WTF::String *)&v82);
  v23 = v82;
  v82 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v23 -= 2;
  }
  v24 = v83;
  v83 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      v24 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v24 -= 2;
  }
  WTF::JSONImpl::Object::create(v24);
  v25 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  MEMORY[0x2207574E0](v85, a3);
  WTF::JSONImpl::ObjectBase::setString(v25, (const WTF::String *)&v82, (const WTF::String *)v85);
  v26 = (_DWORD *)v85[0];
  v85[0] = 0;
  if (v26)
  {
    if (*v26 == 2)
      WTF::StringImpl::destroy();
    else
      *v26 -= 2;
  }
  v27 = v82;
  v82 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v27 -= 2;
  }
  v28 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  MEMORY[0x2207574E0](v85, a4);
  WTF::JSONImpl::ObjectBase::setString(v28, (const WTF::String *)&v82, (const WTF::String *)v85);
  v29 = (_DWORD *)v85[0];
  v85[0] = 0;
  if (v29)
  {
    if (*v29 == 2)
      WTF::StringImpl::destroy();
    else
      *v29 -= 2;
  }
  v30 = v82;
  v82 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v30 -= 2;
  }
  v31 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  MEMORY[0x2207574E0](v85, a5);
  WTF::JSONImpl::ObjectBase::setString(v31, (const WTF::String *)&v82, (const WTF::String *)v85);
  v32 = (_DWORD *)v85[0];
  v85[0] = 0;
  if (v32)
  {
    if (*v32 == 2)
      WTF::StringImpl::destroy();
    else
      *v32 -= 2;
  }
  v33 = v82;
  v82 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v33 -= 2;
  }
  v34 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  MEMORY[0x2207574E0](v85, a6);
  WTF::JSONImpl::ObjectBase::setString(v34, (const WTF::String *)&v82, (const WTF::String *)v85);
  v35 = (_DWORD *)v85[0];
  v85[0] = 0;
  if (v35)
  {
    if (*v35 == 2)
      WTF::StringImpl::destroy();
    else
      *v35 -= 2;
  }
  v36 = v82;
  v82 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v36 -= 2;
  }
  v37 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  if (a7)
  {
    objc_msgSend(a7, "toJSONObject");
    v38 = v80;
  }
  else
  {
    v38 = 0;
  }
  v81 = (_DWORD *)v38;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v37 + 2, &v82, (uint64_t *)&v81, (uint64_t)v85);
  if (v86)
  {
    v39 = (uint64_t *)((char *)v37 + 24);
    v40 = *((unsigned int *)v37 + 9);
    if ((_DWORD)v40 == *((_DWORD *)v37 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v39, (unint64_t)&v82);
    }
    else
    {
      v41 = *v39;
      v42 = v82;
      if (v82)
        *(_DWORD *)v82 += 2;
      *(_QWORD *)(v41 + 8 * v40) = v42;
      *((_DWORD *)v37 + 9) = v40 + 1;
    }
  }
  v43 = v81;
  v81 = 0;
  if (v43)
  {
    if (*v43 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v43;
  }
  v44 = v82;
  v82 = 0;
  if (v44)
  {
    if (*(_DWORD *)v44 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v44 -= 2;
  }
  v45 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  WTF::JSONImpl::ObjectBase::setDouble(v45, &v82, a8);
  v46 = v82;
  v82 = 0;
  if (v46)
  {
    if (*(_DWORD *)v46 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v46 -= 2;
  }
  v47 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  WTF::JSONImpl::ObjectBase::setDouble(v47, &v82, a9);
  v48 = v82;
  v82 = 0;
  if (v48)
  {
    if (*(_DWORD *)v48 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v48 -= 2;
  }
  v49 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  if (a10)
    objc_msgSend(a10, "toJSONObject");
  v81 = 0;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v49 + 2, &v82, (uint64_t *)&v81, (uint64_t)v85);
  if (v86)
  {
    v50 = (uint64_t *)((char *)v49 + 24);
    v51 = *((unsigned int *)v49 + 9);
    if ((_DWORD)v51 == *((_DWORD *)v49 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v50, (unint64_t)&v82);
    }
    else
    {
      v52 = *v50;
      v53 = v82;
      if (v82)
        *(_DWORD *)v82 += 2;
      *(_QWORD *)(v52 + 8 * v51) = v53;
      *((_DWORD *)v49 + 9) = v51 + 1;
    }
  }
  v54 = v81;
  v81 = 0;
  if (v54)
  {
    if (*v54 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v54;
  }
  v55 = v82;
  v82 = 0;
  if (v55)
  {
    if (*(_DWORD *)v55 == 2)
    {
      WTF::StringImpl::destroy();
      if (!a11)
        goto LABEL_118;
      goto LABEL_102;
    }
    *(_DWORD *)v55 -= 2;
  }
  if (!a11)
    goto LABEL_118;
LABEL_102:
  v56 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  if (*a11)
    objc_msgSend(*a11, "toJSONObject");
  v81 = 0;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v56 + 2, &v82, (uint64_t *)&v81, (uint64_t)v85);
  if (v86)
  {
    v57 = (uint64_t *)((char *)v56 + 24);
    v58 = *((unsigned int *)v56 + 9);
    if ((_DWORD)v58 == *((_DWORD *)v56 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v57, (unint64_t)&v82);
    }
    else
    {
      v59 = *v57;
      v60 = v82;
      if (v82)
        *(_DWORD *)v82 += 2;
      *(_QWORD *)(v59 + 8 * v58) = v60;
      *((_DWORD *)v56 + 9) = v58 + 1;
    }
  }
  v61 = v81;
  v81 = 0;
  if (v61)
  {
    if (*v61 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v61;
  }
  v62 = v82;
  v82 = 0;
  if (v62)
  {
    if (*(_DWORD *)v62 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v62 -= 2;
  }
LABEL_118:
  if (a12)
  {
    v63 = v83;
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    v82 = (WTF::StringImpl *)v85[0];
    Inspector::toProtocolString(*a12);
    WTF::JSONImpl::ObjectBase::setString(v63, (const WTF::String *)&v82, (const WTF::String *)v85);
    v64 = (_DWORD *)v85[0];
    v85[0] = 0;
    if (v64)
    {
      if (*v64 == 2)
        WTF::StringImpl::destroy();
      else
        *v64 -= 2;
    }
    v65 = v82;
    v82 = 0;
    if (v65)
    {
      if (*(_DWORD *)v65 == 2)
      {
        WTF::StringImpl::destroy();
        if (!a13)
          goto LABEL_137;
        goto LABEL_127;
      }
      *(_DWORD *)v65 -= 2;
    }
  }
  if (!a13)
    goto LABEL_137;
LABEL_127:
  v66 = v83;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v82 = (WTF::StringImpl *)v85[0];
  MEMORY[0x2207574E0](v85, *a13);
  WTF::JSONImpl::ObjectBase::setString(v66, (const WTF::String *)&v82, (const WTF::String *)v85);
  v67 = (_DWORD *)v85[0];
  v85[0] = 0;
  if (v67)
  {
    if (*v67 == 2)
      WTF::StringImpl::destroy();
    else
      *v67 -= 2;
  }
  v68 = v82;
  v82 = 0;
  if (v68)
  {
    if (*(_DWORD *)v68 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v68 -= 2;
  }
LABEL_137:
  v69 = v84;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v70 = (uint64_t)v83;
  v82 = (WTF::StringImpl *)v85[0];
  v83 = 0;
  v81 = (_DWORD *)v70;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v69 + 2, &v82, (uint64_t *)&v81, (uint64_t)v85);
  if (v86)
  {
    v71 = (uint64_t *)((char *)v69 + 24);
    v72 = *((unsigned int *)v69 + 9);
    if ((_DWORD)v72 == *((_DWORD *)v69 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v71, (unint64_t)&v82);
    }
    else
    {
      v73 = *v71;
      v74 = v82;
      if (v82)
        *(_DWORD *)v82 += 2;
      *(_QWORD *)(v73 + 8 * v72) = v74;
      *((_DWORD *)v69 + 9) = v72 + 1;
    }
  }
  v75 = v81;
  v81 = 0;
  if (v75)
  {
    if (*v75 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v75;
  }
  v76 = v82;
  v82 = 0;
  if (v76)
  {
    if (*(_DWORD *)v76 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v76 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v84);
  Inspector::FrontendRouter::sendEvent(v22, (const WTF::String *)v85);
  v77 = (_DWORD *)v85[0];
  v85[0] = 0;
  if (v77)
  {
    if (*v77 == 2)
      WTF::StringImpl::destroy();
    else
      *v77 -= 2;
  }
  v78 = v83;
  v83 = 0;
  if (v78)
  {
    if (*(_DWORD *)v78 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v78;
  }
  v79 = v84;
  v84 = 0;
  if (v79)
  {
    if (*(_DWORD *)v79 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v79;
  }
}

- (void)responseReceivedWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 timestamp:(double)a6 type:(int64_t)a7 response:(id)a8
{
  WTF::JSONImpl::Object *v14;
  Inspector::FrontendRouter *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::Object *v17;
  WTF::JSONImpl::ObjectBase *v18;
  _DWORD *v19;
  WTF::StringImpl *v20;
  WTF::JSONImpl::ObjectBase *v21;
  _DWORD *v22;
  WTF::StringImpl *v23;
  WTF::JSONImpl::ObjectBase *v24;
  _DWORD *v25;
  WTF::StringImpl *v26;
  WTF::JSONImpl::ObjectBase *v27;
  WTF::StringImpl *v28;
  WTF::JSONImpl::ObjectBase *v29;
  _DWORD *v30;
  WTF::StringImpl *v31;
  WTF::JSONImpl::Object *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  WTF::StringImpl *v37;
  _DWORD *v38;
  WTF::StringImpl *v39;
  WTF::JSONImpl::Value *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  WTF::StringImpl *v45;
  _DWORD *v46;
  WTF::StringImpl *v47;
  _DWORD *v48;
  WTF::JSONImpl::Object *v49;
  WTF::JSONImpl::Value *v50;
  uint64_t v51;
  _DWORD *v52;
  WTF::StringImpl *v53;
  WTF::JSONImpl::Object *v54;
  WTF::JSONImpl::Value *v55;
  _QWORD v56[2];
  char v57;

  v14 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v15 = v14;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v14 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_10:
      v14 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("loaderId"));
      if (a8)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v14 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
  if (!a5)
    goto LABEL_10;
LABEL_4:
  if (a8)
    goto LABEL_5;
LABEL_11:
  v14 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("response"));
LABEL_5:
  WTF::JSONImpl::Object::create(v14);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v54 = (WTF::JSONImpl::Object *)v56[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v53 = (WTF::StringImpl *)v56[0];
  WTF::JSONImpl::ObjectBase::setString(v55, (const WTF::String *)&v54, (const WTF::String *)&v53);
  v16 = v53;
  v53 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v54;
  v54 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      v17 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v17 -= 2;
  }
  WTF::JSONImpl::Object::create(v17);
  v18 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v53 = (WTF::StringImpl *)v56[0];
  MEMORY[0x2207574E0](v56, a3);
  WTF::JSONImpl::ObjectBase::setString(v18, (const WTF::String *)&v53, (const WTF::String *)v56);
  v19 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v19)
  {
    if (*v19 == 2)
      WTF::StringImpl::destroy();
    else
      *v19 -= 2;
  }
  v20 = v53;
  v53 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v20 -= 2;
  }
  v21 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v53 = (WTF::StringImpl *)v56[0];
  MEMORY[0x2207574E0](v56, a4);
  WTF::JSONImpl::ObjectBase::setString(v21, (const WTF::String *)&v53, (const WTF::String *)v56);
  v22 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v22)
  {
    if (*v22 == 2)
      WTF::StringImpl::destroy();
    else
      *v22 -= 2;
  }
  v23 = v53;
  v53 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v23 -= 2;
  }
  v24 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v53 = (WTF::StringImpl *)v56[0];
  MEMORY[0x2207574E0](v56, a5);
  WTF::JSONImpl::ObjectBase::setString(v24, (const WTF::String *)&v53, (const WTF::String *)v56);
  v25 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v25)
  {
    if (*v25 == 2)
      WTF::StringImpl::destroy();
    else
      *v25 -= 2;
  }
  v26 = v53;
  v53 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v26 -= 2;
  }
  v27 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v53 = (WTF::StringImpl *)v56[0];
  WTF::JSONImpl::ObjectBase::setDouble(v27, &v53, a6);
  v28 = v53;
  v53 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v28 -= 2;
  }
  v29 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v53 = (WTF::StringImpl *)v56[0];
  Inspector::toProtocolString(a7);
  WTF::JSONImpl::ObjectBase::setString(v29, (const WTF::String *)&v53, (const WTF::String *)v56);
  v30 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v30)
  {
    if (*v30 == 2)
      WTF::StringImpl::destroy();
    else
      *v30 -= 2;
  }
  v31 = v53;
  v53 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v31 -= 2;
  }
  v32 = v54;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v53 = (WTF::StringImpl *)v56[0];
  if (a8)
  {
    objc_msgSend(a8, "toJSONObject");
    v33 = v51;
  }
  else
  {
    v33 = 0;
  }
  v52 = (_DWORD *)v33;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v32 + 2, &v53, (uint64_t *)&v52, (uint64_t)v56);
  if (v57)
  {
    v34 = (uint64_t *)((char *)v32 + 24);
    v35 = *((unsigned int *)v32 + 9);
    if ((_DWORD)v35 == *((_DWORD *)v32 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v34, (unint64_t)&v53);
    }
    else
    {
      v36 = *v34;
      v37 = v53;
      if (v53)
        *(_DWORD *)v53 += 2;
      *(_QWORD *)(v36 + 8 * v35) = v37;
      *((_DWORD *)v32 + 9) = v35 + 1;
    }
  }
  v38 = v52;
  v52 = 0;
  if (v38)
  {
    if (*v38 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v38;
  }
  v39 = v53;
  v53 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v39 -= 2;
  }
  v40 = v55;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v41 = (uint64_t)v54;
  v53 = (WTF::StringImpl *)v56[0];
  v54 = 0;
  v52 = (_DWORD *)v41;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v40 + 2, &v53, (uint64_t *)&v52, (uint64_t)v56);
  if (v57)
  {
    v42 = (uint64_t *)((char *)v40 + 24);
    v43 = *((unsigned int *)v40 + 9);
    if ((_DWORD)v43 == *((_DWORD *)v40 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v42, (unint64_t)&v53);
    }
    else
    {
      v44 = *v42;
      v45 = v53;
      if (v53)
        *(_DWORD *)v53 += 2;
      *(_QWORD *)(v44 + 8 * v43) = v45;
      *((_DWORD *)v40 + 9) = v43 + 1;
    }
  }
  v46 = v52;
  v52 = 0;
  if (v46)
  {
    if (*v46 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v46;
  }
  v47 = v53;
  v53 = 0;
  if (v47)
  {
    if (*(_DWORD *)v47 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v47 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v55);
  Inspector::FrontendRouter::sendEvent(v15, (const WTF::String *)v56);
  v48 = (_DWORD *)v56[0];
  v56[0] = 0;
  if (v48)
  {
    if (*v48 == 2)
      WTF::StringImpl::destroy();
    else
      *v48 -= 2;
  }
  v49 = v54;
  v54 = 0;
  if (v49)
  {
    if (*(_DWORD *)v49 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v49;
  }
  v50 = v55;
  v55 = 0;
  if (v50)
  {
    if (*(_DWORD *)v50 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v50;
  }
}

- (void)dataReceivedWithRequestId:(id)a3 timestamp:(double)a4 dataLength:(int)a5 encodedDataLength:(int)a6
{
  WTF::JSONImpl::Value *v6;
  WTF::JSONImpl::Value *v7;
  WTF::JSONImpl::Object *v10;
  Inspector::FrontendRouter *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  WTF::JSONImpl::ObjectBase *v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::ObjectBase *v17;
  WTF::StringImpl *v18;
  WTF::JSONImpl::ObjectBase *v19;
  WTF::StringImpl *v20;
  WTF::JSONImpl::ObjectBase *v21;
  WTF::StringImpl *v22;
  WTF::JSONImpl::Value *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  WTF::StringImpl *v28;
  _DWORD *v29;
  WTF::StringImpl *v30;
  _DWORD *v31;
  WTF::JSONImpl::Object *v32;
  WTF::JSONImpl::Value *v33;
  _DWORD *v34;
  WTF::StringImpl *v35;
  WTF::JSONImpl::Object *v36;
  WTF::JSONImpl::Value *v37;
  _QWORD v38[2];
  char v39;

  v6 = *(WTF::JSONImpl::Value **)&a6;
  v7 = *(WTF::JSONImpl::Value **)&a5;
  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (!a3)
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
  WTF::JSONImpl::Object::create(v10);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v36 = (WTF::JSONImpl::Object *)v38[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setString(v37, (const WTF::String *)&v36, (const WTF::String *)&v35);
  v12 = v35;
  v35 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v36;
  v36 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  WTF::JSONImpl::Object::create(v13);
  v14 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  MEMORY[0x2207574E0](v38, a3);
  WTF::JSONImpl::ObjectBase::setString(v14, (const WTF::String *)&v35, (const WTF::String *)v38);
  v15 = (_DWORD *)v38[0];
  v38[0] = 0;
  if (v15)
  {
    if (*v15 == 2)
      WTF::StringImpl::destroy();
    else
      *v15 -= 2;
  }
  v16 = v35;
  v35 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setDouble(v17, &v35, a4);
  v18 = v35;
  v35 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setInteger(v19, &v35, v7);
  v20 = v35;
  v35 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v20 -= 2;
  }
  v21 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::StringImpl *)v38[0];
  WTF::JSONImpl::ObjectBase::setInteger(v21, &v35, v6);
  v22 = v35;
  v35 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v22 -= 2;
  }
  v23 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (uint64_t)v36;
  v35 = (WTF::StringImpl *)v38[0];
  v36 = 0;
  v34 = (_DWORD *)v24;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v23 + 2, &v35, (uint64_t *)&v34, (uint64_t)v38);
  if (v39)
  {
    v25 = (uint64_t *)((char *)v23 + 24);
    v26 = *((unsigned int *)v23 + 9);
    if ((_DWORD)v26 == *((_DWORD *)v23 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v25, (unint64_t)&v35);
    }
    else
    {
      v27 = *v25;
      v28 = v35;
      if (v35)
        *(_DWORD *)v35 += 2;
      *(_QWORD *)(v27 + 8 * v26) = v28;
      *((_DWORD *)v23 + 9) = v26 + 1;
    }
  }
  v29 = v34;
  v34 = 0;
  if (v29)
  {
    if (*v29 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v29;
  }
  v30 = v35;
  v35 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v30 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v37);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v38);
  v31 = (_DWORD *)v38[0];
  v38[0] = 0;
  if (v31)
  {
    if (*v31 == 2)
      WTF::StringImpl::destroy();
    else
      *v31 -= 2;
  }
  v32 = v36;
  v36 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v32;
  }
  v33 = v37;
  v37 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v33;
  }
}

- (void)loadingFinishedWithRequestId:(id)a3 timestamp:(double)a4 sourceMapURL:(id *)a5 metrics:(id *)a6
{
  WTF::JSONImpl::Object *v10;
  Inspector::FrontendRouter *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  WTF::JSONImpl::ObjectBase *v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::ObjectBase *v17;
  WTF::StringImpl *v18;
  WTF::JSONImpl::ObjectBase *v19;
  _DWORD *v20;
  WTF::StringImpl *v21;
  WTF::JSONImpl::Object *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  WTF::StringImpl *v27;
  _DWORD *v28;
  WTF::StringImpl *v29;
  WTF::JSONImpl::Value *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  WTF::StringImpl *v35;
  _DWORD *v36;
  WTF::StringImpl *v37;
  _DWORD *v38;
  WTF::JSONImpl::Object *v39;
  WTF::JSONImpl::Value *v40;
  uint64_t v41;
  _DWORD *v42;
  WTF::StringImpl *v43;
  WTF::JSONImpl::Object *v44;
  WTF::JSONImpl::Value *v45;
  _QWORD v46[2];
  char v47;

  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (!a3)
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
  if (a5 && !*a5)
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("sourceMapURL"));
  if (a6 && !*a6)
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("metrics"));
  WTF::JSONImpl::Object::create(v10);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v44 = (WTF::JSONImpl::Object *)v46[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setString(v45, (const WTF::String *)&v44, (const WTF::String *)&v43);
  v12 = v43;
  v43 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v44;
  v44 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  WTF::JSONImpl::Object::create(v13);
  v14 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  MEMORY[0x2207574E0](v46, a3);
  WTF::JSONImpl::ObjectBase::setString(v14, (const WTF::String *)&v43, (const WTF::String *)v46);
  v15 = (_DWORD *)v46[0];
  v46[0] = 0;
  if (v15)
  {
    if (*v15 == 2)
      WTF::StringImpl::destroy();
    else
      *v15 -= 2;
  }
  v16 = v43;
  v43 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  WTF::JSONImpl::ObjectBase::setDouble(v17, &v43, a4);
  v18 = v43;
  v43 = 0;
  if (!v18)
  {
LABEL_28:
    if (!a5)
      goto LABEL_38;
    goto LABEL_31;
  }
  if (*(_DWORD *)v18 != 2)
  {
    *(_DWORD *)v18 -= 2;
    goto LABEL_28;
  }
  WTF::StringImpl::destroy();
  if (!a5)
    goto LABEL_38;
LABEL_31:
  v19 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  MEMORY[0x2207574E0](v46, *a5);
  WTF::JSONImpl::ObjectBase::setString(v19, (const WTF::String *)&v43, (const WTF::String *)v46);
  v20 = (_DWORD *)v46[0];
  v46[0] = 0;
  if (v20)
  {
    if (*v20 == 2)
      WTF::StringImpl::destroy();
    else
      *v20 -= 2;
  }
  v21 = v43;
  v43 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
    {
      WTF::StringImpl::destroy();
      if (!a6)
        goto LABEL_58;
      goto LABEL_39;
    }
    *(_DWORD *)v21 -= 2;
  }
LABEL_38:
  if (!a6)
    goto LABEL_58;
LABEL_39:
  v22 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::StringImpl *)v46[0];
  if (*a6)
  {
    objc_msgSend(*a6, "toJSONObject");
    v23 = v41;
  }
  else
  {
    v23 = 0;
  }
  v42 = (_DWORD *)v23;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v22 + 2, &v43, (uint64_t *)&v42, (uint64_t)v46);
  if (v47)
  {
    v24 = (uint64_t *)((char *)v22 + 24);
    v25 = *((unsigned int *)v22 + 9);
    if ((_DWORD)v25 == *((_DWORD *)v22 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v24, (unint64_t)&v43);
    }
    else
    {
      v26 = *v24;
      v27 = v43;
      if (v43)
        *(_DWORD *)v43 += 2;
      *(_QWORD *)(v26 + 8 * v25) = v27;
      *((_DWORD *)v22 + 9) = v25 + 1;
    }
  }
  v28 = v42;
  v42 = 0;
  if (v28)
  {
    if (*v28 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v28;
  }
  v29 = v43;
  v43 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v29 -= 2;
  }
LABEL_58:
  v30 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v31 = (uint64_t)v44;
  v43 = (WTF::StringImpl *)v46[0];
  v44 = 0;
  v42 = (_DWORD *)v31;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v30 + 2, &v43, (uint64_t *)&v42, (uint64_t)v46);
  if (v47)
  {
    v32 = (uint64_t *)((char *)v30 + 24);
    v33 = *((unsigned int *)v30 + 9);
    if ((_DWORD)v33 == *((_DWORD *)v30 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v32, (unint64_t)&v43);
    }
    else
    {
      v34 = *v32;
      v35 = v43;
      if (v43)
        *(_DWORD *)v43 += 2;
      *(_QWORD *)(v34 + 8 * v33) = v35;
      *((_DWORD *)v30 + 9) = v33 + 1;
    }
  }
  v36 = v42;
  v42 = 0;
  if (v36)
  {
    if (*v36 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v36;
  }
  v37 = v43;
  v43 = 0;
  if (v37)
  {
    if (*(_DWORD *)v37 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v37 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v45);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v46);
  v38 = (_DWORD *)v46[0];
  v46[0] = 0;
  if (v38)
  {
    if (*v38 == 2)
      WTF::StringImpl::destroy();
    else
      *v38 -= 2;
  }
  v39 = v44;
  v44 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v39;
  }
  v40 = v45;
  v45 = 0;
  if (v40)
  {
    if (*(_DWORD *)v40 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v40;
  }
}

- (void)loadingFailedWithRequestId:(id)a3 timestamp:(double)a4 errorText:(id)a5 canceled:(BOOL *)a6
{
  WTF::JSONImpl::Object *v10;
  Inspector::FrontendRouter *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  WTF::JSONImpl::ObjectBase *v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::ObjectBase *v17;
  WTF::StringImpl *v18;
  WTF::JSONImpl::ObjectBase *v19;
  _DWORD *v20;
  WTF::StringImpl *v21;
  WTF::JSONImpl::ObjectBase *v22;
  WTF::StringImpl *v23;
  WTF::JSONImpl::Value *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  WTF::StringImpl *v29;
  _DWORD *v30;
  WTF::StringImpl *v31;
  _DWORD *v32;
  WTF::JSONImpl::Object *v33;
  WTF::JSONImpl::Value *v34;
  _DWORD *v35;
  WTF::StringImpl *v36;
  WTF::JSONImpl::Object *v37;
  WTF::JSONImpl::Value *v38;
  _QWORD v39[2];
  char v40;

  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a5)
      goto LABEL_3;
  }
  v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("errorText"));
LABEL_3:
  WTF::JSONImpl::Object::create(v10);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::JSONImpl::Object *)v39[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v36 = (WTF::StringImpl *)v39[0];
  WTF::JSONImpl::ObjectBase::setString(v38, (const WTF::String *)&v37, (const WTF::String *)&v36);
  v12 = v36;
  v36 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v37;
  v37 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  WTF::JSONImpl::Object::create(v13);
  v14 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v36 = (WTF::StringImpl *)v39[0];
  MEMORY[0x2207574E0](v39, a3);
  WTF::JSONImpl::ObjectBase::setString(v14, (const WTF::String *)&v36, (const WTF::String *)v39);
  v15 = (_DWORD *)v39[0];
  v39[0] = 0;
  if (v15)
  {
    if (*v15 == 2)
      WTF::StringImpl::destroy();
    else
      *v15 -= 2;
  }
  v16 = v36;
  v36 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v36 = (WTF::StringImpl *)v39[0];
  WTF::JSONImpl::ObjectBase::setDouble(v17, &v36, a4);
  v18 = v36;
  v36 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v36 = (WTF::StringImpl *)v39[0];
  MEMORY[0x2207574E0](v39, a5);
  WTF::JSONImpl::ObjectBase::setString(v19, (const WTF::String *)&v36, (const WTF::String *)v39);
  v20 = (_DWORD *)v39[0];
  v39[0] = 0;
  if (v20)
  {
    if (*v20 == 2)
      WTF::StringImpl::destroy();
    else
      *v20 -= 2;
  }
  v21 = v36;
  v36 = 0;
  if (!v21)
  {
LABEL_32:
    if (!a6)
      goto LABEL_39;
    goto LABEL_35;
  }
  if (*(_DWORD *)v21 != 2)
  {
    *(_DWORD *)v21 -= 2;
    goto LABEL_32;
  }
  WTF::StringImpl::destroy();
  if (!a6)
    goto LABEL_39;
LABEL_35:
  v22 = v37;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v36 = (WTF::StringImpl *)v39[0];
  WTF::JSONImpl::ObjectBase::setBoolean(v22, &v36, (WTF::JSONImpl::Value *)*a6);
  v23 = v36;
  v36 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v23 -= 2;
  }
LABEL_39:
  v24 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (uint64_t)v37;
  v36 = (WTF::StringImpl *)v39[0];
  v37 = 0;
  v35 = (_DWORD *)v25;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v24 + 2, &v36, (uint64_t *)&v35, (uint64_t)v39);
  if (v40)
  {
    v26 = (uint64_t *)((char *)v24 + 24);
    v27 = *((unsigned int *)v24 + 9);
    if ((_DWORD)v27 == *((_DWORD *)v24 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v26, (unint64_t)&v36);
    }
    else
    {
      v28 = *v26;
      v29 = v36;
      if (v36)
        *(_DWORD *)v36 += 2;
      *(_QWORD *)(v28 + 8 * v27) = v29;
      *((_DWORD *)v24 + 9) = v27 + 1;
    }
  }
  v30 = v35;
  v35 = 0;
  if (v30)
  {
    if (*v30 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v30;
  }
  v31 = v36;
  v36 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v31 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v38);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v39);
  v32 = (_DWORD *)v39[0];
  v39[0] = 0;
  if (v32)
  {
    if (*v32 == 2)
      WTF::StringImpl::destroy();
    else
      *v32 -= 2;
  }
  v33 = v37;
  v37 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v33;
  }
  v34 = v38;
  v38 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v34;
  }
}

- (void)requestServedFromMemoryCacheWithRequestId:(id)a3 frameId:(id)a4 loaderId:(id)a5 documentURL:(id)a6 timestamp:(double)a7 initiator:(id)a8 resource:(id)a9
{
  WTF::JSONImpl::Object *v16;
  Inspector::FrontendRouter *v17;
  WTF::StringImpl *v18;
  WTF::JSONImpl::Object *v19;
  WTF::JSONImpl::ObjectBase *v20;
  _DWORD *v21;
  WTF::StringImpl *v22;
  WTF::JSONImpl::ObjectBase *v23;
  _DWORD *v24;
  WTF::StringImpl *v25;
  WTF::JSONImpl::ObjectBase *v26;
  _DWORD *v27;
  WTF::StringImpl *v28;
  WTF::JSONImpl::ObjectBase *v29;
  _DWORD *v30;
  WTF::StringImpl *v31;
  WTF::JSONImpl::ObjectBase *v32;
  WTF::StringImpl *v33;
  WTF::JSONImpl::Object *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  WTF::StringImpl *v39;
  _DWORD *v40;
  WTF::StringImpl *v41;
  WTF::JSONImpl::Object *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  WTF::StringImpl *v46;
  _DWORD *v47;
  WTF::StringImpl *v48;
  WTF::JSONImpl::Value *v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t v53;
  WTF::StringImpl *v54;
  _DWORD *v55;
  WTF::StringImpl *v56;
  _DWORD *v57;
  WTF::JSONImpl::Object *v58;
  WTF::JSONImpl::Value *v59;
  uint64_t v60;
  _DWORD *v61;
  WTF::StringImpl *v62;
  WTF::JSONImpl::Object *v63;
  WTF::JSONImpl::Value *v64;
  _QWORD v65[2];
  char v66;

  v16 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v17 = v16;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v16 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  v16 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
  if (a5)
  {
LABEL_4:
    if (a6)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  v16 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("loaderId"));
  if (a6)
  {
LABEL_5:
    if (a8)
      goto LABEL_6;
LABEL_14:
    v16 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("initiator"));
    if (a9)
      goto LABEL_7;
    goto LABEL_15;
  }
LABEL_13:
  v16 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("documentURL"));
  if (!a8)
    goto LABEL_14;
LABEL_6:
  if (a9)
    goto LABEL_7;
LABEL_15:
  v16 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("resource"));
LABEL_7:
  WTF::JSONImpl::Object::create(v16);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v63 = (WTF::JSONImpl::Object *)v65[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  WTF::JSONImpl::ObjectBase::setString(v64, (const WTF::String *)&v63, (const WTF::String *)&v62);
  v18 = v62;
  v62 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = v63;
  v63 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      v19 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v19 -= 2;
  }
  WTF::JSONImpl::Object::create(v19);
  v20 = v63;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  MEMORY[0x2207574E0](v65, a3);
  WTF::JSONImpl::ObjectBase::setString(v20, (const WTF::String *)&v62, (const WTF::String *)v65);
  v21 = (_DWORD *)v65[0];
  v65[0] = 0;
  if (v21)
  {
    if (*v21 == 2)
      WTF::StringImpl::destroy();
    else
      *v21 -= 2;
  }
  v22 = v62;
  v62 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v22 -= 2;
  }
  v23 = v63;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  MEMORY[0x2207574E0](v65, a4);
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v62, (const WTF::String *)v65);
  v24 = (_DWORD *)v65[0];
  v65[0] = 0;
  if (v24)
  {
    if (*v24 == 2)
      WTF::StringImpl::destroy();
    else
      *v24 -= 2;
  }
  v25 = v62;
  v62 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v25 -= 2;
  }
  v26 = v63;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  MEMORY[0x2207574E0](v65, a5);
  WTF::JSONImpl::ObjectBase::setString(v26, (const WTF::String *)&v62, (const WTF::String *)v65);
  v27 = (_DWORD *)v65[0];
  v65[0] = 0;
  if (v27)
  {
    if (*v27 == 2)
      WTF::StringImpl::destroy();
    else
      *v27 -= 2;
  }
  v28 = v62;
  v62 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v28 -= 2;
  }
  v29 = v63;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  MEMORY[0x2207574E0](v65, a6);
  WTF::JSONImpl::ObjectBase::setString(v29, (const WTF::String *)&v62, (const WTF::String *)v65);
  v30 = (_DWORD *)v65[0];
  v65[0] = 0;
  if (v30)
  {
    if (*v30 == 2)
      WTF::StringImpl::destroy();
    else
      *v30 -= 2;
  }
  v31 = v62;
  v62 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v31 -= 2;
  }
  v32 = v63;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  WTF::JSONImpl::ObjectBase::setDouble(v32, &v62, a7);
  v33 = v62;
  v62 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v33 -= 2;
  }
  v34 = v63;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  if (a8)
  {
    objc_msgSend(a8, "toJSONObject");
    v35 = v60;
  }
  else
  {
    v35 = 0;
  }
  v61 = (_DWORD *)v35;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v34 + 2, &v62, (uint64_t *)&v61, (uint64_t)v65);
  if (v66)
  {
    v36 = (uint64_t *)((char *)v34 + 24);
    v37 = *((unsigned int *)v34 + 9);
    if ((_DWORD)v37 == *((_DWORD *)v34 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v36, (unint64_t)&v62);
    }
    else
    {
      v38 = *v36;
      v39 = v62;
      if (v62)
        *(_DWORD *)v62 += 2;
      *(_QWORD *)(v38 + 8 * v37) = v39;
      *((_DWORD *)v34 + 9) = v37 + 1;
    }
  }
  v40 = v61;
  v61 = 0;
  if (v40)
  {
    if (*v40 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v40;
  }
  v41 = v62;
  v62 = 0;
  if (v41)
  {
    if (*(_DWORD *)v41 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v41 -= 2;
  }
  v42 = v63;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v62 = (WTF::StringImpl *)v65[0];
  if (a9)
    objc_msgSend(a9, "toJSONObject");
  v61 = 0;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v42 + 2, &v62, (uint64_t *)&v61, (uint64_t)v65);
  if (v66)
  {
    v43 = (uint64_t *)((char *)v42 + 24);
    v44 = *((unsigned int *)v42 + 9);
    if ((_DWORD)v44 == *((_DWORD *)v42 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v43, (unint64_t)&v62);
    }
    else
    {
      v45 = *v43;
      v46 = v62;
      if (v62)
        *(_DWORD *)v62 += 2;
      *(_QWORD *)(v45 + 8 * v44) = v46;
      *((_DWORD *)v42 + 9) = v44 + 1;
    }
  }
  v47 = v61;
  v61 = 0;
  if (v47)
  {
    if (*v47 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v47;
  }
  v48 = v62;
  v62 = 0;
  if (v48)
  {
    if (*(_DWORD *)v48 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v48 -= 2;
  }
  v49 = v64;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v50 = (uint64_t)v63;
  v62 = (WTF::StringImpl *)v65[0];
  v63 = 0;
  v61 = (_DWORD *)v50;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v49 + 2, &v62, (uint64_t *)&v61, (uint64_t)v65);
  if (v66)
  {
    v51 = (uint64_t *)((char *)v49 + 24);
    v52 = *((unsigned int *)v49 + 9);
    if ((_DWORD)v52 == *((_DWORD *)v49 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v51, (unint64_t)&v62);
    }
    else
    {
      v53 = *v51;
      v54 = v62;
      if (v62)
        *(_DWORD *)v62 += 2;
      *(_QWORD *)(v53 + 8 * v52) = v54;
      *((_DWORD *)v49 + 9) = v52 + 1;
    }
  }
  v55 = v61;
  v61 = 0;
  if (v55)
  {
    if (*v55 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v55;
  }
  v56 = v62;
  v62 = 0;
  if (v56)
  {
    if (*(_DWORD *)v56 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v56 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v64);
  Inspector::FrontendRouter::sendEvent(v17, (const WTF::String *)v65);
  v57 = (_DWORD *)v65[0];
  v65[0] = 0;
  if (v57)
  {
    if (*v57 == 2)
      WTF::StringImpl::destroy();
    else
      *v57 -= 2;
  }
  v58 = v63;
  v63 = 0;
  if (v58)
  {
    if (*(_DWORD *)v58 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v58;
  }
  v59 = v64;
  v64 = 0;
  if (v59)
  {
    if (*(_DWORD *)v59 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v59;
  }
}

- (void)requestInterceptedWithRequestId:(id)a3 request:(id)a4
{
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::ObjectBase *v10;
  _DWORD *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::StringImpl *v20;
  WTF::JSONImpl::Value *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  WTF::StringImpl *v26;
  _DWORD *v27;
  WTF::StringImpl *v28;
  _DWORD *v29;
  WTF::JSONImpl::Object *v30;
  WTF::JSONImpl::Value *v31;
  uint64_t v32;
  _DWORD *v33;
  WTF::StringImpl *v34;
  WTF::JSONImpl::Object *v35;
  WTF::JSONImpl::Value *v36;
  _QWORD v37[2];
  char v38;

  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a4)
      goto LABEL_3;
  }
  v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("request"));
LABEL_3:
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::JSONImpl::Object *)v37[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  WTF::JSONImpl::ObjectBase::setString(v36, (const WTF::String *)&v35, (const WTF::String *)&v34);
  v8 = v34;
  v34 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v35;
  v35 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      v9 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v9 -= 2;
  }
  WTF::JSONImpl::Object::create(v9);
  v10 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  MEMORY[0x2207574E0](v37, a3);
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v34, (const WTF::String *)v37);
  v11 = (_DWORD *)v37[0];
  v37[0] = 0;
  if (v11)
  {
    if (*v11 == 2)
      WTF::StringImpl::destroy();
    else
      *v11 -= 2;
  }
  v12 = v34;
  v34 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  if (a4)
  {
    objc_msgSend(a4, "toJSONObject");
    v14 = v32;
  }
  else
  {
    v14 = 0;
  }
  v33 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v13 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v15 = (uint64_t *)((char *)v13 + 24);
    v16 = *((unsigned int *)v13 + 9);
    if ((_DWORD)v16 == *((_DWORD *)v13 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v34);
    }
    else
    {
      v17 = *v15;
      v18 = v34;
      if (v34)
        *(_DWORD *)v34 += 2;
      *(_QWORD *)(v17 + 8 * v16) = v18;
      *((_DWORD *)v13 + 9) = v16 + 1;
    }
  }
  v19 = v33;
  v33 = 0;
  if (v19)
  {
    if (*v19 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v19;
  }
  v20 = v34;
  v34 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v20 -= 2;
  }
  v21 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (uint64_t)v35;
  v34 = (WTF::StringImpl *)v37[0];
  v35 = 0;
  v33 = (_DWORD *)v22;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v21 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v23 = (uint64_t *)((char *)v21 + 24);
    v24 = *((unsigned int *)v21 + 9);
    if ((_DWORD)v24 == *((_DWORD *)v21 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v23, (unint64_t)&v34);
    }
    else
    {
      v25 = *v23;
      v26 = v34;
      if (v34)
        *(_DWORD *)v34 += 2;
      *(_QWORD *)(v25 + 8 * v24) = v26;
      *((_DWORD *)v21 + 9) = v24 + 1;
    }
  }
  v27 = v33;
  v33 = 0;
  if (v27)
  {
    if (*v27 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v27;
  }
  v28 = v34;
  v34 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v28 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v36);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v37);
  v29 = (_DWORD *)v37[0];
  v37[0] = 0;
  if (v29)
  {
    if (*v29 == 2)
      WTF::StringImpl::destroy();
    else
      *v29 -= 2;
  }
  v30 = v35;
  v35 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v30;
  }
  v31 = v36;
  v36 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v31;
  }
}

- (void)responseInterceptedWithRequestId:(id)a3 response:(id)a4
{
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::ObjectBase *v10;
  _DWORD *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::StringImpl *v20;
  WTF::JSONImpl::Value *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  WTF::StringImpl *v26;
  _DWORD *v27;
  WTF::StringImpl *v28;
  _DWORD *v29;
  WTF::JSONImpl::Object *v30;
  WTF::JSONImpl::Value *v31;
  uint64_t v32;
  _DWORD *v33;
  WTF::StringImpl *v34;
  WTF::JSONImpl::Object *v35;
  WTF::JSONImpl::Value *v36;
  _QWORD v37[2];
  char v38;

  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a4)
      goto LABEL_3;
  }
  v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("response"));
LABEL_3:
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v35 = (WTF::JSONImpl::Object *)v37[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  WTF::JSONImpl::ObjectBase::setString(v36, (const WTF::String *)&v35, (const WTF::String *)&v34);
  v8 = v34;
  v34 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v35;
  v35 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      v9 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v9 -= 2;
  }
  WTF::JSONImpl::Object::create(v9);
  v10 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  MEMORY[0x2207574E0](v37, a3);
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v34, (const WTF::String *)v37);
  v11 = (_DWORD *)v37[0];
  v37[0] = 0;
  if (v11)
  {
    if (*v11 == 2)
      WTF::StringImpl::destroy();
    else
      *v11 -= 2;
  }
  v12 = v34;
  v34 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  if (a4)
  {
    objc_msgSend(a4, "toJSONObject");
    v14 = v32;
  }
  else
  {
    v14 = 0;
  }
  v33 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v13 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v15 = (uint64_t *)((char *)v13 + 24);
    v16 = *((unsigned int *)v13 + 9);
    if ((_DWORD)v16 == *((_DWORD *)v13 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v34);
    }
    else
    {
      v17 = *v15;
      v18 = v34;
      if (v34)
        *(_DWORD *)v34 += 2;
      *(_QWORD *)(v17 + 8 * v16) = v18;
      *((_DWORD *)v13 + 9) = v16 + 1;
    }
  }
  v19 = v33;
  v33 = 0;
  if (v19)
  {
    if (*v19 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v19;
  }
  v20 = v34;
  v34 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v20 -= 2;
  }
  v21 = v36;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (uint64_t)v35;
  v34 = (WTF::StringImpl *)v37[0];
  v35 = 0;
  v33 = (_DWORD *)v22;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v21 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v23 = (uint64_t *)((char *)v21 + 24);
    v24 = *((unsigned int *)v21 + 9);
    if ((_DWORD)v24 == *((_DWORD *)v21 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v23, (unint64_t)&v34);
    }
    else
    {
      v25 = *v23;
      v26 = v34;
      if (v34)
        *(_DWORD *)v34 += 2;
      *(_QWORD *)(v25 + 8 * v24) = v26;
      *((_DWORD *)v21 + 9) = v24 + 1;
    }
  }
  v27 = v33;
  v33 = 0;
  if (v27)
  {
    if (*v27 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v27;
  }
  v28 = v34;
  v34 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v28 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v36);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v37);
  v29 = (_DWORD *)v37[0];
  v37[0] = 0;
  if (v29)
  {
    if (*v29 == 2)
      WTF::StringImpl::destroy();
    else
      *v29 -= 2;
  }
  v30 = v35;
  v35 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v30;
  }
  v31 = v36;
  v36 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v31;
  }
}

- (void)webSocketWillSendHandshakeRequestWithRequestId:(id)a3 timestamp:(double)a4 walltime:(double)a5 request:(id)a6
{
  WTF::JSONImpl::Object *v10;
  Inspector::FrontendRouter *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  WTF::JSONImpl::ObjectBase *v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::ObjectBase *v17;
  WTF::StringImpl *v18;
  WTF::JSONImpl::ObjectBase *v19;
  WTF::StringImpl *v20;
  WTF::JSONImpl::Object *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  WTF::StringImpl *v26;
  _DWORD *v27;
  WTF::StringImpl *v28;
  WTF::JSONImpl::Value *v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  WTF::StringImpl *v34;
  _DWORD *v35;
  WTF::StringImpl *v36;
  _DWORD *v37;
  WTF::JSONImpl::Object *v38;
  WTF::JSONImpl::Value *v39;
  uint64_t v40;
  _DWORD *v41;
  WTF::StringImpl *v42;
  WTF::JSONImpl::Object *v43;
  WTF::JSONImpl::Value *v44;
  _QWORD v45[2];
  char v46;

  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (a3)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a6)
      goto LABEL_3;
  }
  v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("request"));
LABEL_3:
  WTF::JSONImpl::Object::create(v10);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v43 = (WTF::JSONImpl::Object *)v45[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::StringImpl *)v45[0];
  WTF::JSONImpl::ObjectBase::setString(v44, (const WTF::String *)&v43, (const WTF::String *)&v42);
  v12 = v42;
  v42 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v43;
  v43 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  WTF::JSONImpl::Object::create(v13);
  v14 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::StringImpl *)v45[0];
  MEMORY[0x2207574E0](v45, a3);
  WTF::JSONImpl::ObjectBase::setString(v14, (const WTF::String *)&v42, (const WTF::String *)v45);
  v15 = (_DWORD *)v45[0];
  v45[0] = 0;
  if (v15)
  {
    if (*v15 == 2)
      WTF::StringImpl::destroy();
    else
      *v15 -= 2;
  }
  v16 = v42;
  v42 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::StringImpl *)v45[0];
  WTF::JSONImpl::ObjectBase::setDouble(v17, &v42, a4);
  v18 = v42;
  v42 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  v19 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::StringImpl *)v45[0];
  WTF::JSONImpl::ObjectBase::setDouble(v19, &v42, a5);
  v20 = v42;
  v42 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v20 -= 2;
  }
  v21 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::StringImpl *)v45[0];
  if (a6)
  {
    objc_msgSend(a6, "toJSONObject");
    v22 = v40;
  }
  else
  {
    v22 = 0;
  }
  v41 = (_DWORD *)v22;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v21 + 2, &v42, (uint64_t *)&v41, (uint64_t)v45);
  if (v46)
  {
    v23 = (uint64_t *)((char *)v21 + 24);
    v24 = *((unsigned int *)v21 + 9);
    if ((_DWORD)v24 == *((_DWORD *)v21 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v23, (unint64_t)&v42);
    }
    else
    {
      v25 = *v23;
      v26 = v42;
      if (v42)
        *(_DWORD *)v42 += 2;
      *(_QWORD *)(v25 + 8 * v24) = v26;
      *((_DWORD *)v21 + 9) = v24 + 1;
    }
  }
  v27 = v41;
  v41 = 0;
  if (v27)
  {
    if (*v27 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v27;
  }
  v28 = v42;
  v42 = 0;
  if (v28)
  {
    if (*(_DWORD *)v28 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v28 -= 2;
  }
  v29 = v44;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = (uint64_t)v43;
  v42 = (WTF::StringImpl *)v45[0];
  v43 = 0;
  v41 = (_DWORD *)v30;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v29 + 2, &v42, (uint64_t *)&v41, (uint64_t)v45);
  if (v46)
  {
    v31 = (uint64_t *)((char *)v29 + 24);
    v32 = *((unsigned int *)v29 + 9);
    if ((_DWORD)v32 == *((_DWORD *)v29 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v31, (unint64_t)&v42);
    }
    else
    {
      v33 = *v31;
      v34 = v42;
      if (v42)
        *(_DWORD *)v42 += 2;
      *(_QWORD *)(v33 + 8 * v32) = v34;
      *((_DWORD *)v29 + 9) = v32 + 1;
    }
  }
  v35 = v41;
  v41 = 0;
  if (v35)
  {
    if (*v35 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v35;
  }
  v36 = v42;
  v42 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v36 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v44);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v45);
  v37 = (_DWORD *)v45[0];
  v45[0] = 0;
  if (v37)
  {
    if (*v37 == 2)
      WTF::StringImpl::destroy();
    else
      *v37 -= 2;
  }
  v38 = v43;
  v43 = 0;
  if (v38)
  {
    if (*(_DWORD *)v38 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v38;
  }
  v39 = v44;
  v44 = 0;
  if (v39)
  {
    if (*(_DWORD *)v39 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v39;
  }
}

- (void)webSocketHandshakeResponseReceivedWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5
{
  WTF::JSONImpl::Object *v8;
  Inspector::FrontendRouter *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Object *v11;
  WTF::JSONImpl::ObjectBase *v12;
  _DWORD *v13;
  WTF::StringImpl *v14;
  WTF::JSONImpl::ObjectBase *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::Object *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  _DWORD *v23;
  WTF::StringImpl *v24;
  WTF::JSONImpl::Value *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  _DWORD *v31;
  WTF::StringImpl *v32;
  _DWORD *v33;
  WTF::JSONImpl::Object *v34;
  WTF::JSONImpl::Value *v35;
  uint64_t v36;
  _DWORD *v37;
  WTF::StringImpl *v38;
  WTF::JSONImpl::Object *v39;
  WTF::JSONImpl::Value *v40;
  _QWORD v41[2];
  char v42;

  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a5)
      goto LABEL_3;
  }
  v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("response"));
LABEL_3:
  WTF::JSONImpl::Object::create(v8);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::JSONImpl::Object *)v41[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setString(v40, (const WTF::String *)&v39, (const WTF::String *)&v38);
  v10 = v38;
  v38 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v39;
  v39 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      v11 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  WTF::JSONImpl::Object::create(v11);
  v12 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  MEMORY[0x2207574E0](v41, a3);
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v38, (const WTF::String *)v41);
  v13 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v13)
  {
    if (*v13 == 2)
      WTF::StringImpl::destroy();
    else
      *v13 -= 2;
  }
  v14 = v38;
  v38 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setDouble(v15, &v38, a4);
  v16 = v38;
  v38 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  if (a5)
  {
    objc_msgSend(a5, "toJSONObject");
    v18 = v36;
  }
  else
  {
    v18 = 0;
  }
  v37 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v19 = (uint64_t *)((char *)v17 + 24);
    v20 = *((unsigned int *)v17 + 9);
    if ((_DWORD)v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v38);
    }
    else
    {
      v21 = *v19;
      v22 = v38;
      if (v38)
        *(_DWORD *)v38 += 2;
      *(_QWORD *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  v23 = v37;
  v37 = 0;
  if (v23)
  {
    if (*v23 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v23;
  }
  v24 = v38;
  v38 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v24 -= 2;
  }
  v25 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = (uint64_t)v39;
  v38 = (WTF::StringImpl *)v41[0];
  v39 = 0;
  v37 = (_DWORD *)v26;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v25 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v27 = (uint64_t *)((char *)v25 + 24);
    v28 = *((unsigned int *)v25 + 9);
    if ((_DWORD)v28 == *((_DWORD *)v25 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v27, (unint64_t)&v38);
    }
    else
    {
      v29 = *v27;
      v30 = v38;
      if (v38)
        *(_DWORD *)v38 += 2;
      *(_QWORD *)(v29 + 8 * v28) = v30;
      *((_DWORD *)v25 + 9) = v28 + 1;
    }
  }
  v31 = v37;
  v37 = 0;
  if (v31)
  {
    if (*v31 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v31;
  }
  v32 = v38;
  v38 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v32 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v40);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v41);
  v33 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v33)
  {
    if (*v33 == 2)
      WTF::StringImpl::destroy();
    else
      *v33 -= 2;
  }
  v34 = v39;
  v39 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v34;
  }
  v35 = v40;
  v40 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v35;
  }
}

- (void)webSocketCreatedWithRequestId:(id)a3 url:(id)a4
{
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::ObjectBase *v10;
  _DWORD *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::ObjectBase *v13;
  _DWORD *v14;
  WTF::StringImpl *v15;
  WTF::JSONImpl::Value *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  _DWORD *v22;
  WTF::StringImpl *v23;
  _DWORD *v24;
  WTF::JSONImpl::Object *v25;
  WTF::JSONImpl::Value *v26;
  _DWORD *v27;
  WTF::StringImpl *v28;
  WTF::JSONImpl::Object *v29;
  WTF::JSONImpl::Value *v30;
  _QWORD v31[2];
  char v32;

  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a4)
      goto LABEL_3;
  }
  v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("url"));
LABEL_3:
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::JSONImpl::Object *)v31[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v28 = (WTF::StringImpl *)v31[0];
  WTF::JSONImpl::ObjectBase::setString(v30, (const WTF::String *)&v29, (const WTF::String *)&v28);
  v8 = v28;
  v28 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v29;
  v29 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      v9 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v9 -= 2;
  }
  WTF::JSONImpl::Object::create(v9);
  v10 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v28 = (WTF::StringImpl *)v31[0];
  MEMORY[0x2207574E0](v31, a3);
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v28, (const WTF::String *)v31);
  v11 = (_DWORD *)v31[0];
  v31[0] = 0;
  if (v11)
  {
    if (*v11 == 2)
      WTF::StringImpl::destroy();
    else
      *v11 -= 2;
  }
  v12 = v28;
  v28 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v28 = (WTF::StringImpl *)v31[0];
  MEMORY[0x2207574E0](v31, a4);
  WTF::JSONImpl::ObjectBase::setString(v13, (const WTF::String *)&v28, (const WTF::String *)v31);
  v14 = (_DWORD *)v31[0];
  v31[0] = 0;
  if (v14)
  {
    if (*v14 == 2)
      WTF::StringImpl::destroy();
    else
      *v14 -= 2;
  }
  v15 = v28;
  v28 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v17 = (uint64_t)v29;
  v28 = (WTF::StringImpl *)v31[0];
  v29 = 0;
  v27 = (_DWORD *)v17;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v16 + 2, &v28, (uint64_t *)&v27, (uint64_t)v31);
  if (v32)
  {
    v18 = (uint64_t *)((char *)v16 + 24);
    v19 = *((unsigned int *)v16 + 9);
    if ((_DWORD)v19 == *((_DWORD *)v16 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v18, (unint64_t)&v28);
    }
    else
    {
      v20 = *v18;
      v21 = v28;
      if (v28)
        *(_DWORD *)v28 += 2;
      *(_QWORD *)(v20 + 8 * v19) = v21;
      *((_DWORD *)v16 + 9) = v19 + 1;
    }
  }
  v22 = v27;
  v27 = 0;
  if (v22)
  {
    if (*v22 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v22;
  }
  v23 = v28;
  v28 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v23 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v30);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v31);
  v24 = (_DWORD *)v31[0];
  v31[0] = 0;
  if (v24)
  {
    if (*v24 == 2)
      WTF::StringImpl::destroy();
    else
      *v24 -= 2;
  }
  v25 = v29;
  v29 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v25;
  }
  v26 = v30;
  v30 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v26;
  }
}

- (void)webSocketClosedWithRequestId:(id)a3 timestamp:(double)a4
{
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::ObjectBase *v10;
  _DWORD *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::ObjectBase *v13;
  WTF::StringImpl *v14;
  WTF::JSONImpl::Value *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  WTF::StringImpl *v20;
  _DWORD *v21;
  WTF::StringImpl *v22;
  _DWORD *v23;
  WTF::JSONImpl::Object *v24;
  WTF::JSONImpl::Value *v25;
  _DWORD *v26;
  WTF::StringImpl *v27;
  WTF::JSONImpl::Object *v28;
  WTF::JSONImpl::Value *v29;
  _QWORD v30[2];
  char v31;

  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (!a3)
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v28 = (WTF::JSONImpl::Object *)v30[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::StringImpl *)v30[0];
  WTF::JSONImpl::ObjectBase::setString(v29, (const WTF::String *)&v28, (const WTF::String *)&v27);
  v8 = v27;
  v27 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v28;
  v28 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      v9 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v9 -= 2;
  }
  WTF::JSONImpl::Object::create(v9);
  v10 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::StringImpl *)v30[0];
  MEMORY[0x2207574E0](v30, a3);
  WTF::JSONImpl::ObjectBase::setString(v10, (const WTF::String *)&v27, (const WTF::String *)v30);
  v11 = (_DWORD *)v30[0];
  v30[0] = 0;
  if (v11)
  {
    if (*v11 == 2)
      WTF::StringImpl::destroy();
    else
      *v11 -= 2;
  }
  v12 = v27;
  v27 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::StringImpl *)v30[0];
  WTF::JSONImpl::ObjectBase::setDouble(v13, &v27, a4);
  v14 = v27;
  v27 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v29;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v16 = (uint64_t)v28;
  v27 = (WTF::StringImpl *)v30[0];
  v28 = 0;
  v26 = (_DWORD *)v16;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v15 + 2, &v27, (uint64_t *)&v26, (uint64_t)v30);
  if (v31)
  {
    v17 = (uint64_t *)((char *)v15 + 24);
    v18 = *((unsigned int *)v15 + 9);
    if ((_DWORD)v18 == *((_DWORD *)v15 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v17, (unint64_t)&v27);
    }
    else
    {
      v19 = *v17;
      v20 = v27;
      if (v27)
        *(_DWORD *)v27 += 2;
      *(_QWORD *)(v19 + 8 * v18) = v20;
      *((_DWORD *)v15 + 9) = v18 + 1;
    }
  }
  v21 = v26;
  v26 = 0;
  if (v21)
  {
    if (*v21 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v21;
  }
  v22 = v27;
  v27 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v22 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v29);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v30);
  v23 = (_DWORD *)v30[0];
  v30[0] = 0;
  if (v23)
  {
    if (*v23 == 2)
      WTF::StringImpl::destroy();
    else
      *v23 -= 2;
  }
  v24 = v28;
  v28 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v24;
  }
  v25 = v29;
  v29 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v25;
  }
}

- (void)webSocketFrameReceivedWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5
{
  WTF::JSONImpl::Object *v8;
  Inspector::FrontendRouter *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Object *v11;
  WTF::JSONImpl::ObjectBase *v12;
  _DWORD *v13;
  WTF::StringImpl *v14;
  WTF::JSONImpl::ObjectBase *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::Object *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  _DWORD *v23;
  WTF::StringImpl *v24;
  WTF::JSONImpl::Value *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  _DWORD *v31;
  WTF::StringImpl *v32;
  _DWORD *v33;
  WTF::JSONImpl::Object *v34;
  WTF::JSONImpl::Value *v35;
  uint64_t v36;
  _DWORD *v37;
  WTF::StringImpl *v38;
  WTF::JSONImpl::Object *v39;
  WTF::JSONImpl::Value *v40;
  _QWORD v41[2];
  char v42;

  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a5)
      goto LABEL_3;
  }
  v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("response"));
LABEL_3:
  WTF::JSONImpl::Object::create(v8);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::JSONImpl::Object *)v41[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setString(v40, (const WTF::String *)&v39, (const WTF::String *)&v38);
  v10 = v38;
  v38 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v39;
  v39 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      v11 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  WTF::JSONImpl::Object::create(v11);
  v12 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  MEMORY[0x2207574E0](v41, a3);
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v38, (const WTF::String *)v41);
  v13 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v13)
  {
    if (*v13 == 2)
      WTF::StringImpl::destroy();
    else
      *v13 -= 2;
  }
  v14 = v38;
  v38 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setDouble(v15, &v38, a4);
  v16 = v38;
  v38 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  if (a5)
  {
    objc_msgSend(a5, "toJSONObject");
    v18 = v36;
  }
  else
  {
    v18 = 0;
  }
  v37 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v19 = (uint64_t *)((char *)v17 + 24);
    v20 = *((unsigned int *)v17 + 9);
    if ((_DWORD)v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v38);
    }
    else
    {
      v21 = *v19;
      v22 = v38;
      if (v38)
        *(_DWORD *)v38 += 2;
      *(_QWORD *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  v23 = v37;
  v37 = 0;
  if (v23)
  {
    if (*v23 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v23;
  }
  v24 = v38;
  v38 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v24 -= 2;
  }
  v25 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = (uint64_t)v39;
  v38 = (WTF::StringImpl *)v41[0];
  v39 = 0;
  v37 = (_DWORD *)v26;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v25 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v27 = (uint64_t *)((char *)v25 + 24);
    v28 = *((unsigned int *)v25 + 9);
    if ((_DWORD)v28 == *((_DWORD *)v25 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v27, (unint64_t)&v38);
    }
    else
    {
      v29 = *v27;
      v30 = v38;
      if (v38)
        *(_DWORD *)v38 += 2;
      *(_QWORD *)(v29 + 8 * v28) = v30;
      *((_DWORD *)v25 + 9) = v28 + 1;
    }
  }
  v31 = v37;
  v37 = 0;
  if (v31)
  {
    if (*v31 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v31;
  }
  v32 = v38;
  v38 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v32 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v40);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v41);
  v33 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v33)
  {
    if (*v33 == 2)
      WTF::StringImpl::destroy();
    else
      *v33 -= 2;
  }
  v34 = v39;
  v39 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v34;
  }
  v35 = v40;
  v40 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v35;
  }
}

- (void)webSocketFrameErrorWithRequestId:(id)a3 timestamp:(double)a4 errorMessage:(id)a5
{
  WTF::JSONImpl::Object *v8;
  Inspector::FrontendRouter *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Object *v11;
  WTF::JSONImpl::ObjectBase *v12;
  _DWORD *v13;
  WTF::StringImpl *v14;
  WTF::JSONImpl::ObjectBase *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::ObjectBase *v17;
  _DWORD *v18;
  WTF::StringImpl *v19;
  WTF::JSONImpl::Value *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  WTF::StringImpl *v25;
  _DWORD *v26;
  WTF::StringImpl *v27;
  _DWORD *v28;
  WTF::JSONImpl::Object *v29;
  WTF::JSONImpl::Value *v30;
  _DWORD *v31;
  WTF::StringImpl *v32;
  WTF::JSONImpl::Object *v33;
  WTF::JSONImpl::Value *v34;
  _QWORD v35[2];
  char v36;

  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a5)
      goto LABEL_3;
  }
  v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("errorMessage"));
LABEL_3:
  WTF::JSONImpl::Object::create(v8);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::JSONImpl::Object *)v35[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v32 = (WTF::StringImpl *)v35[0];
  WTF::JSONImpl::ObjectBase::setString(v34, (const WTF::String *)&v33, (const WTF::String *)&v32);
  v10 = v32;
  v32 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v33;
  v33 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      v11 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  WTF::JSONImpl::Object::create(v11);
  v12 = v33;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v32 = (WTF::StringImpl *)v35[0];
  MEMORY[0x2207574E0](v35, a3);
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v32, (const WTF::String *)v35);
  v13 = (_DWORD *)v35[0];
  v35[0] = 0;
  if (v13)
  {
    if (*v13 == 2)
      WTF::StringImpl::destroy();
    else
      *v13 -= 2;
  }
  v14 = v32;
  v32 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v33;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v32 = (WTF::StringImpl *)v35[0];
  WTF::JSONImpl::ObjectBase::setDouble(v15, &v32, a4);
  v16 = v32;
  v32 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v33;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v32 = (WTF::StringImpl *)v35[0];
  MEMORY[0x2207574E0](v35, a5);
  WTF::JSONImpl::ObjectBase::setString(v17, (const WTF::String *)&v32, (const WTF::String *)v35);
  v18 = (_DWORD *)v35[0];
  v35[0] = 0;
  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
  v19 = v32;
  v32 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (uint64_t)v33;
  v32 = (WTF::StringImpl *)v35[0];
  v33 = 0;
  v31 = (_DWORD *)v21;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v20 + 2, &v32, (uint64_t *)&v31, (uint64_t)v35);
  if (v36)
  {
    v22 = (uint64_t *)((char *)v20 + 24);
    v23 = *((unsigned int *)v20 + 9);
    if ((_DWORD)v23 == *((_DWORD *)v20 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v22, (unint64_t)&v32);
    }
    else
    {
      v24 = *v22;
      v25 = v32;
      if (v32)
        *(_DWORD *)v32 += 2;
      *(_QWORD *)(v24 + 8 * v23) = v25;
      *((_DWORD *)v20 + 9) = v23 + 1;
    }
  }
  v26 = v31;
  v31 = 0;
  if (v26)
  {
    if (*v26 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v26;
  }
  v27 = v32;
  v32 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v27 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v34);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v35);
  v28 = (_DWORD *)v35[0];
  v35[0] = 0;
  if (v28)
  {
    if (*v28 == 2)
      WTF::StringImpl::destroy();
    else
      *v28 -= 2;
  }
  v29 = v33;
  v33 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v29;
  }
  v30 = v34;
  v34 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v30;
  }
}

- (void)webSocketFrameSentWithRequestId:(id)a3 timestamp:(double)a4 response:(id)a5
{
  WTF::JSONImpl::Object *v8;
  Inspector::FrontendRouter *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Object *v11;
  WTF::JSONImpl::ObjectBase *v12;
  _DWORD *v13;
  WTF::StringImpl *v14;
  WTF::JSONImpl::ObjectBase *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::Object *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  _DWORD *v23;
  WTF::StringImpl *v24;
  WTF::JSONImpl::Value *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  WTF::StringImpl *v30;
  _DWORD *v31;
  WTF::StringImpl *v32;
  _DWORD *v33;
  WTF::JSONImpl::Object *v34;
  WTF::JSONImpl::Value *v35;
  uint64_t v36;
  _DWORD *v37;
  WTF::StringImpl *v38;
  WTF::JSONImpl::Object *v39;
  WTF::JSONImpl::Value *v40;
  _QWORD v41[2];
  char v42;

  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("requestId"));
    if (a5)
      goto LABEL_3;
  }
  v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("response"));
LABEL_3:
  WTF::JSONImpl::Object::create(v8);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::JSONImpl::Object *)v41[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setString(v40, (const WTF::String *)&v39, (const WTF::String *)&v38);
  v10 = v38;
  v38 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v39;
  v39 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      v11 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  WTF::JSONImpl::Object::create(v11);
  v12 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  MEMORY[0x2207574E0](v41, a3);
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v38, (const WTF::String *)v41);
  v13 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v13)
  {
    if (*v13 == 2)
      WTF::StringImpl::destroy();
    else
      *v13 -= 2;
  }
  v14 = v38;
  v38 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  WTF::JSONImpl::ObjectBase::setDouble(v15, &v38, a4);
  v16 = v38;
  v38 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::StringImpl *)v41[0];
  if (a5)
  {
    objc_msgSend(a5, "toJSONObject");
    v18 = v36;
  }
  else
  {
    v18 = 0;
  }
  v37 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v19 = (uint64_t *)((char *)v17 + 24);
    v20 = *((unsigned int *)v17 + 9);
    if ((_DWORD)v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v38);
    }
    else
    {
      v21 = *v19;
      v22 = v38;
      if (v38)
        *(_DWORD *)v38 += 2;
      *(_QWORD *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  v23 = v37;
  v37 = 0;
  if (v23)
  {
    if (*v23 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v23;
  }
  v24 = v38;
  v38 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v24 -= 2;
  }
  v25 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = (uint64_t)v39;
  v38 = (WTF::StringImpl *)v41[0];
  v39 = 0;
  v37 = (_DWORD *)v26;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v25 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v27 = (uint64_t *)((char *)v25 + 24);
    v28 = *((unsigned int *)v25 + 9);
    if ((_DWORD)v28 == *((_DWORD *)v25 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v27, (unint64_t)&v38);
    }
    else
    {
      v29 = *v27;
      v30 = v38;
      if (v38)
        *(_DWORD *)v38 += 2;
      *(_QWORD *)(v29 + 8 * v28) = v30;
      *((_DWORD *)v25 + 9) = v28 + 1;
    }
  }
  v31 = v37;
  v37 = 0;
  if (v31)
  {
    if (*v31 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v31;
  }
  v32 = v38;
  v38 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v32 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v40);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v41);
  v33 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v33)
  {
    if (*v33 == 2)
      WTF::StringImpl::destroy();
    else
      *v33 -= 2;
  }
  v34 = v39;
  v39 = 0;
  if (v34)
  {
    if (*(_DWORD *)v34 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v34;
  }
  v35 = v40;
  v40 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v35;
  }
}

@end
