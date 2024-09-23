@implementation RWIProtocolCSSDomainEventDispatcher

- (RWIProtocolCSSDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  RWIProtocolCSSDomainEventDispatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolCSSDomainEventDispatcher;
  result = -[RWIProtocolCSSDomainEventDispatcher init](&v5, sel_init);
  if (result)
    result->_controller = a3;
  return result;
}

- (void)mediaQueryResultChanged
{
  WTF::JSONImpl::Object *v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  WTF::JSONImpl::Value *v6;
  _DWORD *v7;
  _DWORD *v8;
  WTF::JSONImpl::Value *v9;
  _DWORD *v10;

  v2 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create(v2);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v8 = v10;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v7 = v10;
  WTF::JSONImpl::ObjectBase::setString(v9, (const WTF::String *)&v8, (const WTF::String *)&v7);
  v3 = v7;
  v7 = 0;
  if (v3)
  {
    if (*v3 == 2)
      WTF::StringImpl::destroy();
    else
      *v3 -= 2;
  }
  v4 = v8;
  v8 = 0;
  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v9);
  Inspector::FrontendRouter::sendEvent(v2, (const WTF::String *)&v10);
  v5 = v10;
  v10 = 0;
  if (v5)
  {
    if (*v5 == 2)
      WTF::StringImpl::destroy();
    else
      *v5 -= 2;
  }
  v6 = v9;
  v9 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v6;
  }
}

- (void)styleSheetChangedWithStyleSheetId:(id)a3
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
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("styleSheetId"));
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

- (void)styleSheetAddedWithHeader:(id)a3
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
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("header"));
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

- (void)styleSheetRemovedWithStyleSheetId:(id)a3
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
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("styleSheetId"));
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

- (void)nodeLayoutFlagsChangedWithNodeId:(int)a3 layoutFlags:(id *)a4
{
  WTF::JSONImpl::Value *v5;
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::ObjectBase *v10;
  WTF::StringImpl *v11;
  WTF::JSONImpl::Object *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  WTF::StringImpl *v17;
  _DWORD *v18;
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
  _DWORD *v32;
  _DWORD *v33;
  WTF::StringImpl *v34;
  WTF::JSONImpl::Object *v35;
  WTF::JSONImpl::Value *v36;
  _QWORD v37[2];
  char v38;

  v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (a4 && !*a4)
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("layoutFlags"));
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
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v34, v5);
  v11 = v34;
  v34 = 0;
  if (!v11)
  {
LABEL_15:
    if (!a4)
      goto LABEL_36;
    goto LABEL_18;
  }
  if (*(_DWORD *)v11 != 2)
  {
    *(_DWORD *)v11 -= 2;
    goto LABEL_15;
  }
  WTF::StringImpl::destroy();
  if (!a4)
    goto LABEL_36;
LABEL_18:
  v12 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::StringImpl *)v37[0];
  Inspector::toJSONStringArray((Inspector *)*a4, (uint64_t *)&v32);
  v13 = (uint64_t)v32;
  v32 = 0;
  v33 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v34, (uint64_t *)&v33, (uint64_t)v37);
  if (v38)
  {
    v14 = (uint64_t *)((char *)v12 + 24);
    v15 = *((unsigned int *)v12 + 9);
    if ((_DWORD)v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v34);
    }
    else
    {
      v16 = *v14;
      v17 = v34;
      if (v34)
        *(_DWORD *)v34 += 2;
      *(_QWORD *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  v18 = v33;
  v33 = 0;
  if (v18)
  {
    if (*v18 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v18;
  }
  v19 = v32;
  v32 = 0;
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
LABEL_36:
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

@end
