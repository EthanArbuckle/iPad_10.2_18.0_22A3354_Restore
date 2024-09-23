@implementation RWIProtocolDOMStorageDomainEventDispatcher

- (RWIProtocolDOMStorageDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  RWIProtocolDOMStorageDomainEventDispatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMStorageDomainEventDispatcher;
  result = -[RWIProtocolDOMStorageDomainEventDispatcher init](&v5, sel_init);
  if (result)
    result->_controller = a3;
  return result;
}

- (void)domStorageItemsClearedWithStorageId:(id)a3
{
  WTF::JSONImpl::Object *v4;
  Inspector::FrontendRouter *v5;
  WTF::StringImpl *v6;
  WTF::JSONImpl::Object *v7;
  WTF::JSONImpl::Object *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  WTF::StringImpl *v13;
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
  uint64_t v27;
  _DWORD *v28;
  WTF::StringImpl *v29;
  WTF::JSONImpl::Object *v30;
  WTF::JSONImpl::Value *v31;
  _QWORD v32[2];
  char v33;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v5 = v4;
  if (!a3)
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("storageId"));
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = (WTF::JSONImpl::Object *)v32[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::StringImpl *)v32[0];
  WTF::JSONImpl::ObjectBase::setString(v31, (const WTF::String *)&v30, (const WTF::String *)&v29);
  v6 = v29;
  v29 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v30;
  v30 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  WTF::JSONImpl::Object::create(v7);
  v8 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::StringImpl *)v32[0];
  if (a3)
  {
    objc_msgSend(a3, "toJSONObject");
    v9 = v27;
  }
  else
  {
    v9 = 0;
  }
  v28 = (_DWORD *)v9;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v8 + 2, &v29, (uint64_t *)&v28, (uint64_t)v32);
  if (v33)
  {
    v10 = (uint64_t *)((char *)v8 + 24);
    v11 = *((unsigned int *)v8 + 9);
    if ((_DWORD)v11 == *((_DWORD *)v8 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v10, (unint64_t)&v29);
    }
    else
    {
      v12 = *v10;
      v13 = v29;
      if (v29)
        *(_DWORD *)v29 += 2;
      *(_QWORD *)(v12 + 8 * v11) = v13;
      *((_DWORD *)v8 + 9) = v11 + 1;
    }
  }
  v14 = v28;
  v28 = 0;
  if (v14)
  {
    if (*v14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v14;
  }
  v15 = v29;
  v29 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v17 = (uint64_t)v30;
  v29 = (WTF::StringImpl *)v32[0];
  v30 = 0;
  v28 = (_DWORD *)v17;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v16 + 2, &v29, (uint64_t *)&v28, (uint64_t)v32);
  if (v33)
  {
    v18 = (uint64_t *)((char *)v16 + 24);
    v19 = *((unsigned int *)v16 + 9);
    if ((_DWORD)v19 == *((_DWORD *)v16 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v18, (unint64_t)&v29);
    }
    else
    {
      v20 = *v18;
      v21 = v29;
      if (v29)
        *(_DWORD *)v29 += 2;
      *(_QWORD *)(v20 + 8 * v19) = v21;
      *((_DWORD *)v16 + 9) = v19 + 1;
    }
  }
  v22 = v28;
  v28 = 0;
  if (v22)
  {
    if (*v22 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v22;
  }
  v23 = v29;
  v29 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v23 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v31);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v32);
  v24 = (_DWORD *)v32[0];
  v32[0] = 0;
  if (v24)
  {
    if (*v24 == 2)
      WTF::StringImpl::destroy();
    else
      *v24 -= 2;
  }
  v25 = v30;
  v30 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v25;
  }
  v26 = v31;
  v31 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v26;
  }
}

