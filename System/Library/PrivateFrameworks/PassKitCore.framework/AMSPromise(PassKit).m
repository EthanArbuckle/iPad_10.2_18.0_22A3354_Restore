@implementation AMSPromise(PassKit)

- (void)pk_addQueue:()PassKit finishBlock:
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __47__AMSPromise_PassKit__pk_addQueue_finishBlock___block_invoke;
  v10[3] = &unk_1E2ACBF58;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  objc_msgSend(a1, "addFinishBlock:", v10);

}

@end
