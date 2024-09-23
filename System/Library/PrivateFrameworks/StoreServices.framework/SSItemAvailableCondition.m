@implementation SSItemAvailableCondition

- (BOOL)evaluateWithContext:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "itemLookupBlock");
  if (v4)
  {
    v5 = v4;
    v6 = SSGetItemIdentifierFromValue(self->super._value);
    LOBYTE(v4) = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 16))(v5, v6);
  }
  return v4 ^ (self->super._operator == 1);
}

@end