- (void)domStorageItemRemovedWithStorageId:(id)a3 key:(id)a4
{
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::Object *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  _DWORD *v16;
  WTF::StringImpl *v17;
  WTF::JSONImpl::ObjectBase *v18;
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
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("storageId"));
    if (a4)
      goto LABEL_3;
  }
  v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("key"));
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
  if (a3)
  {
    objc_msgSend(a3, "toJSONObject");
    v11 = v32;
  }
  else
  {
    v11 = 0;
  }
  v33 = (_DWORD *)v11;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v10 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v12 = (uint64_t *)((char *)v10 + 24);
    v13 = *((unsigned int *)v10 + 9);
    if ((_DWORD)v13 == *((_DWORD *)v10 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v12, (unint64_t)&v34);
    }
    else
    {
      v14 = *v12;
      v15 = v34;
      if (v34)
        *(_DWORD *)v34 += 2;
      *(_QWORD *)(v14 + 8 * v13) = v15;
      *((_DWORD *)v10 + 9) = v13 + 1;
    }
  }
  v16 = v33;
  v33 = 0;
  if (v16)
  {
    if (*v16 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v16;
  }
  v17 = v34;
  v34 = 0;
  if (v17)
  {
    if (*(_DWORD *)v17 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v17 -= 2;
  }
  v18 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  MEMORY[0x2207574E0](v37, a4);
  WTF::JSONImpl::ObjectBase::setString(v18, (const WTF::String *)&v34, (const WTF::String *)v37);
  v19 = (_DWORD *)v37[0];
  v37[0] = 0;
  if (v19)
  {
    if (*v19 == 2)
      WTF::StringImpl::destroy();
    else
      *v19 -= 2;
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

- (void)domStorageItemAddedWithStorageId:(id)a3 key:(id)a4 newValue:(id)a5
{
  WTF::JSONImpl::Object *v8;
  Inspector::FrontendRouter *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Object *v11;
  WTF::JSONImpl::Object *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  _DWORD *v18;
  WTF::StringImpl *v19;
  WTF::JSONImpl::ObjectBase *v20;
  _DWORD *v21;
  WTF::StringImpl *v22;
  WTF::JSONImpl::ObjectBase *v23;
  _DWORD *v24;
  WTF::StringImpl *v25;
  WTF::JSONImpl::Value *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  WTF::StringImpl *v31;
  _DWORD *v32;
  WTF::StringImpl *v33;
  _DWORD *v34;
  WTF::JSONImpl::Object *v35;
  WTF::JSONImpl::Value *v36;
  uint64_t v37;
  _DWORD *v38;
  WTF::StringImpl *v39;
  WTF::JSONImpl::Object *v40;
  WTF::JSONImpl::Value *v41;
  _QWORD v42[2];
  char v43;

  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_8:
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("key"));
    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("storageId"));
  if (!a4)
    goto LABEL_8;
LABEL_3:
  if (a5)
    goto LABEL_4;
LABEL_9:
  v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("newValue"));
LABEL_4:
  WTF::JSONImpl::Object::create(v8);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::JSONImpl::Object *)v42[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::StringImpl *)v42[0];
  WTF::JSONImpl::ObjectBase::setString(v41, (const WTF::String *)&v40, (const WTF::String *)&v39);
  v10 = v39;
  v39 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v40;
  v40 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      v11 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  WTF::JSONImpl::Object::create(v11);
  v12 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::StringImpl *)v42[0];
  if (a3)
  {
    objc_msgSend(a3, "toJSONObject");
    v13 = v37;
  }
  else
  {
    v13 = 0;
  }
  v38 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    v14 = (uint64_t *)((char *)v12 + 24);
    v15 = *((unsigned int *)v12 + 9);
    if ((_DWORD)v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v39);
    }
    else
    {
      v16 = *v14;
      v17 = v39;
      if (v39)
        *(_DWORD *)v39 += 2;
      *(_QWORD *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  v18 = v38;
  v38 = 0;
  if (v18)
  {
    if (*v18 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v18;
  }
  v19 = v39;
  v39 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::StringImpl *)v42[0];
  MEMORY[0x2207574E0](v42, a4);
  WTF::JSONImpl::ObjectBase::setString(v20, (const WTF::String *)&v39, (const WTF::String *)v42);
  v21 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v21)
  {
    if (*v21 == 2)
      WTF::StringImpl::destroy();
    else
      *v21 -= 2;
  }
  v22 = v39;
  v39 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v22 -= 2;
  }
  v23 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v39 = (WTF::StringImpl *)v42[0];
  MEMORY[0x2207574E0](v42, a5);
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v39, (const WTF::String *)v42);
  v24 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v24)
  {
    if (*v24 == 2)
      WTF::StringImpl::destroy();
    else
      *v24 -= 2;
  }
  v25 = v39;
  v39 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v25 -= 2;
  }
  v26 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (uint64_t)v40;
  v39 = (WTF::StringImpl *)v42[0];
  v40 = 0;
  v38 = (_DWORD *)v27;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v26 + 2, &v39, (uint64_t *)&v38, (uint64_t)v42);
  if (v43)
  {
    v28 = (uint64_t *)((char *)v26 + 24);
    v29 = *((unsigned int *)v26 + 9);
    if ((_DWORD)v29 == *((_DWORD *)v26 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v28, (unint64_t)&v39);
    }
    else
    {
      v30 = *v28;
      v31 = v39;
      if (v39)
        *(_DWORD *)v39 += 2;
      *(_QWORD *)(v30 + 8 * v29) = v31;
      *((_DWORD *)v26 + 9) = v29 + 1;
    }
  }
  v32 = v38;
  v38 = 0;
  if (v32)
  {
    if (*v32 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v32;
  }
  v33 = v39;
  v39 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v33 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v41);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v42);
  v34 = (_DWORD *)v42[0];
  v42[0] = 0;
  if (v34)
  {
    if (*v34 == 2)
      WTF::StringImpl::destroy();
    else
      *v34 -= 2;
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
  v36 = v41;
  v41 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v36;
  }
}

