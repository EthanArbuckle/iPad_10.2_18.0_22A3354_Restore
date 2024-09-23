@implementation PKCurrencyNumberRoundingHandler

void ___PKCurrencyNumberRoundingHandler_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB35A0], "decimalNumberHandlerWithRoundingMode:scale:raiseOnExactness:raiseOnOverflow:raiseOnUnderflow:raiseOnDivideByZero:", 0, 4, 0, 0, 0, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ECF22050;
  qword_1ECF22050 = v0;

}

@end
