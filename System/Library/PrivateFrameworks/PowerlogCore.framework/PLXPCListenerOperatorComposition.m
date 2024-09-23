@implementation PLXPCListenerOperatorComposition

void __99__PLXPCListenerOperatorComposition_messageRecievedForClientID_withProcessName_withKey_withPayload___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD);

  v2 = (void *)MEMORY[0x1BCC9E9B4]();
  objc_msgSend(*(id *)(a1 + 32), "operatorBlock");
  v3 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3[2](v3, *(__int16 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  objc_autoreleasePoolPop(v2);
}

- (id)operatorBlock
{
  return self->_operatorBlock;
}

- (void)messageRecievedForClientID:(signed __int16)a3 withProcessName:(id)a4 withKey:(id)a5 withPayload:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  signed __int16 v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[PLXPCListenerOperatorComposition operator](self, "operator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "workQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __99__PLXPCListenerOperatorComposition_messageRecievedForClientID_withProcessName_withKey_withPayload___block_invoke;
  block[3] = &unk_1E6A55A58;
  v22 = a3;
  block[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  dispatch_async(v14, block);

}

- (PLOperator)operator
{
  return (PLOperator *)objc_loadWeakRetained((id *)&self->_operator);
}

- (PLXPCListenerOperatorComposition)initWithOperator:(id)a3 withRegistration:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLXPCListenerOperatorComposition *v11;
  PLXPCListenerOperatorComposition *v12;
  uint64_t v13;
  id operatorBlock;
  void *v15;
  objc_super v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)PLXPCListenerOperatorComposition;
  v11 = -[PLXPCListenerOperatorComposition init](&v17, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_operator, v8);
    v13 = MEMORY[0x1BCC9EB70](v10);
    operatorBlock = v12->_operatorBlock;
    v12->_operatorBlock = (id)v13;

    objc_storeStrong((id *)&v12->_registration, a4);
    v18[0] = CFSTR("type");
    v18[1] = CFSTR("registration");
    v19[0] = CFSTR("Post");
    v19[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLUtilities postNotificationName:object:userInfo:](PLUtilities, "postNotificationName:object:userInfo:", CFSTR("register.PLXPCService"), v12, v15);

  }
  return v12;
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
  -[PLXPCListenerOperatorComposition operator](self, "operator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "className");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLXPCListenerOperatorComposition registration](self, "registration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), &stru_1E6A56538);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\t"), &stru_1E6A56538);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<PLXPCListenerOperatorComposition(%@-%@): %p>"), v5, v9, self);
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

- (void)setOperator:(id)a3
{
  objc_storeWeak((id *)&self->_operator, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_operator);
  objc_storeStrong(&self->_operatorBlock, 0);
  objc_storeStrong((id *)&self->_registration, 0);
}

@end
