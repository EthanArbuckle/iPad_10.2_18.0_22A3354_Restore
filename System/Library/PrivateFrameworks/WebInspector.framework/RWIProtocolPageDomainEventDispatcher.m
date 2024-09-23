@implementation RWIProtocolPageDomainEventDispatcher

- (RWIProtocolPageDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  RWIProtocolPageDomainEventDispatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolPageDomainEventDispatcher;
  result = -[RWIProtocolPageDomainEventDispatcher init](&v5, sel_init);
  if (result)
    result->_controller = a3;
  return result;
}

- (void)domContentEventFiredWithTimestamp:(double)a3
{
  WTF::JSONImpl::Object *v4;
  WTF::StringImpl *v5;
  WTF::JSONImpl::Object *v6;
  WTF::JSONImpl::ObjectBase *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Value *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  _DWORD *v17;
  WTF::JSONImpl::Object *v18;
  WTF::JSONImpl::Value *v19;
  _DWORD *v20;
  WTF::StringImpl *v21;
  WTF::JSONImpl::Object *v22;
  WTF::JSONImpl::Value *v23;
  _QWORD v24[2];
  char v25;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::JSONImpl::Object *)v24[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (WTF::StringImpl *)v24[0];
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v22, (const WTF::String *)&v21);
  v5 = v21;
  v21 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v22;
  v22 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      v6 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  WTF::JSONImpl::Object::create(v6);
  v7 = v22;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (WTF::StringImpl *)v24[0];
  WTF::JSONImpl::ObjectBase::setDouble(v7, &v21, a3);
  v8 = v21;
  v21 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v10 = (uint64_t)v22;
  v21 = (WTF::StringImpl *)v24[0];
  v22 = 0;
  v20 = (_DWORD *)v10;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v9 + 2, &v21, (uint64_t *)&v20, (uint64_t)v24);
  if (v25)
  {
    v11 = (uint64_t *)((char *)v9 + 24);
    v12 = *((unsigned int *)v9 + 9);
    if ((_DWORD)v12 == *((_DWORD *)v9 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v11, (unint64_t)&v21);
    }
    else
    {
      v13 = *v11;
      v14 = v21;
      if (v21)
        *(_DWORD *)v21 += 2;
      *(_QWORD *)(v13 + 8 * v12) = v14;
      *((_DWORD *)v9 + 9) = v12 + 1;
    }
  }
  v15 = v20;
  v20 = 0;
  if (v15)
  {
    if (*v15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v15;
  }
  v16 = v21;
  v21 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v23);
  Inspector::FrontendRouter::sendEvent(v4, (const WTF::String *)v24);
  v17 = (_DWORD *)v24[0];
  v24[0] = 0;
  if (v17)
  {
    if (*v17 == 2)
      WTF::StringImpl::destroy();
    else
      *v17 -= 2;
  }
  v18 = v22;
  v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v18;
  }
  v19 = v23;
  v23 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v19;
  }
}

