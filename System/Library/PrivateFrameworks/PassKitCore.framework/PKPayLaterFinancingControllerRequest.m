@implementation PKPayLaterFinancingControllerRequest

- (PKPayLaterFinancingControllerRequest)initWithTransactionAmount:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  PKPayLaterFinancingControllerRequest *v9;
  PKPayLaterFinancingControllerRequest *v10;
  NSMutableOrderedSet *v11;
  NSMutableOrderedSet *completions;
  NSMutableOrderedSet *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPayLaterFinancingControllerRequest;
  v9 = -[PKPayLaterFinancingControllerRequest init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_amount, a3);
    v11 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    completions = v10->_completions;
    v10->_completions = v11;

    v13 = v10->_completions;
    v14 = _Block_copy(v8);
    -[NSMutableOrderedSet pk_safelyAddObject:](v13, "pk_safelyAddObject:", v14);

  }
  return v10;
}

- (PKPayLaterFinancingControllerRequest)initWithTransactionAmount:(id)a3 optionIdentifierToCancel:(id)a4 authenticationState:(unint64_t)a5 stateMachineError:(id)a6 stateMachineCancelReason:(int64_t)a7 completion:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKPayLaterFinancingControllerRequest *v18;
  PKPayLaterFinancingControllerRequest *v19;
  NSMutableOrderedSet *v20;
  NSMutableOrderedSet *completions;
  NSMutableOrderedSet *v22;
  void *v23;
  id v25;
  objc_super v26;

  v25 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a8;
  v26.receiver = self;
  v26.super_class = (Class)PKPayLaterFinancingControllerRequest;
  v18 = -[PKPayLaterFinancingControllerRequest init](&v26, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_amount, a3);
    objc_storeStrong((id *)&v19->_optionIdentifierToCancel, a4);
    v19->_authenticationState = a5;
    objc_storeStrong((id *)&v19->_stateMachineError, a6);
    v19->_stateMachineCancelReason = a7;
    v20 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E0C99E10]);
    completions = v19->_completions;
    v19->_completions = v20;

    v22 = v19->_completions;
    v23 = _Block_copy(v17);
    -[NSMutableOrderedSet pk_safelyAddObject:](v22, "pk_safelyAddObject:", v23);

  }
  return v19;
}

- (BOOL)coalesceWithRequest:(id)a3
{
  id v4;
  NSDecimalNumber *v5;
  NSDecimalNumber *v6;
  NSDecimalNumber *amount;
  char v8;
  void *v9;
  NSString *optionIdentifierToCancel;
  NSString *v11;
  NSString *v12;
  BOOL v13;
  NSString *v14;
  BOOL v15;

  v4 = a3;
  objc_msgSend(v4, "amount");
  v5 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  amount = self->_amount;
  if (v5 && amount)
  {
    v8 = -[NSDecimalNumber isEqual:](v5, "isEqual:", self->_amount);

    if ((v8 & 1) == 0)
      goto LABEL_10;
LABEL_6:
    objc_msgSend(v4, "optionIdentifierToCancel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    optionIdentifierToCancel = self->_optionIdentifierToCancel;
    v11 = v9;
    v12 = optionIdentifierToCancel;
    v13 = v11 != v12;
    if (v11 == v12)
    {

    }
    else
    {
      v14 = v12;
      if (v11 && v12)
      {
        v15 = -[NSString isEqualToString:](v11, "isEqualToString:", v12);

        if (v15)
          goto LABEL_10;
      }
      else
      {

      }
      objc_msgSend(v4, "completions");
      v11 = (NSString *)objc_claimAutoreleasedReturnValue();
      -[PKPayLaterFinancingControllerRequest addCompletions:](self, "addCompletions:", v11);
    }

    goto LABEL_15;
  }

  if (v6 == amount)
    goto LABEL_6;
LABEL_10:
  v13 = 0;
LABEL_15:

  return v13;
}

- (void)addCompletions:(id)a3
{
  NSMutableOrderedSet *completions;
  id v4;

  completions = self->_completions;
  objc_msgSend(a3, "array");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet addObjectsFromArray:](completions, "addObjectsFromArray:", v4);

}

- (id)description
{
  id v3;
  const __CFString *v4;
  void *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  objc_msgSend(v3, "appendFormat:", CFSTR("amount: '%@'; "), self->_amount);
  if (self->_optionIdentifierToCancel)
    objc_msgSend(v3, "appendFormat:", CFSTR("optionIdentifierToCancel: '%@'; "), self->_optionIdentifierToCancel);
  v4 = CFSTR("error");
  switch(self->_authenticationState)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      v4 = CFSTR("success");
      goto LABEL_8;
    case 2uLL:
      v4 = CFSTR("cancel");
      goto LABEL_8;
    case 4uLL:
      v4 = CFSTR("startedAuthenticating");
      goto LABEL_8;
    case 5uLL:
      v4 = CFSTR("readyToAuthenticate");
      goto LABEL_8;
    default:
LABEL_8:
      objc_msgSend(v3, "appendFormat:", CFSTR("authenticationState: '%@'; "), v4);
LABEL_9:
      if (self->_stateMachineError)
        objc_msgSend(v3, "appendFormat:", CFSTR("stateMachineError: '%@'; "), self->_stateMachineError);
      PKPaymentAuthorizationStateMachineCancelReasonToString(self->_stateMachineCancelReason);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendFormat:", CFSTR("stateMachineCancelReason: '%@'; "), v5);

      objc_msgSend(v3, "appendFormat:", CFSTR("completionCount: '%ld'; "),
        -[NSMutableOrderedSet count](self->_completions, "count"));
      objc_msgSend(v3, "appendFormat:", CFSTR(">"));
      return v3;
  }
}

- (NSDecimalNumber)amount
{
  return self->_amount;
}

- (NSString)optionIdentifierToCancel
{
  return self->_optionIdentifierToCancel;
}

- (unint64_t)authenticationState
{
  return self->_authenticationState;
}

- (NSError)stateMachineError
{
  return self->_stateMachineError;
}

- (int64_t)stateMachineCancelReason
{
  return self->_stateMachineCancelReason;
}

- (NSOrderedSet)completions
{
  return &self->_completions->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMachineError, 0);
  objc_storeStrong((id *)&self->_optionIdentifierToCancel, 0);
  objc_storeStrong((id *)&self->_amount, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
