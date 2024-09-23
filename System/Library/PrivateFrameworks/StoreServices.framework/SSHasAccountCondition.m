@implementation SSHasAccountCondition

- (BOOL)evaluateWithContext:(id)a3
{
  char v4;
  uint64_t v5;
  int64_t operator;

  v4 = objc_msgSend(self->super._value, "BOOLValue", a3);
  v5 = objc_msgSend((id)objc_msgSend(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"), "activeAccount"), "uniqueIdentifier");
  operator = self->super._operator;
  if (operator == 1)
    return v4 ^ (v5 != 0);
  if (operator)
    return 0;
  return v4 ^ (v5 != 0) ^ 1;
}

@end