- (void)loadEventFiredWithTimestamp:(double)a3
{
  WTF::JSONImpl::Object *v4;
  WTF::StringImpl *v5;
  WTF::JSONImpl::Object *v6;
  WTF::JSONImpl::ObjectBase *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Value *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  _DWORD *v15;
  WTF::StringImpl *v16;
  _DWORD *v17;
  WTF::JSONImpl::Object *v18;
  WTF::JSONImpl::Value *v19;
  _DWORD *v20;
  WTF::StringImpl *v21;
  WTF::JSONImpl::Object *v22;
  WTF::JSONImpl::Value *v23;
  _QWORD v24[2];
  char v25;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::JSONImpl::Object *)v24[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (WTF::StringImpl *)v24[0];
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v22, (const WTF::String *)&v21);
  v5 = v21;
  v21 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v5 -= 2;
  }
  v6 = v22;
  v22 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      v6 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  WTF::JSONImpl::Object::create(v6);
  v7 = v22;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (WTF::StringImpl *)v24[0];
  WTF::JSONImpl::ObjectBase::setDouble(v7, &v21, a3);
  v8 = v21;
  v21 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v23;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v10 = (uint64_t)v22;
  v21 = (WTF::StringImpl *)v24[0];
  v22 = 0;
  v20 = (_DWORD *)v10;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v9 + 2, &v21, (uint64_t *)&v20, (uint64_t)v24);
  if (v25)
  {
    v11 = (uint64_t *)((char *)v9 + 24);
    v12 = *((unsigned int *)v9 + 9);
    if ((_DWORD)v12 == *((_DWORD *)v9 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v11, (unint64_t)&v21);
    }
    else
    {
      v13 = *v11;
      v14 = v21;
      if (v21)
        *(_DWORD *)v21 += 2;
      *(_QWORD *)(v13 + 8 * v12) = v14;
      *((_DWORD *)v9 + 9) = v12 + 1;
    }
  }
  v15 = v20;
  v20 = 0;
  if (v15)
  {
    if (*v15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v15;
  }
  v16 = v21;
  v21 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v23);
  Inspector::FrontendRouter::sendEvent(v4, (const WTF::String *)v24);
  v17 = (_DWORD *)v24[0];
  v24[0] = 0;
  if (v17)
  {
    if (*v17 == 2)
      WTF::StringImpl::destroy();
    else
      *v17 -= 2;
  }
  v18 = v22;
  v22 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v18;
  }
  v19 = v23;
  v23 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v19;
  }
}

- (void)frameNavigatedWithFrame:(id)a3
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
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frame"));
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

- (void)frameDetachedWithFrameId:(id)a3
{
  WTF::JSONImpl::Object *v4;
  Inspector::FrontendRouter *v5;
  WTF::StringImpl *v6;
  WTF::JSONImpl::Object *v7;
  WTF::JSONImpl::ObjectBase *v8;
  _DWORD *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Value *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  _DWORD *v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::JSONImpl::Object *v20;
  WTF::JSONImpl::Value *v21;
  _DWORD *v22;
  WTF::StringImpl *v23;
  WTF::JSONImpl::Object *v24;
  WTF::JSONImpl::Value *v25;
  _QWORD v26[2];
  char v27;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v5 = v4;
  if (!a3)
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::JSONImpl::Object *)v26[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  WTF::JSONImpl::ObjectBase::setString(v25, (const WTF::String *)&v24, (const WTF::String *)&v23);
  v6 = v23;
  v23 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  WTF::JSONImpl::Object::create(v7);
  v8 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  MEMORY[0x2207574E0](v26, a3);
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v23, (const WTF::String *)v26);
  v9 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v9)
  {
    if (*v9 == 2)
      WTF::StringImpl::destroy();
    else
      *v9 -= 2;
  }
  v10 = v23;
  v23 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12 = (uint64_t)v24;
  v23 = (WTF::StringImpl *)v26[0];
  v24 = 0;
  v22 = (_DWORD *)v12;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v11 + 2, &v23, (uint64_t *)&v22, (uint64_t)v26);
  if (v27)
  {
    v13 = (uint64_t *)((char *)v11 + 24);
    v14 = *((unsigned int *)v11 + 9);
    if ((_DWORD)v14 == *((_DWORD *)v11 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v13, (unint64_t)&v23);
    }
    else
    {
      v15 = *v13;
      v16 = v23;
      if (v23)
        *(_DWORD *)v23 += 2;
      *(_QWORD *)(v15 + 8 * v14) = v16;
      *((_DWORD *)v11 + 9) = v14 + 1;
    }
  }
  v17 = v22;
  v22 = 0;
  if (v17)
  {
    if (*v17 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v17;
  }
  v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v25);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v26);
  v19 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v19)
  {
    if (*v19 == 2)
      WTF::StringImpl::destroy();
    else
      *v19 -= 2;
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v20;
  }
  v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v21;
  }
}

