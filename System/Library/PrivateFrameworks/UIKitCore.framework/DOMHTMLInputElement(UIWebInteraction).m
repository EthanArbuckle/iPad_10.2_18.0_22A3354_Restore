@implementation DOMHTMLInputElement(UIWebInteraction)

- (uint64_t)isAssistedDateType
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("date")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("datetime-local")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("month")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("time"));
  }

  return v2;
}

- (uint64_t)isLikelyToBeginPageLoad
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "type");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqual:", CFSTR("submit"));

  return v2;
}

- (uint64_t)nodeCanBecomeFirstResponder
{
  if ((objc_msgSend(a1, "readOnly") & 1) != 0)
    return 0;
  if ((objc_msgSend(a1, "isTextControl") & 1) != 0)
    return 1;
  return objc_msgSend(a1, "isAssistedDateType");
}

@end
