@implementation PKRunningBoardProvider

- (id)processAssertionWithPID:(int)a3 flags:(unsigned int)a4 reason:(unsigned int)a5 name:(id)a6
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  PKProcessAssertionProxy *v10;

  v6 = *(_QWORD *)&a5;
  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v9 = a6;
  v10 = -[PKProcessAssertionProxy initWithPID:flags:reason:name:]([PKProcessAssertionProxy alloc], "initWithPID:flags:reason:name:", v8, v7, v6, v9);

  return v10;
}

- (id)taskStatesForPID:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D87DA8], "predicateMatchingIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87DC8], "descriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValues:", 1);
  objc_msgSend(MEMORY[0x1E0D87DB0], "statesForPredicate:withDescriptor:error:", v5, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)plugInHandshakeComplete
{
  id v2;

  objc_msgSend(MEMORY[0x1E0D87D60], "currentProcess");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "plugInHandshakeComplete");

}

@end