- (void)frameStartedLoadingWithFrameId:(id)a3
{
  WTF::JSONImpl::Object *v4;
  Inspector::FrontendRouter *v5;
  WTF::StringImpl *v6;
  WTF::JSONImpl::Object *v7;
  WTF::JSONImpl::ObjectBase *v8;
  _DWORD *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Value *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  _DWORD *v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::JSONImpl::Object *v20;
  WTF::JSONImpl::Value *v21;
  _DWORD *v22;
  WTF::StringImpl *v23;
  WTF::JSONImpl::Object *v24;
  WTF::JSONImpl::Value *v25;
  _QWORD v26[2];
  char v27;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v5 = v4;
  if (!a3)
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::JSONImpl::Object *)v26[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  WTF::JSONImpl::ObjectBase::setString(v25, (const WTF::String *)&v24, (const WTF::String *)&v23);
  v6 = v23;
  v23 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  WTF::JSONImpl::Object::create(v7);
  v8 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  MEMORY[0x2207574E0](v26, a3);
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v23, (const WTF::String *)v26);
  v9 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v9)
  {
    if (*v9 == 2)
      WTF::StringImpl::destroy();
    else
      *v9 -= 2;
  }
  v10 = v23;
  v23 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12 = (uint64_t)v24;
  v23 = (WTF::StringImpl *)v26[0];
  v24 = 0;
  v22 = (_DWORD *)v12;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v11 + 2, &v23, (uint64_t *)&v22, (uint64_t)v26);
  if (v27)
  {
    v13 = (uint64_t *)((char *)v11 + 24);
    v14 = *((unsigned int *)v11 + 9);
    if ((_DWORD)v14 == *((_DWORD *)v11 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v13, (unint64_t)&v23);
    }
    else
    {
      v15 = *v13;
      v16 = v23;
      if (v23)
        *(_DWORD *)v23 += 2;
      *(_QWORD *)(v15 + 8 * v14) = v16;
      *((_DWORD *)v11 + 9) = v14 + 1;
    }
  }
  v17 = v22;
  v22 = 0;
  if (v17)
  {
    if (*v17 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v17;
  }
  v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v25);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v26);
  v19 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v19)
  {
    if (*v19 == 2)
      WTF::StringImpl::destroy();
    else
      *v19 -= 2;
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v20;
  }
  v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v21;
  }
}

- (void)frameStoppedLoadingWithFrameId:(id)a3
{
  WTF::JSONImpl::Object *v4;
  Inspector::FrontendRouter *v5;
  WTF::StringImpl *v6;
  WTF::JSONImpl::Object *v7;
  WTF::JSONImpl::ObjectBase *v8;
  _DWORD *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Value *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  _DWORD *v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::JSONImpl::Object *v20;
  WTF::JSONImpl::Value *v21;
  _DWORD *v22;
  WTF::StringImpl *v23;
  WTF::JSONImpl::Object *v24;
  WTF::JSONImpl::Value *v25;
  _QWORD v26[2];
  char v27;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v5 = v4;
  if (!a3)
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::JSONImpl::Object *)v26[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  WTF::JSONImpl::ObjectBase::setString(v25, (const WTF::String *)&v24, (const WTF::String *)&v23);
  v6 = v23;
  v23 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  WTF::JSONImpl::Object::create(v7);
  v8 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  MEMORY[0x2207574E0](v26, a3);
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v23, (const WTF::String *)v26);
  v9 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v9)
  {
    if (*v9 == 2)
      WTF::StringImpl::destroy();
    else
      *v9 -= 2;
  }
  v10 = v23;
  v23 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12 = (uint64_t)v24;
  v23 = (WTF::StringImpl *)v26[0];
  v24 = 0;
  v22 = (_DWORD *)v12;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v11 + 2, &v23, (uint64_t *)&v22, (uint64_t)v26);
  if (v27)
  {
    v13 = (uint64_t *)((char *)v11 + 24);
    v14 = *((unsigned int *)v11 + 9);
    if ((_DWORD)v14 == *((_DWORD *)v11 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v13, (unint64_t)&v23);
    }
    else
    {
      v15 = *v13;
      v16 = v23;
      if (v23)
        *(_DWORD *)v23 += 2;
      *(_QWORD *)(v15 + 8 * v14) = v16;
      *((_DWORD *)v11 + 9) = v14 + 1;
    }
  }
  v17 = v22;
  v22 = 0;
  if (v17)
  {
    if (*v17 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v17;
  }
  v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v25);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v26);
  v19 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v19)
  {
    if (*v19 == 2)
      WTF::StringImpl::destroy();
    else
      *v19 -= 2;
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v20;
  }
  v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v21;
  }
}

