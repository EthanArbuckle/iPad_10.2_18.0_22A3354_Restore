@implementation PLXPCResponderOperatorComposition

void __101__PLXPCResponderOperatorComposition_respondToRequestForClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "operatorBlock");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(__int16 *)(a1 + 72), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_autoreleasePoolPop(v2);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (id)respondToRequestForClientID:(signed __int16)a3 withProcessName:(id)a4 withKey:(id)a5 withPayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v19[5];
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  signed __int16 v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1;
  v29 = __Block_byref_object_dispose__1;
  v30 = 0;
  -[PLXPCResponderOperatorComposition workQueue](self, "workQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __101__PLXPCResponderOperatorComposition_respondToRequestForClientID_withProcessName_withKey_withPayload___block_invoke;
  v19[3] = &unk_1E6A522E0;
  v22 = v12;
  v23 = &v25;
  v24 = a3;
  v19[4] = self;
  v20 = v10;
  v21 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(v13, v19);

  v17 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v17;
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (PLXPCResponderOperatorComposition)initWithOperator:(id)a3 withRegistration:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  PLXPCResponderOperatorComposition *v12;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  objc_msgSend(v8, "workQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PLXPCResponderOperatorComposition initWithWorkQueue:withRegistration:withBlock:](self, "initWithWorkQueue:withRegistration:withBlock:", v11, v10, v9);

  if (v12)
    objc_storeWeak((id *)&v12->_operator, v8);

  return v12;
}

- (PLXPCResponderOperatorComposition)initWithWorkQueue:(id)a3 withRegistration:(id)a4 withBlock:(id)a5
{
  id v9;
  id v10;
  id v11;
  PLXPCResponderOperatorComposition *v12;
  PLXPCResponderOperatorComposition *v13;
  uint64_t v14;
  id operatorBlock;
  void *v16;
  objc_super v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PLXPCResponderOperatorComposition;
  v12 = -[PLXPCResponderOperatorComposition init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_workQueue, a3);
    v14 = MEMORY[0x1BCC9EB70](v11);
    operatorBlock = v13->_operatorBlock;
    v13->_operatorBlock = (id)v14;

    objc_storeStrong((id *)&v13->_registration, a4);
    v19[0] = CFSTR("type");
    v19[1] = CFSTR("registration");
    v20[0] = CFSTR("Query");
    v20[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", CFSTR("register.PLXPCService"), v13, v16);

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PLXPCResponderOperatorComposition operator](self, "operator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLXPCResponderOperatorComposition registration](self, "registration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E6A56538);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), &stru_1E6A56538);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PLXPCResponderOperatorComposition(%@-%@): %p>"), v5, v9, self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSDictionary)registration
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setOperatorBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (PLOperator)operator
{
  return (PLOperator *)objc_loadWeakRetained((id *)&self->_operator);
}

- (void)setOperator:(id)a3
{
  objc_storeWeak((id *)&self->_operator, a3);
}

- (void)setWorkQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

@end
