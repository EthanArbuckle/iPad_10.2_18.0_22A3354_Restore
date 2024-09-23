@implementation RWIProtocolDOMDomainEventDispatcher

- (RWIProtocolDOMDomainEventDispatcher)initWithController:(AugmentableInspectorController *)a3
{
  RWIProtocolDOMDomainEventDispatcher *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RWIProtocolDOMDomainEventDispatcher;
  result = -[RWIProtocolDOMDomainEventDispatcher init](&v5, sel_init);
  if (result)
    result->_controller = a3;
  return result;
}

- (void)documentUpdated
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

- (void)inspectWithNodeId:(int)a3
{
  WTF::JSONImpl::Value *v3;
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

  v3 = *(WTF::JSONImpl::Value **)&a3;
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
  WTF::JSONImpl::ObjectBase::setInteger(v7, &v21, v3);
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

- (void)setChildNodesWithParentId:(int)a3 nodes:(id)a4
{
  WTF::JSONImpl::Object *v5;
  WTF::JSONImpl::Object *v6;
  uint64_t v7;
  uint64_t v8;
  WTF::JSONImpl::Object *v9;
  uint64_t v10;
  void *v11;
  objc_class *v12;
  WTF::StringImpl *v13;
  WTF::JSONImpl::Object *v14;
  WTF::JSONImpl::ObjectBase *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::Object *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  _DWORD *v23;
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
  Inspector::FrontendRouter *v37;
  _DWORD v38[3];
  _DWORD *v39;
  WTF::StringImpl *v40;
  WTF::JSONImpl::Object *v41;
  WTF::JSONImpl::Value *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  char v48;
  _BYTE v49[128];
  uint64_t v50;

  v38[0] = a3;
  v50 = *MEMORY[0x24BDAC8D0];
  v37 = (Inspector::FrontendRouter *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                      + 4))(self->_controller, a2);
  if (!a4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("nodes"));
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v5 = (WTF::JSONImpl::Object *)objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)v44;
    v8 = *MEMORY[0x24BDBCAB8];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v44 != v7)
          objc_enumerationMutation(a4);
        v10 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v11 = (void *)MEMORY[0x24BDBCE88];
          v12 = (objc_class *)objc_opt_class();
          objc_msgSend(v11, "raise:format:", v8, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v12), v10);
        }
        v9 = (WTF::JSONImpl::Object *)((char *)v9 + 1);
      }
      while (v6 != v9);
      v5 = (WTF::JSONImpl::Object *)objc_msgSend(a4, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
      v6 = v5;
    }
    while (v5);
  }
  WTF::JSONImpl::Object::create(v5);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v41 = (WTF::JSONImpl::Object *)v47[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::StringImpl *)v47[0];
  WTF::JSONImpl::ObjectBase::setString(v42, (const WTF::String *)&v41, (const WTF::String *)&v40);
  v13 = v40;
  v40 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v41;
  v41 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      v14 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v14 -= 2;
  }
  WTF::JSONImpl::Object::create(v14);
  v15 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::StringImpl *)v47[0];
  WTF::JSONImpl::ObjectBase::setInteger(v15, &v40, (WTF::JSONImpl::Value *)v38[0]);
  v16 = v40;
  v40 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v41;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v40 = (WTF::StringImpl *)v47[0];
  Inspector::toJSONObjectArray((Inspector *)a4, (uint64_t *)&v38[1]);
  v18 = *(_QWORD *)&v38[1];
  *(_QWORD *)&v38[1] = 0;
  v39 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v40, (uint64_t *)&v39, (uint64_t)v47);
  if (v48)
  {
    v19 = (uint64_t *)((char *)v17 + 24);
    v20 = *((unsigned int *)v17 + 9);
    if ((_DWORD)v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v40);
    }
    else
    {
      v21 = *v19;
      v22 = v40;
      if (v40)
        *(_DWORD *)v40 += 2;
      *(_QWORD *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  v23 = v39;
  v39 = 0;
  if (v23)
  {
    if (*v23 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v23;
  }
  v24 = *(_DWORD **)&v38[1];
  *(_QWORD *)&v38[1] = 0;
  if (v24)
  {
    if (*v24 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v24;
  }
  v25 = v40;
  v40 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v25 -= 2;
  }
  v26 = v42;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (uint64_t)v41;
  v40 = (WTF::StringImpl *)v47[0];
  v41 = 0;
  v39 = (_DWORD *)v27;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v26 + 2, &v40, (uint64_t *)&v39, (uint64_t)v47);
  if (v48)
  {
    v28 = (uint64_t *)((char *)v26 + 24);
    v29 = *((unsigned int *)v26 + 9);
    if ((_DWORD)v29 == *((_DWORD *)v26 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v28, (unint64_t)&v40);
    }
    else
    {
      v30 = *v28;
      v31 = v40;
      if (v40)
        *(_DWORD *)v40 += 2;
      *(_QWORD *)(v30 + 8 * v29) = v31;
      *((_DWORD *)v26 + 9) = v29 + 1;
    }
  }
  v32 = v39;
  v39 = 0;
  if (v32)
  {
    if (*v32 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v32;
  }
  v33 = v40;
  v40 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v33 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v42);
  Inspector::FrontendRouter::sendEvent(v37, (const WTF::String *)v47);
  v34 = (_DWORD *)v47[0];
  v47[0] = 0;
  if (v34)
  {
    if (*v34 == 2)
      WTF::StringImpl::destroy();
    else
      *v34 -= 2;
  }
  v35 = v41;
  v41 = 0;
  if (v35)
  {
    if (*(_DWORD *)v35 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v35;
  }
  v36 = v42;
  v42 = 0;
  if (v36)
  {
    if (*(_DWORD *)v36 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v36;
  }
}

- (void)attributeModifiedWithNodeId:(int)a3 name:(id)a4 value:(id)a5
{
  WTF::JSONImpl::Value *v7;
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

  v7 = *(WTF::JSONImpl::Value **)&a3;
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("name"));
    if (a5)
      goto LABEL_3;
  }
  v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("value"));
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
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v32, v7);
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

