@implementation RWIProtocolConsoleDomainEventDispatcher

- (RWIProtocolConsoleDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  RWIProtocolConsoleDomainEventDispatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolConsoleDomainEventDispatcher;
  result = -[RWIProtocolConsoleDomainEventDispatcher init](&v5, sel_init);
  if (result)
    result->_controller = a3;
  return result;
}

- (void)messageAddedWithMessage:(id)a3
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
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("message"));
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

- (void)messageRepeatCountUpdatedWithCount:(int)a3 timestamp:(double *)a4
{
  WTF::JSONImpl::Value *v5;
  WTF::JSONImpl::Object *v6;
  WTF::StringImpl *v7;
  WTF::JSONImpl::Object *v8;
  WTF::JSONImpl::ObjectBase *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::ObjectBase *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Value *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  WTF::StringImpl *v18;
  _DWORD *v19;
  WTF::StringImpl *v20;
  _DWORD *v21;
  WTF::JSONImpl::Object *v22;
  WTF::JSONImpl::Value *v23;
  _DWORD *v24;
  WTF::StringImpl *v25;
  WTF::JSONImpl::Object *v26;
  WTF::JSONImpl::Value *v27;
  _QWORD v28[2];
  char v29;

  v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v26 = (WTF::JSONImpl::Object *)v28[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::StringImpl *)v28[0];
  WTF::JSONImpl::ObjectBase::setString(v27, (const WTF::String *)&v26, (const WTF::String *)&v25);
  v7 = v25;
  v25 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  v8 = v26;
  v26 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  WTF::JSONImpl::Object::create(v8);
  v9 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::StringImpl *)v28[0];
  WTF::JSONImpl::ObjectBase::setInteger(v9, &v25, v5);
  v10 = v25;
  v25 = 0;
  if (!v10)
  {
LABEL_12:
    if (!a4)
      goto LABEL_19;
    goto LABEL_15;
  }
  if (*(_DWORD *)v10 != 2)
  {
    *(_DWORD *)v10 -= 2;
    goto LABEL_12;
  }
  WTF::StringImpl::destroy();
  if (!a4)
    goto LABEL_19;
LABEL_15:
  v11 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::StringImpl *)v28[0];
  WTF::JSONImpl::ObjectBase::setDouble(v11, &v25, *a4);
  v12 = v25;
  v25 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
LABEL_19:
  v13 = v27;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v14 = (uint64_t)v26;
  v25 = (WTF::StringImpl *)v28[0];
  v26 = 0;
  v24 = (_DWORD *)v14;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v13 + 2, &v25, (uint64_t *)&v24, (uint64_t)v28);
  if (v29)
  {
    v15 = (uint64_t *)((char *)v13 + 24);
    v16 = *((unsigned int *)v13 + 9);
    if ((_DWORD)v16 == *((_DWORD *)v13 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v15, (unint64_t)&v25);
    }
    else
    {
      v17 = *v15;
      v18 = v25;
      if (v25)
        *(_DWORD *)v25 += 2;
      *(_QWORD *)(v17 + 8 * v16) = v18;
      *((_DWORD *)v13 + 9) = v16 + 1;
    }
  }
  v19 = v24;
  v24 = 0;
  if (v19)
  {
    if (*v19 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v19;
  }
  v20 = v25;
  v25 = 0;
  if (v20)
  {
    if (*(_DWORD *)v20 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v20 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v27);
  Inspector::FrontendRouter::sendEvent(v6, (const WTF::String *)v28);
  v21 = (_DWORD *)v28[0];
  v28[0] = 0;
  if (v21)
  {
    if (*v21 == 2)
      WTF::StringImpl::destroy();
    else
      *v21 -= 2;
  }
  v22 = v26;
  v26 = 0;
  if (v22)
  {
    if (*(_DWORD *)v22 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v22;
  }
  v23 = v27;
  v27 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v23;
  }
}

- (void)messagesClearedWithReason:(int64_t)a3
{
  WTF::JSONImpl::Object *v3;
  WTF::StringImpl *v4;
  WTF::JSONImpl::Object *v5;
  WTF::JSONImpl::ObjectBase *v6;
  _DWORD *v7;
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

  v3 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create(v3);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v22 = (WTF::JSONImpl::Object *)v24[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (WTF::StringImpl *)v24[0];
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v22, (const WTF::String *)&v21);
  v4 = v21;
  v21 = 0;
  if (v4)
  {
    if (*(_DWORD *)v4 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v4 -= 2;
  }
  v5 = v22;
  v22 = 0;
  if (v5)
  {
    if (*(_DWORD *)v5 == 2)
      v5 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v5 -= 2;
  }
  WTF::JSONImpl::Object::create(v5);
  v6 = v22;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (WTF::StringImpl *)v24[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v20 = (_DWORD *)v24[0];
  WTF::JSONImpl::ObjectBase::setString(v6, (const WTF::String *)&v21, (const WTF::String *)&v20);
  v7 = v20;
  v20 = 0;
  if (v7)
  {
    if (*v7 == 2)
      WTF::StringImpl::destroy();
    else
      *v7 -= 2;
  }
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
  Inspector::FrontendRouter::sendEvent(v3, (const WTF::String *)v24);
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

- (void)heapSnapshotWithTimestamp:(double)a3 snapshotData:(id)a4 title:(id *)a5
{
  WTF::JSONImpl::Object *v8;
  Inspector::FrontendRouter *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Object *v11;
  WTF::JSONImpl::ObjectBase *v12;
  WTF::StringImpl *v13;
  WTF::JSONImpl::ObjectBase *v14;
  _DWORD *v15;
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
  if (!a4)
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("snapshotData"));
  if (a5 && !*a5)
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("title"));
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
  WTF::JSONImpl::ObjectBase::setDouble(v12, &v32, a3);
  v13 = v32;
  v32 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v33;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v32 = (WTF::StringImpl *)v35[0];
  MEMORY[0x2207574E0](v35, a4);
  WTF::JSONImpl::ObjectBase::setString(v14, (const WTF::String *)&v32, (const WTF::String *)v35);
  v15 = (_DWORD *)v35[0];
  v35[0] = 0;
  if (v15)
  {
    if (*v15 == 2)
      WTF::StringImpl::destroy();
    else
      *v15 -= 2;
  }
  v16 = v32;
  v32 = 0;
  if (!v16)
  {
LABEL_25:
    if (!a5)
      goto LABEL_36;
    goto LABEL_28;
  }
  if (*(_DWORD *)v16 != 2)
  {
    *(_DWORD *)v16 -= 2;
    goto LABEL_25;
  }
  WTF::StringImpl::destroy();
  if (!a5)
    goto LABEL_36;
LABEL_28:
  v17 = v33;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v32 = (WTF::StringImpl *)v35[0];
  MEMORY[0x2207574E0](v35, *a5);
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
LABEL_36:
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

@end
