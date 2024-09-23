@implementation PKAccountTransferExternalAccount

- (id)hashComponent
{
  void *v3;
  int64_t v4;
  void *v5;
  __CFString **v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKAccountPaymentFundingSource type](self, "type");
  switch(v4)
  {
    case 4:
      v6 = PKAccountFundingSourceTypeStringSavings;
LABEL_7:
      objc_msgSend(v3, "appendString:", *v6);
      break;
    case 2:
      v6 = PKAccountFundingSourceTypeStringApplePayCash;
      goto LABEL_7;
    case 1:
      objc_msgSend(v3, "appendString:", CFSTR("ACH"));
      -[PKAccountPaymentFundingSource identifier](self, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v5);

      break;
  }
  v7 = (void *)objc_msgSend(v3, "copy");

  return v7;
}

@end