- (void)attributeRemovedWithNodeId:(int)a3 name:(id)a4
{
  WTF::JSONImpl::Value *v5;
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::ObjectBase *v10;
  WTF::StringImpl *v11;
  WTF::JSONImpl::ObjectBase *v12;
  _DWORD *v13;
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

  v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (!a4)
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("name"));
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
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v27, v5);
  v11 = v27;
  v27 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::StringImpl *)v30[0];
  MEMORY[0x2207574E0](v30, a4);
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v27, (const WTF::String *)v30);
  v13 = (_DWORD *)v30[0];
  v30[0] = 0;
  if (v13)
  {
    if (*v13 == 2)
      WTF::StringImpl::destroy();
    else
      *v13 -= 2;
  }
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

- (void)inlineStyleInvalidatedWithNodeIds:(id)a3
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
  _DWORD *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::Value *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  _DWORD *v23;
  WTF::StringImpl *v24;
  _DWORD *v25;
  WTF::JSONImpl::Object *v26;
  WTF::JSONImpl::Value *v27;
  _DWORD *v28;
  _DWORD *v29;
  WTF::StringImpl *v30;
  WTF::JSONImpl::Object *v31;
  WTF::JSONImpl::Value *v32;
  _QWORD v33[2];
  char v34;

  v4 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v5 = v4;
  if (!a3)
    v4 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("nodeIds"));
  WTF::JSONImpl::Object::create(v4);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v31 = (WTF::JSONImpl::Object *)v33[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = (WTF::StringImpl *)v33[0];
  WTF::JSONImpl::ObjectBase::setString(v32, (const WTF::String *)&v31, (const WTF::String *)&v30);
  v6 = v30;
  v30 = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v6 -= 2;
  }
  v7 = v31;
  v31 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      v7 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  WTF::JSONImpl::Object::create(v7);
  v8 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = (WTF::StringImpl *)v33[0];
  Inspector::toJSONIntegerArray((Inspector *)a3, (uint64_t *)&v28);
  v9 = (uint64_t)v28;
  v28 = 0;
  v29 = (_DWORD *)v9;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v8 + 2, &v30, (uint64_t *)&v29, (uint64_t)v33);
  if (v34)
  {
    v10 = (uint64_t *)((char *)v8 + 24);
    v11 = *((unsigned int *)v8 + 9);
    if ((_DWORD)v11 == *((_DWORD *)v8 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v10, (unint64_t)&v30);
    }
    else
    {
      v12 = *v10;
      v13 = v30;
      if (v30)
        *(_DWORD *)v30 += 2;
      *(_QWORD *)(v12 + 8 * v11) = v13;
      *((_DWORD *)v8 + 9) = v11 + 1;
    }
  }
  v14 = v29;
  v29 = 0;
  if (v14)
  {
    if (*v14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v14;
  }
  v15 = v28;
  v28 = 0;
  if (v15)
  {
    if (*v15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v15;
  }
  v16 = v30;
  v30 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v32;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = (uint64_t)v31;
  v30 = (WTF::StringImpl *)v33[0];
  v31 = 0;
  v29 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v30, (uint64_t *)&v29, (uint64_t)v33);
  if (v34)
  {
    v19 = (uint64_t *)((char *)v17 + 24);
    v20 = *((unsigned int *)v17 + 9);
    if ((_DWORD)v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v30);
    }
    else
    {
      v21 = *v19;
      v22 = v30;
      if (v30)
        *(_DWORD *)v30 += 2;
      *(_QWORD *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  v23 = v29;
  v29 = 0;
  if (v23)
  {
    if (*v23 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v23;
  }
  v24 = v30;
  v30 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v24 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v32);
  Inspector::FrontendRouter::sendEvent(v5, (const WTF::String *)v33);
  v25 = (_DWORD *)v33[0];
  v33[0] = 0;
  if (v25)
  {
    if (*v25 == 2)
      WTF::StringImpl::destroy();
    else
      *v25 -= 2;
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
  v27 = v32;
  v32 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v27;
  }
}

- (void)characterDataModifiedWithNodeId:(int)a3 characterData:(id)a4
{
  WTF::JSONImpl::Value *v5;
  WTF::JSONImpl::Object *v6;
  Inspector::FrontendRouter *v7;
  WTF::StringImpl *v8;
  WTF::JSONImpl::Object *v9;
  WTF::JSONImpl::ObjectBase *v10;
  WTF::StringImpl *v11;
  WTF::JSONImpl::ObjectBase *v12;
  _DWORD *v13;
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

  v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (!a4)
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("characterData"));
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
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v27, v5);
  v11 = v27;
  v27 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v28;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (WTF::StringImpl *)v30[0];
  MEMORY[0x2207574E0](v30, a4);
  WTF::JSONImpl::ObjectBase::setString(v12, (const WTF::String *)&v27, (const WTF::String *)v30);
  v13 = (_DWORD *)v30[0];
  v30[0] = 0;
  if (v13)
  {
    if (*v13 == 2)
      WTF::StringImpl::destroy();
    else
      *v13 -= 2;
  }
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

- (void)childNodeCountUpdatedWithNodeId:(int)a3 childNodeCount:(int)a4
{
  WTF::JSONImpl::Value *v4;
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

  v4 = *(WTF::JSONImpl::Value **)&a4;
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
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::StringImpl *)v28[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v25, v4);
  v12 = v25;
  v25 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
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

- (void)childNodeInsertedWithParentNodeId:(int)a3 previousNodeId:(int)a4 node:(id)a5
{
  WTF::JSONImpl::Value *v6;
  WTF::JSONImpl::Value *v7;
  WTF::JSONImpl::Object *v8;
  Inspector::FrontendRouter *v9;
  WTF::StringImpl *v10;
  WTF::JSONImpl::Object *v11;
  WTF::JSONImpl::ObjectBase *v12;
  WTF::StringImpl *v13;
  WTF::JSONImpl::ObjectBase *v14;
  WTF::StringImpl *v15;
  WTF::JSONImpl::Object *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  WTF::StringImpl *v21;
  _DWORD *v22;
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
  uint64_t v35;
  _DWORD *v36;
  WTF::StringImpl *v37;
  WTF::JSONImpl::Object *v38;
  WTF::JSONImpl::Value *v39;
  _QWORD v40[2];
  char v41;

  v6 = *(WTF::JSONImpl::Value **)&a4;
  v7 = *(WTF::JSONImpl::Value **)&a3;
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v9 = v8;
  if (!a5)
    v8 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("node"));
  WTF::JSONImpl::Object::create(v8);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v38 = (WTF::JSONImpl::Object *)v40[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  WTF::JSONImpl::ObjectBase::setString(v39, (const WTF::String *)&v38, (const WTF::String *)&v37);
  v10 = v37;
  v37 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v38;
  v38 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      v11 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  WTF::JSONImpl::Object::create(v11);
  v12 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  WTF::JSONImpl::ObjectBase::setInteger(v12, &v37, v7);
  v13 = v37;
  v37 = 0;
  if (v13)
  {
    if (*(_DWORD *)v13 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v13 -= 2;
  }
  v14 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  WTF::JSONImpl::ObjectBase::setInteger(v14, &v37, v6);
  v15 = v37;
  v37 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v38;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (WTF::StringImpl *)v40[0];
  if (a5)
  {
    objc_msgSend(a5, "toJSONObject");
    v17 = v35;
  }
  else
  {
    v17 = 0;
  }
  v36 = (_DWORD *)v17;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v16 + 2, &v37, (uint64_t *)&v36, (uint64_t)v40);
  if (v41)
  {
    v18 = (uint64_t *)((char *)v16 + 24);
    v19 = *((unsigned int *)v16 + 9);
    if ((_DWORD)v19 == *((_DWORD *)v16 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v18, (unint64_t)&v37);
    }
    else
    {
      v20 = *v18;
      v21 = v37;
      if (v37)
        *(_DWORD *)v37 += 2;
      *(_QWORD *)(v20 + 8 * v19) = v21;
      *((_DWORD *)v16 + 9) = v19 + 1;
    }
  }
  v22 = v36;
  v36 = 0;
  if (v22)
  {
    if (*v22 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v22;
  }
  v23 = v37;
  v37 = 0;
  if (v23)
  {
    if (*(_DWORD *)v23 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v23 -= 2;
  }
  v24 = v39;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (uint64_t)v38;
  v37 = (WTF::StringImpl *)v40[0];
  v38 = 0;
  v36 = (_DWORD *)v25;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v24 + 2, &v37, (uint64_t *)&v36, (uint64_t)v40);
  if (v41)
  {
    v26 = (uint64_t *)((char *)v24 + 24);
    v27 = *((unsigned int *)v24 + 9);
    if ((_DWORD)v27 == *((_DWORD *)v24 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v26, (unint64_t)&v37);
    }
    else
    {
      v28 = *v26;
      v29 = v37;
      if (v37)
        *(_DWORD *)v37 += 2;
      *(_QWORD *)(v28 + 8 * v27) = v29;
      *((_DWORD *)v24 + 9) = v27 + 1;
    }
  }
  v30 = v36;
  v36 = 0;
  if (v30)
  {
    if (*v30 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v30;
  }
  v31 = v37;
  v37 = 0;
  if (v31)
  {
    if (*(_DWORD *)v31 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v31 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v39);
  Inspector::FrontendRouter::sendEvent(v9, (const WTF::String *)v40);
  v32 = (_DWORD *)v40[0];
  v40[0] = 0;
  if (v32)
  {
    if (*v32 == 2)
      WTF::StringImpl::destroy();
    else
      *v32 -= 2;
  }
  v33 = v38;
  v38 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v33;
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
}

- (void)childNodeRemovedWithParentNodeId:(int)a3 nodeId:(int)a4
{
  WTF::JSONImpl::Value *v4;
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

  v4 = *(WTF::JSONImpl::Value **)&a4;
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
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::StringImpl *)v28[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v25, v4);
  v12 = v25;
  v25 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
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

- (void)willDestroyDOMNodeWithNodeId:(int)a3
{
  WTF::JSONImpl::Value *v3;
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

  v3 = *(WTF::JSONImpl::Value **)&a3;
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
  WTF::JSONImpl::ObjectBase::setInteger(v7, &v21, v3);
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

- (void)shadowRootPushedWithHostId:(int)a3 root:(id)a4
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
  uint64_t v31;
  _DWORD *v32;
  WTF::StringImpl *v33;
  WTF::JSONImpl::Object *v34;
  WTF::JSONImpl::Value *v35;
  _QWORD v36[2];
  char v37;

  v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (!a4)
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("root"));
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::JSONImpl::Object *)v36[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setString(v35, (const WTF::String *)&v34, (const WTF::String *)&v33);
  v8 = v33;
  v33 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v34;
  v34 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      v9 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v9 -= 2;
  }
  WTF::JSONImpl::Object::create(v9);
  v10 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v33, v5);
  v11 = v33;
  v33 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  if (a4)
  {
    objc_msgSend(a4, "toJSONObject");
    v13 = v31;
  }
  else
  {
    v13 = 0;
  }
  v32 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v33, (uint64_t *)&v32, (uint64_t)v36);
  if (v37)
  {
    v14 = (uint64_t *)((char *)v12 + 24);
    v15 = *((unsigned int *)v12 + 9);
    if ((_DWORD)v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v33);
    }
    else
    {
      v16 = *v14;
      v17 = v33;
      if (v33)
        *(_DWORD *)v33 += 2;
      *(_QWORD *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  v18 = v32;
  v32 = 0;
  if (v18)
  {
    if (*v18 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v18;
  }
  v19 = v33;
  v33 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (uint64_t)v34;
  v33 = (WTF::StringImpl *)v36[0];
  v34 = 0;
  v32 = (_DWORD *)v21;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v20 + 2, &v33, (uint64_t *)&v32, (uint64_t)v36);
  if (v37)
  {
    v22 = (uint64_t *)((char *)v20 + 24);
    v23 = *((unsigned int *)v20 + 9);
    if ((_DWORD)v23 == *((_DWORD *)v20 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v22, (unint64_t)&v33);
    }
    else
    {
      v24 = *v22;
      v25 = v33;
      if (v33)
        *(_DWORD *)v33 += 2;
      *(_QWORD *)(v24 + 8 * v23) = v25;
      *((_DWORD *)v20 + 9) = v23 + 1;
    }
  }
  v26 = v32;
  v32 = 0;
  if (v26)
  {
    if (*v26 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v26;
  }
  v27 = v33;
  v33 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v27 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v35);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v36);
  v28 = (_DWORD *)v36[0];
  v36[0] = 0;
  if (v28)
  {
    if (*v28 == 2)
      WTF::StringImpl::destroy();
    else
      *v28 -= 2;
  }
  v29 = v34;
  v34 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v29;
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
}

- (void)shadowRootPoppedWithHostId:(int)a3 rootId:(int)a4
{
  WTF::JSONImpl::Value *v4;
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

  v4 = *(WTF::JSONImpl::Value **)&a4;
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
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::StringImpl *)v28[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v25, v4);
  v12 = v25;
  v25 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
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

- (void)customElementStateChangedWithNodeId:(int)a3 customElementState:(int64_t)a4
{
  WTF::JSONImpl::Value *v5;
  WTF::JSONImpl::Object *v6;
  WTF::StringImpl *v7;
  WTF::JSONImpl::Object *v8;
  WTF::JSONImpl::ObjectBase *v9;
  WTF::StringImpl *v10;
  WTF::StringImpl *v11;
  _QWORD v12[2];
  WTF::StringImpl *v13;

  v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v12[0] = v13;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v11 = v13;
  WTF::JSONImpl::ObjectBase::setString((WTF::JSONImpl::ObjectBase *)v12[1], (const WTF::String *)v12, (const WTF::String *)&v11);
  v7 = v11;
  v11 = 0;
  if (v7)
  {
    if (*(_DWORD *)v7 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v7 -= 2;
  }
  v8 = (WTF::JSONImpl::Object *)v12[0];
  v12[0] = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      v8 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  WTF::JSONImpl::Object::create(v8);
  v9 = (WTF::JSONImpl::ObjectBase *)v12[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v11 = v13;
  WTF::JSONImpl::ObjectBase::setInteger(v9, &v11, v5);
  v10 = v11;
  v11 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v11 = v13;
  __asm { BR              X9 }
}

- (void)pseudoElementAddedWithParentId:(int)a3 pseudoElement:(id)a4
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
  uint64_t v31;
  _DWORD *v32;
  WTF::StringImpl *v33;
  WTF::JSONImpl::Object *v34;
  WTF::JSONImpl::Value *v35;
  _QWORD v36[2];
  char v37;

  v5 = *(WTF::JSONImpl::Value **)&a3;
  v6 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  v7 = v6;
  if (!a4)
    v6 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("pseudoElement"));
  WTF::JSONImpl::Object::create(v6);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v34 = (WTF::JSONImpl::Object *)v36[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setString(v35, (const WTF::String *)&v34, (const WTF::String *)&v33);
  v8 = v33;
  v33 = 0;
  if (v8)
  {
    if (*(_DWORD *)v8 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v8 -= 2;
  }
  v9 = v34;
  v34 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      v9 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v9 -= 2;
  }
  WTF::JSONImpl::Object::create(v9);
  v10 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  WTF::JSONImpl::ObjectBase::setInteger(v10, &v33, v5);
  v11 = v33;
  v33 = 0;
  if (v11)
  {
    if (*(_DWORD *)v11 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v11 -= 2;
  }
  v12 = v34;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v33 = (WTF::StringImpl *)v36[0];
  if (a4)
  {
    objc_msgSend(a4, "toJSONObject");
    v13 = v31;
  }
  else
  {
    v13 = 0;
  }
  v32 = (_DWORD *)v13;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v12 + 2, &v33, (uint64_t *)&v32, (uint64_t)v36);
  if (v37)
  {
    v14 = (uint64_t *)((char *)v12 + 24);
    v15 = *((unsigned int *)v12 + 9);
    if ((_DWORD)v15 == *((_DWORD *)v12 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v14, (unint64_t)&v33);
    }
    else
    {
      v16 = *v14;
      v17 = v33;
      if (v33)
        *(_DWORD *)v33 += 2;
      *(_QWORD *)(v16 + 8 * v15) = v17;
      *((_DWORD *)v12 + 9) = v15 + 1;
    }
  }
  v18 = v32;
  v32 = 0;
  if (v18)
  {
    if (*v18 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v18;
  }
  v19 = v33;
  v33 = 0;
  if (v19)
  {
    if (*(_DWORD *)v19 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v19 -= 2;
  }
  v20 = v35;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v21 = (uint64_t)v34;
  v33 = (WTF::StringImpl *)v36[0];
  v34 = 0;
  v32 = (_DWORD *)v21;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v20 + 2, &v33, (uint64_t *)&v32, (uint64_t)v36);
  if (v37)
  {
    v22 = (uint64_t *)((char *)v20 + 24);
    v23 = *((unsigned int *)v20 + 9);
    if ((_DWORD)v23 == *((_DWORD *)v20 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v22, (unint64_t)&v33);
    }
    else
    {
      v24 = *v22;
      v25 = v33;
      if (v33)
        *(_DWORD *)v33 += 2;
      *(_QWORD *)(v24 + 8 * v23) = v25;
      *((_DWORD *)v20 + 9) = v23 + 1;
    }
  }
  v26 = v32;
  v32 = 0;
  if (v26)
  {
    if (*v26 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v26;
  }
  v27 = v33;
  v33 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v27 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v35);
  Inspector::FrontendRouter::sendEvent(v7, (const WTF::String *)v36);
  v28 = (_DWORD *)v36[0];
  v36[0] = 0;
  if (v28)
  {
    if (*v28 == 2)
      WTF::StringImpl::destroy();
    else
      *v28 -= 2;
  }
  v29 = v34;
  v34 = 0;
  if (v29)
  {
    if (*(_DWORD *)v29 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v29;
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
}

- (void)pseudoElementRemovedWithParentId:(int)a3 pseudoElementId:(int)a4
{
  WTF::JSONImpl::Value *v4;
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

  v4 = *(WTF::JSONImpl::Value **)&a4;
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
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  v11 = v26;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v25 = (WTF::StringImpl *)v28[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v25, v4);
  v12 = v25;
  v25 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
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

- (void)didAddEventListenerWithNodeId:(int)a3
{
  WTF::JSONImpl::Value *v3;
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

  v3 = *(WTF::JSONImpl::Value **)&a3;
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
  WTF::JSONImpl::ObjectBase::setInteger(v7, &v21, v3);
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

- (void)willRemoveEventListenerWithNodeId:(int)a3
{
  WTF::JSONImpl::Value *v3;
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

  v3 = *(WTF::JSONImpl::Value **)&a3;
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
  WTF::JSONImpl::ObjectBase::setInteger(v7, &v21, v3);
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

- (void)didFireEventWithNodeId:(int)a3 eventName:(id)a4 timestamp:(double)a5 data:(id *)a6
{
  WTF::JSONImpl::Value *v9;
  WTF::JSONImpl::Object *v10;
  Inspector::FrontendRouter *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::Object *v13;
  WTF::JSONImpl::ObjectBase *v14;
  WTF::StringImpl *v15;
  WTF::JSONImpl::ObjectBase *v16;
  _DWORD *v17;
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

  v9 = *(WTF::JSONImpl::Value **)&a3;
  v10 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                  + 4))(self->_controller, a2);
  v11 = v10;
  if (!a4)
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("eventName"));
  if (a6 && !*a6)
    v10 = (WTF::JSONImpl::Object *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("optional parameter '%@' cannot be nil"), CFSTR("data"));
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
  WTF::JSONImpl::ObjectBase::setInteger(v14, &v42, v9);
  v15 = v42;
  v42 = 0;
  if (v15)
  {
    if (*(_DWORD *)v15 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v15 -= 2;
  }
  v16 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::StringImpl *)v45[0];
  MEMORY[0x2207574E0](v45, a4);
  WTF::JSONImpl::ObjectBase::setString(v16, (const WTF::String *)&v42, (const WTF::String *)v45);
  v17 = (_DWORD *)v45[0];
  v45[0] = 0;
  if (v17)
  {
    if (*v17 == 2)
      WTF::StringImpl::destroy();
    else
      *v17 -= 2;
  }
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
  if (!v20)
  {
LABEL_29:
    if (!a6)
      goto LABEL_49;
    goto LABEL_32;
  }
  if (*(_DWORD *)v20 != 2)
  {
    *(_DWORD *)v20 -= 2;
    goto LABEL_29;
  }
  WTF::StringImpl::destroy();
  if (!a6)
    goto LABEL_49;
LABEL_32:
  v21 = v43;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v42 = (WTF::StringImpl *)v45[0];
  if (*a6)
  {
    objc_msgSend(*a6, "toJSONObject");
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
LABEL_49:
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

- (void)powerEfficientPlaybackStateChangedWithNodeId:(int)a3 timestamp:(double)a4 isPowerEfficient:(BOOL)a5
{
  _BOOL8 v5;
  WTF::JSONImpl::Value *v7;
  WTF::JSONImpl::Object *v8;
  WTF::StringImpl *v9;
  WTF::JSONImpl::Object *v10;
  WTF::JSONImpl::ObjectBase *v11;
  WTF::StringImpl *v12;
  WTF::JSONImpl::ObjectBase *v13;
  WTF::StringImpl *v14;
  WTF::JSONImpl::ObjectBase *v15;
  WTF::StringImpl *v16;
  WTF::JSONImpl::Value *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  WTF::StringImpl *v22;
  _DWORD *v23;
  WTF::StringImpl *v24;
  _DWORD *v25;
  WTF::JSONImpl::Object *v26;
  WTF::JSONImpl::Value *v27;
  _DWORD *v28;
  WTF::StringImpl *v29;
  WTF::JSONImpl::Object *v30;
  WTF::JSONImpl::Value *v31;
  _QWORD v32[2];
  char v33;

  v5 = a5;
  v7 = *(WTF::JSONImpl::Value **)&a3;
  v8 = (WTF::JSONImpl::Object *)(*((uint64_t (**)(AugmentableInspectorController *, SEL))self->_controller->var0
                                 + 4))(self->_controller, a2);
  WTF::JSONImpl::Object::create(v8);
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v30 = (WTF::JSONImpl::Object *)v32[0];
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::StringImpl *)v32[0];
  WTF::JSONImpl::ObjectBase::setString(v31, (const WTF::String *)&v30, (const WTF::String *)&v29);
  v9 = v29;
  v29 = 0;
  if (v9)
  {
    if (*(_DWORD *)v9 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v9 -= 2;
  }
  v10 = v30;
  v30 = 0;
  if (v10)
  {
    if (*(_DWORD *)v10 == 2)
      v10 = (WTF::JSONImpl::Object *)WTF::StringImpl::destroy();
    else
      *(_DWORD *)v10 -= 2;
  }
  WTF::JSONImpl::Object::create(v10);
  v11 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::StringImpl *)v32[0];
  WTF::JSONImpl::ObjectBase::setInteger(v11, &v29, v7);
  v12 = v29;
  v29 = 0;
  if (v12)
  {
    if (*(_DWORD *)v12 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v12 -= 2;
  }
  v13 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::StringImpl *)v32[0];
  WTF::JSONImpl::ObjectBase::setDouble(v13, &v29, a4);
  v14 = v29;
  v29 = 0;
  if (v14)
  {
    if (*(_DWORD *)v14 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v14 -= 2;
  }
  v15 = v30;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v29 = (WTF::StringImpl *)v32[0];
  WTF::JSONImpl::ObjectBase::setBoolean(v15, &v29, (WTF::JSONImpl::Value *)v5);
  v16 = v29;
  v29 = 0;
  if (v16)
  {
    if (*(_DWORD *)v16 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v16 -= 2;
  }
  v17 = v31;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = (uint64_t)v30;
  v29 = (WTF::StringImpl *)v32[0];
  v30 = 0;
  v28 = (_DWORD *)v18;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v17 + 2, &v29, (uint64_t *)&v28, (uint64_t)v32);
  if (v33)
  {
    v19 = (uint64_t *)((char *)v17 + 24);
    v20 = *((unsigned int *)v17 + 9);
    if ((_DWORD)v20 == *((_DWORD *)v17 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v19, (unint64_t)&v29);
    }
    else
    {
      v21 = *v19;
      v22 = v29;
      if (v29)
        *(_DWORD *)v29 += 2;
      *(_QWORD *)(v21 + 8 * v20) = v22;
      *((_DWORD *)v17 + 9) = v20 + 1;
    }
  }
  v23 = v28;
  v28 = 0;
  if (v23)
  {
    if (*v23 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v23;
  }
  v24 = v29;
  v29 = 0;
  if (v24)
  {
    if (*(_DWORD *)v24 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v24 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v31);
  Inspector::FrontendRouter::sendEvent(v8, (const WTF::String *)v32);
  v25 = (_DWORD *)v32[0];
  v32[0] = 0;
  if (v25)
  {
    if (*v25 == 2)
      WTF::StringImpl::destroy();
    else
      *v25 -= 2;
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
  v27 = v31;
  v31 = 0;
  if (v27)
  {
    if (*(_DWORD *)v27 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)v27;
  }
}

@end
