@implementation PKTransactionAuthenticationMechanismFromStrings

void __PKTransactionAuthenticationMechanismFromStrings_block_invoke(uint64_t a1, void *a2)
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  char v9;
  __CFString *v10;
  __CFString *v11;
  char v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;

  v3 = a2;
  v4 = v3;
  if (v3 == CFSTR("PaymentPINInput"))
  {
    v6 = 1;
    goto LABEL_13;
  }
  if (v3)
  {
    v16 = v3;
    v5 = objc_msgSend(CFSTR("PaymentPINInput"), "isEqualToString:", v3);

    if ((v5 & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v7 = v16;
      if (v7 == CFSTR("TransactionDetailsSignature")
        || (v8 = v7,
            v9 = objc_msgSend(CFSTR("TransactionDetailsSignature"), "isEqualToString:", v7),
            v8,
            (v9 & 1) != 0))
      {
        v6 = 2;
      }
      else
      {
        v10 = v8;
        if (v10 == CFSTR("UserConfirmation")
          || (v11 = v10,
              v12 = objc_msgSend(CFSTR("UserConfirmation"), "isEqualToString:", v10),
              v11,
              (v12 & 1) != 0))
        {
          v6 = 4;
        }
        else
        {
          v13 = v11;
          if (v13 != CFSTR("ApplicationRedirect"))
          {
            v14 = v13;
            v15 = objc_msgSend(CFSTR("ApplicationRedirect"), "isEqualToString:", v13);

            v4 = v16;
            if (!v15)
              goto LABEL_14;
            v6 = 8;
            goto LABEL_13;
          }
          v6 = 8;
        }
      }
    }
    v4 = v16;
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= v6;
  }
LABEL_14:

}

@end
