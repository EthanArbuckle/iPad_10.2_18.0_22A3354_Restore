@implementation PARegisterUserInfoValueProviderForPAErrorDomain

uint64_t __PARegisterUserInfoValueProviderForPAErrorDomain_block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "setUserInfoValueProviderForDomain:provider:", CFSTR("PAErrorDomain"), &__block_literal_global_13);
}

const __CFString *__PARegisterUserInfoValueProviderForPAErrorDomain_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  const __CFString *v6;

  v4 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CB2D50]))
  {
    v5 = objc_msgSend(v4, "code");
    if ((unint64_t)(v5 - 1) > 0x13)
      v6 = CFSTR("Unknown error");
    else
      v6 = off_1E4FA55C0[v5 - 1];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
