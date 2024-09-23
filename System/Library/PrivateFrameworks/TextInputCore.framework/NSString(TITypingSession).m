@implementation NSString(TITypingSession)

- (uint64_t)endsInPunctuation
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v3 = objc_msgSend(a1, "characterAtIndex:", result - 1);
    objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "characterIsMember:", v3);

    return v5;
  }
  return result;
}

- (uint64_t)endsInWhitespace
{
  uint64_t result;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  result = objc_msgSend(a1, "length");
  if (result)
  {
    v3 = objc_msgSend(a1, "characterAtIndex:", result - 1);
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "characterIsMember:", v3);

    return v5;
  }
  return result;
}

@end
