@implementation _BKKeyboardEventExtras

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _BKKeyboardEventExtras *v6;
  uint64_t v7;
  BOOL v8;

  v6 = (_BKKeyboardEventExtras *)a3;
  if (v6 == self)
  {
    v8 = 1;
  }
  else
  {
    v7 = objc_opt_class(self, v4, v5);
    v8 = (objc_opt_isKindOfClass(v6, v7) & 1) != 0
      && BSEqualObjects(self->_authenticationSpecification, v6->_authenticationSpecification)
      && self->_eventSource == v6->_eventSource
      && self->_modifiersOnly == v6->_modifiersOnly
      && self->_GSModifierState == v6->_GSModifierState;
  }

  return v8;
}

- (id)copy
{
  _BKKeyboardEventExtras *v3;

  v3 = objc_alloc_init(_BKKeyboardEventExtras);
  objc_storeStrong((id *)&v3->_authenticationSpecification, self->_authenticationSpecification);
  v3->_eventSource = self->_eventSource;
  v3->_modifiersOnly = self->_modifiersOnly;
  v3->_GSModifierState = self->_GSModifierState;
  return v3;
}

- (NSString)description
{
  return (NSString *)+[BSDescriptionStream descriptionForRootObject:](BSDescriptionStream, "descriptionForRootObject:", self);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  v9 = a3;
  v4 = objc_msgSend(v9, "appendObject:withName:skipIfNil:", self->_authenticationSpecification, CFSTR("authSpec"), 1);
  v5 = NSStringFromBKSHIDEventSource(self->_eventSource);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  objc_msgSend(v9, "appendString:withName:", v6, CFSTR("eventSource"));

  v7 = objc_msgSend(v9, "appendBool:withName:", self->_modifiersOnly, CFSTR("modifiersOnly"));
  v8 = objc_msgSend(v9, "appendUnsignedInteger:withName:format:", self->_GSModifierState, CFSTR("GSModifierState"), 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authenticationSpecification, 0);
}

@end