- (void)domStorageItemUpdatedWithStorageId:(id)a3 key:(id)a4 oldValue:(id)a5 newValue:(id)a6
{
  WTF::JSONImpl::Object *v10;
  Inspector::FrontendRouter *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  WTF::JSONImpl::Object *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  _DWORD *v20;
  WTF::StringImpl *v21;
  WTF::JSONImpl::ObjectBase *v22;
  _DWORD *v23;
  WTF::StringImpl *v24;
  WTF::JSONImpl::ObjectBase *v25;
  _DWORD *v26;
  WTF::StringImpl *v27;
  WTF::JSONImpl::ObjectBase *v28;
  _DWORD *v29;
  WTF::StringImpl *v30;
  WTF::JSONImpl::Value *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  WTF::StringImpl *v36;
  _DWORD *v37;
  WTF::StringImpl *v38;
  _DWORD *v39;
  WTF::JSONImpl::Object *v40;
  WTF::JSONImpl::Value *v41;
  uint64_t v42;
  _DWORD *v43;
  WTF::StringImpl *v44;
  WTF::JSONImpl::Object *v45;
  WTF::JSONImpl::Value *v46;
  _QWORD v47[2];
  char v48;

  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (a3)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("storageId"));
    if (a4)
    {
LABEL_3:
      if (a5)
        goto LABEL_4;
LABEL_10:
      v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("oldValue"));
      if (a6)
        goto LABEL_5;
      goto LABEL_11;
    }
  }
  v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("key"));
  if (!a5)
    goto LABEL_10;
LABEL_4:
  if (a6)
    goto LABEL_5;
LABEL_11:
  v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("newValue"));