- (void)frameScheduledNavigationWithFrameId:(id)a3 delay:(double)a4
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
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
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

- (void)frameClearedScheduledNavigationWithFrameId:(id)a3
{
  WTF::JSONImpl::Object *v4;
  Inspector::FrontendRouter *v5;
  WTF::StringImpl *v6;
  WTF::JSONImpl::Object *v7;
  WTF::JSONImpl::ObjectBase *v8;
  _DWORD *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Value *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  WTF::StringImpl *v16;
  _DWORD *v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::JSONImpl::Object *v20;
  WTF::JSONImpl::Value *v21;
  _DWORD *v22;
  WTF::StringImpl *v23;
  WTF::JSONImpl::Object *v24;
  WTF::JSONImpl::Value *v25;
  _QWORD v26[2];
  char v27;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v5 = v4;
  if (!a3)
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("frameId"));
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (WTF::JSONImpl::Object *)v26[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  WTF::JSONImpl::ObjectBase::setString(v25, (const WTF::String *)&v24, (const WTF::String *)&v23);
  v6 = v23;
  v23 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v24;
  v24 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  WTF::JSONImpl::Object::create(v7);
  v8 = v24;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v23 = (WTF::StringImpl *)v26[0];
  MEMORY[0x2207574E0](v26, a3);
  WTF::JSONImpl::ObjectBase::setString(v8, (const WTF::String *)&v23, (const WTF::String *)v26);
  v9 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v9)
  {
    if (*v9 == 2)
      WTF::StringImpl::destroy();
    else
      *v9 -= 2;
  }
  v10 = v23;
  v23 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v25;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12 = (uint64_t)v24;
  v23 = (WTF::StringImpl *)v26[0];
  v24 = 0;
  v22 = (_DWORD *)v12;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v11 + 2, &v23, (uint64_t *)&v22, (uint64_t)v26);
  if (v27)
  {
    v13 = (uint64_t *)((char *)v11 + 24);
    v14 = *((unsigned int *)v11 + 9);
    if ((_DWORD)v14 == *((_DWORD *)v11 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v13, (unint64_t)&v23);
    }
    else
    {
      v15 = *v13;
      v16 = v23;
      if (v23)
        *(_DWORD *)v23 += 2;
      *(_QWORD *)(v15 + 8 * v14) = v16;
      *((_DWORD *)v11 + 9) = v14 + 1;
    }
  }
  v17 = v22;
  v22 = 0;
  if (v17)
  {
    if (*v17 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v17;
  }
  v18 = v23;
  v23 = 0;
  if (v18)
  {
    if (*(_DWORD *)v18 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v18 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v25);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v26);
  v19 = (_DWORD *)v26[0];
  v26[0] = 0;
  if (v19)
  {
    if (*v19 == 2)
      WTF::StringImpl::destroy();
    else
      *v19 -= 2;
  }
  v20 = v24;
  v24 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v20;
  }
  v21 = v25;
  v25 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v21;
  }
}

