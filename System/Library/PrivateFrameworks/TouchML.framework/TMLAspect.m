@implementation TMLAspect

+ (id)aspectForRegistrationKey:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  TMLAspect *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  void *v21;
  const char *v22;
  double v23;
  id v24;
  const char *v25;
  double v26;
  _QWORD v28[4];
  id v29;
  id v30;
  id location;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(TMLAspect);
  objc_msgSend_setAdvice_(v12, v13, v14, v7);
  objc_msgSend_setBlock_(v12, v15, v16, v11);
  objc_msgSend_setSignalName_(v12, v17, v18, v10);
  objc_msgSend_shared(TMLAspectsRegistration, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerAspect_withKey_(v21, v22, v23, v12, v9);

  objc_initWeak(&location, v12);
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_22AD278D0;
  v28[3] = &unk_24F4FDD48;
  objc_copyWeak(&v30, &location);
  v24 = v9;
  v29 = v24;
  objc_msgSend_setUnregisterBlock_(v12, v25, v26, v28);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);

  return v12;
}

+ (id)aspectForObjectsImplementingProtocolNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v6;
  id v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v6 = *(_QWORD *)&a5;
  v9 = a6;
  v10 = a4;
  objc_msgSend_keyForProtocolNamed_signalName_advice_(TMLAspectsRegistration, v11, v12, a3, v10, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v14, v15, v16, v13, v10, v6, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)aspectForObjectsWithClassNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v6;
  id v9;
  id v10;
  const char *v11;
  double v12;
  void *v13;
  void *v14;
  const char *v15;
  double v16;
  void *v17;

  v6 = *(_QWORD *)&a5;
  v9 = a6;
  v10 = a4;
  objc_msgSend_keyForClassNamed_signalName_advice_(TMLAspectsRegistration, v11, v12, a3, v10, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_class();
  objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v14, v15, v16, v13, v10, v6, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)aspectForTarget:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5 block:(id)a6
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  TMLAspect *v12;
  const char *v13;
  double v14;
  const char *v15;
  double v16;
  const char *v17;
  double v18;
  const char *v19;
  double v20;
  const char *v21;
  double v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id from;
  id location;

  v7 = *(_QWORD *)&a5;
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = objc_alloc_init(TMLAspect);
  objc_msgSend_setAdvice_(v12, v13, v14, v7);
  objc_msgSend_setBlock_(v12, v15, v16, v11);
  objc_msgSend_setSignalName_(v12, v17, v18, v10);
  objc_msgSend_registerAspect_(v9, v19, v20, v12);
  objc_initWeak(&location, v9);
  objc_initWeak(&from, v12);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = sub_22AD27C00;
  v24[3] = &unk_24F4FDD70;
  objc_copyWeak(&v25, &location);
  objc_copyWeak(&v26, &from);
  objc_msgSend_setUnregisterBlock_(v12, v21, v22, v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

+ (id)jsConvertedBlock:(id)a3
{
  void *v3;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, a3);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = sub_22AD27D28;
  v5[3] = &unk_24F4FDD98;
  objc_copyWeak(&v6, &location);
  v3 = (void *)MEMORY[0x22E2E7E44](v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

+ (id)tmlAspectForObjectsImplementingProtocolNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5
{
  uint64_t v5;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  objc_msgSend_keyForProtocolNamed_signalName_advice_(TMLAspectsRegistration, v8, v9, a3, v7, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v11, v12, v13, v10, v7, v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_class();
  objc_msgSend_jsConvertedBlock_(v15, v16, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBlock_(v14, v19, v20, v18);

  return v14;
}

+ (id)tmlAspectForObjectsWithClassNamed:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5
{
  uint64_t v5;
  id v7;
  const char *v8;
  double v9;
  void *v10;
  void *v11;
  const char *v12;
  double v13;
  void *v14;
  void *v15;
  const char *v16;
  double v17;
  void *v18;
  const char *v19;
  double v20;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  objc_msgSend_keyForClassNamed_signalName_advice_(TMLAspectsRegistration, v8, v9, a3, v7, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend_aspectForRegistrationKey_signalOrMethodName_advice_block_(v11, v12, v13, v10, v7, v5, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_opt_class();
  objc_msgSend_jsConvertedBlock_(v15, v16, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBlock_(v14, v19, v20, v18);

  return v14;
}

+ (id)tmlAspectForTarget:(id)a3 signalOrMethodName:(id)a4 advice:(int)a5
{
  uint64_t v5;
  id v7;
  id v8;
  void *v9;
  const char *v10;
  double v11;
  void *v12;
  void *v13;
  const char *v14;
  double v15;
  void *v16;
  const char *v17;
  double v18;

  v5 = *(_QWORD *)&a5;
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_opt_class();
  objc_msgSend_aspectForTarget_signalOrMethodName_advice_block_(v9, v10, v11, v8, v7, v5, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_opt_class();
  objc_msgSend_jsConvertedBlock_(v13, v14, v15, v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setBlock_(v12, v17, v18, v16);

  return v12;
}

- (void)dealloc
{
  double v2;
  objc_super v4;

  objc_msgSend_unregister(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)TMLAspect;
  -[TMLAspect dealloc](&v4, sel_dealloc);
}

- (void)activateWithObject:(id)a3 arguments:(id)a4 returnValue:(id)a5 newArguments:(id *)a6 newReturnValue:(id *)a7
{
  id v12;
  id v13;
  const char *v14;
  double v15;
  void (**block)(id, id, void *, id, id, id *, id *);
  void *v17;
  id v18;

  v18 = a3;
  v12 = a4;
  v13 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    block = (void (**)(id, id, void *, id, id, id *, id *))self->_block;
    if (block)
    {
      objc_msgSend_currentContext(TMLContext, v14, v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      block[2](block, v18, v17, v12, v13, a6, a7);

    }
  }

}

- (void)unregister
{
  void (**unregisterBlock)(void);

  unregisterBlock = (void (**)(void))self->_unregisterBlock;
  if (unregisterBlock)
    unregisterBlock[2]();
}

- (NSObject)target
{
  return objc_loadWeakRetained((id *)&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak((id *)&self->_target, a3);
}

- (int)advice
{
  return self->_advice;
}

- (void)setAdvice:(int)a3
{
  self->_advice = a3;
}

- (NSString)signalName
{
  return self->_signalName;
}

- (void)setSignalName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)registrationKey
{
  return self->_registrationKey;
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)unregisterBlock
{
  return self->_unregisterBlock;
}

- (void)setUnregisterBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unregisterBlock, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_registrationKey, 0);
  objc_storeStrong((id *)&self->_signalName, 0);
  objc_destroyWeak((id *)&self->_target);
}

@end
