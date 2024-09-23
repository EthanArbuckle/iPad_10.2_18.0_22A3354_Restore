@implementation TIKeyboardCandidate(UIKeyboardAdditions)

- (uint64_t)isSlottedCandidate
{
  char isKindOfClass;

  if ((objc_msgSend(a1, "isSecureContentCandidate") & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (unint64_t)isAutofillExtraCandidate
{
  return ((unint64_t)objc_msgSend(a1, "customInfoType") >> 5) & 1;
}

@end
