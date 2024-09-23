@implementation PXErrorRecoveryAttempter

- (int64_t)_alertActionStyleForRecoveryOptionAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[PXErrorRecoveryAttempter recoveryOptions](self, "recoveryOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "style");
  if (v6 == 2)
    v7 = 2;
  else
    v7 = v6 == 1;

  return v7;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 delegate:(id)a5 didRecoverSelector:(SEL)a6 contextInfo:(void *)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;
  SEL v19;
  void *v20;

  v12 = a5;
  v13 = a3;
  -[PXErrorRecoveryAttempter recoveryOptions](self, "recoveryOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectAtIndexedSubscript:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __105__PXErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke;
  v17[3] = &unk_1E5126190;
  v18 = v12;
  v19 = a6;
  v20 = a7;
  v16 = v12;
  objc_msgSend(v15, "_attemptRecoveryFromError:completionHandler:", v13, v17);

}

- (NSArray)recoveryOptions
{
  return self->_recoveryOptions;
}

- (void)setRecoveryOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoveryOptions, 0);
}

id __105__PXErrorRecoveryAttempter_attemptRecoveryFromError_optionIndex_delegate_didRecoverSelector_contextInfo___block_invoke(_QWORD *a1, uint64_t a2)
{
  id result;
  const char *v5;

  result = (id)a1[4];
  if (result)
  {
    v5 = (const char *)a1[5];
    if (v5)
      return objc_msgSend(result, v5, a2, a1[6]);
  }
  return result;
}

@end
