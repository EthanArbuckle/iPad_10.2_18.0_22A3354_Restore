@implementation PKXPCForwarder

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
}

- (_QWORD)_initWithTarget:(uint64_t)a3 targetClass:
{
  _QWORD *result;
  void *v6;
  id v7;
  objc_super v8;

  result = a2;
  v6 = result;
  if (!a1)
    goto LABEL_5;
  if (a3)
  {
    v8.receiver = a1;
    v8.super_class = (Class)PKXPCForwarder;
    v7 = objc_msgSendSuper2(&v8, sel_init);
    a1 = v7;
    if (v7)
    {
      *((_DWORD *)v7 + 2) = 0;
      objc_storeWeak((id *)v7 + 2, v6);
      a1[3] = a3;
    }
LABEL_5:

    return a1;
  }
  __break(1u);
  return result;
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained(&self->_target);
  os_unfair_lock_unlock(p_lock);
  return WeakRetained;
}

- (PKXPCForwarder)init
{

  return 0;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  id WeakRetained;
  uint64_t v7;
  objc_method *InstanceMethod;
  objc_method_description *Description;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PKXPCForwarder;
  -[PKXPCForwarder methodSignatureForSelector:](&v11, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    os_unfair_lock_lock(&self->_lock);
    WeakRetained = objc_loadWeakRetained(&self->_target);
    os_unfair_lock_unlock(&self->_lock);
    if (WeakRetained)
    {
      objc_msgSend(WeakRetained, "methodSignatureForSelector:", a3);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      InstanceMethod = class_getInstanceMethod(self->_targetClass, a3);
      if (!InstanceMethod || (Description = method_getDescription(InstanceMethod)) == 0)
      {
        v5 = 0;
        goto LABEL_9;
      }
      objc_msgSend(MEMORY[0x1E0C99DD8], "signatureWithObjCTypes:", Description->types);
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v7;
LABEL_9:

  }
  return v5;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  id WeakRetained;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained(&self->_target);
  os_unfair_lock_unlock(&self->_lock);
  if (WeakRetained)
  {
    objc_msgSend(v4, "invokeWithTarget:", WeakRetained);
  }
  else
  {
    PKLogFacilityTypeGetObject(4uLL);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromClass(self->_targetClass);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector((SEL)objc_msgSend(v4, "selector"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v8;
      _os_log_impl(&dword_18FC92000, v6, OS_LOG_TYPE_DEFAULT, "PKXPCForwarder: dropping -[%{public}@ %@].", (uint8_t *)&v9, 0x16u);

    }
    objc_msgSend(v4, "setTarget:", 0);
    objc_msgSend(v4, "invoke");
  }

}

@end