- (void)defaultUserPreferencesDidChangeWithPreferences:(id)a3
{
  WTF::JSONImpl::Object *v4;
  WTF::JSONImpl::Object *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::JSONImpl::Object *v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  WTF::JSONImpl::Object *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  WTF::StringImpl *v19;
  _DWORD *v20;
  _DWORD *v21;
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
  Inspector::FrontendRouter *v34;
  _DWORD *v35;
  _DWORD *v36;
  WTF::StringImpl *v37;
  WTF::JSONImpl::Object *v38;
  WTF::JSONImpl::Value *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  char v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v34 = (Inspector::FrontendRouter *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                      + 4))(self->_controller, a2);
  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("preferences"));
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = (WTF::JSONImpl::Object *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)v41;
    v7 = *MEMORY[0x24BDBCAB8];
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v41 != v6)
          objc_enumerationMutation(a3);
        v9 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v10 = (void *)MEMORY[0x24BDBCE88];
          v11 = (objc_class *)objc_opt_class();
          objc_msgSend(v10, "raise:format:", v7, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v11), v9, v34);
        }
        v8 = (WTF::JSONImpl::Object *)((char *)v8 + 1);
      }
      while (v5 != v8);
      v4 = (WTF::JSONImpl::Object *)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      v5 = v4;
    }
    while (v4);
  }
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::JSONImpl::Object *)v44[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v44[0];
  WTF::JSONImpl::ObjectBase::setString(v39, (const WTF::String *)&v38, (const WTF::String *)&v37);
  v12 = v37;
  v37 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v38;
  v38 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      v13 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  WTF::JSONImpl::Object::create(v13);
  v14 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v44[0];
  Inspector::toJSONObjectArray((Inspector *)a3, (uint64_t *)&v35);
  v15 = (uint64_t)v35;
  v35 = 0;
  v36 = (_DWORD *)v15;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v14 + 2, &v37, (uint64_t *)&v36, (uint64_t)v44);
  if (v45)
  {
    v16 = (uint64_t *)((char *)v14 + 24);
    v17 = *((unsigned int *)v14 + 9);
    if ((_DWORD)v17 == *((_DWORD *)v14 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v16, (unint64_t)&v37);
    }
    else
    {
      v18 = *v16;
      v19 = v37;
      if (v37)
        *(_DWORD *)v37 += 2;
      *(_QWORD *)(v18 + 8 * v17) = v19;
      *((_DWORD *)v14 + 9) = v17 + 1;
    }
  }
  v20 = v36;
  v36 = 0;
  if (v20)
  {
    if (*v20 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v20;
  }
  v21 = v35;
  v35 = 0;
  if (v21)
  {
    if (*v21 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v21;
  }
  v22 = v37;
  v37 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v22 -= 2;
  }
  v23 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v24 = (uint64_t)v38;
  v37 = (WTF::StringImpl *)v44[0];
  v38 = 0;
  v36 = (_DWORD *)v24;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v23 + 2, &v37, (uint64_t *)&v36, (uint64_t)v44);
  if (v45)
  {
    v25 = (uint64_t *)((char *)v23 + 24);
    v26 = *((unsigned int *)v23 + 9);
    if ((_DWORD)v26 == *((_DWORD *)v23 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v25, (unint64_t)&v37);
    }
    else
    {
      v27 = *v25;
      v28 = v37;
      if (v37)
        *(_DWORD *)v37 += 2;
      *(_QWORD *)(v27 + 8 * v26) = v28;
      *((_DWORD *)v23 + 9) = v26 + 1;
    }
  }
  v29 = v36;
  v36 = 0;
  if (v29)
  {
    if (*v29 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v29;
  }
  v30 = v37;
  v37 = 0;
  if (v30)
  {
    if (*(_DWORD *)v30 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v30 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v39);
  Inspector::FrontendRouter::sendEvent(v34, (const WTF::String *)v44);
  v31 = (_DWORD *)v44[0];
  v44[0] = 0;
  if (v31)
  {
    if (*v31 == 2)
      WTF::StringImpl::destroy();
    else
      *v31 -= 2;
  }
  v32 = v38;
  v38 = 0;
  if (v32)
  {
    if (*(_DWORD *)v32 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v32;
  }
  v33 = v39;
  v39 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v33;
  }
}

@end