LABEL_5:
  WTF::JSONImpl::Object::create(v10);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v45 = (WTF::JSONImpl::Object *)v47[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v44 = (WTF::StringImpl *)v47[0];
  WTF::JSONImpl::ObjectBase::setString(v46, (const WTF::String *)&v45, (const WTF::String *)&v44);
  v12 = v44;
  v44 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v45;
  v45 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  WTF::JSONImpl::Object::create(v13);
  v14 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v44 = (WTF::StringImpl *)v47[0];
  if (a3)
  {
    objc_msgSend(a3, "toJSONObject");
    v15 = v42;
  }
  else
  {
    v15 = 0;
  }
  v43 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v14 + 2, &v44, (uint64_t *)&v43, (uint64_t)v47);
  if (v48)
  {
    v16 = (uint64_t *)((char *)v14 + 24);
    v17 = *((unsigned int *)v14 + 9);
    if ((_DWORD)v17 == *((_DWORD *)v14 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v44);
    }
    else
    {
      v18 = *v16;
      v19 = v44;
      if (v44)
        *(_DWORD *)v44 += 2;
      *(_QWORD *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  v20 = v43;
  v43 = 0;
  if (v20)
  {
    if (*v20 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v20;
  }
  v21 = v44;
  v44 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v21 -= 2;
  }
  v22 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v44 = (WTF::StringImpl *)v47[0];
  MEMORY[0x2207574E0](v47, a4);
  WTF::JSONImpl::ObjectBase::setString(v22, (const WTF::String *)&v44, (const WTF::String *)v47);
  v23 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v23)
  {
    if (*v23 == 2)
      WTF::StringImpl::destroy();
    else
      *v23 -= 2;
  }
  v24 = v44;
  v44 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v24 -= 2;
  }
  v25 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v44 = (WTF::StringImpl *)v47[0];
  MEMORY[0x2207574E0](v47, a5);
  WTF::JSONImpl::ObjectBase::setString(v25, (const WTF::String *)&v44, (const WTF::String *)v47);
  v26 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v26)
  {
    if (*v26 == 2)
      WTF::StringImpl::destroy();
    else
      *v26 -= 2;
  }
  v27 = v44;
  v44 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v27 -= 2;
  }
  v28 = v45;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v44 = (WTF::StringImpl *)v47[0];
  MEMORY[0x2207574E0](v47, a6);
  WTF::JSONImpl::ObjectBase::setString(v28, (const WTF::String *)&v44, (const WTF::String *)v47);
  v29 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v29)
  {
    if (*v29 == 2)
      WTF::StringImpl::destroy();
    else
      *v29 -= 2;
  }
  v30 = v44;
  v44 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v30 -= 2;
  }
  v31 = v46;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v32 = (uint64_t)v45;
  v44 = (WTF::StringImpl *)v47[0];
  v45 = 0;
  v43 = (_DWORD *)v32;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v31 + 2, &v44, (uint64_t *)&v43, (uint64_t)v47);
  if (v48)
  {
    v33 = (uint64_t *)((char *)v31 + 24);
    v34 = *((unsigned int *)v31 + 9);
    if ((_DWORD)v34 == *((_DWORD *)v31 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v33, (unint64_t)&v44);
    }
    else
    {
      v35 = *v33;
      v36 = v44;
      if (v44)
        *(_DWORD *)v44 += 2;
      *(_QWORD *)(v35 + 8 * v34) = v36;
      *((_DWORD *)v31 + 9) = v34 + 1;
    }
  }
  v37 = v43;
  v43 = 0;
  if (v37)
  {
    if (*v37 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v37;
  }
  v38 = v44;
  v44 = 0;
  if (v38)
  {
    if (*(_DWORD *)v38 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v38 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v46);
  Inspector::FrontendRouter::sendEvent(v11, (const WTF::String *)v47);
  v39 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v39)
  {
    if (*v39 == 2)
      WTF::StringImpl::destroy();
    else
      *v39 -= 2;
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
  v41 = v46;
  v46 = 0;
  if (v41)
  {
    if (*(_DWORD *)v41 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v41;
  }
}

@end
