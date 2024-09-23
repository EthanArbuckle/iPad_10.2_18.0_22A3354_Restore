@implementation NSString(SCROBrailleAdditions)

- (id)_illegalCharacterSet
{
  if (_illegalCharacterSet_onceToken != -1)
    dispatch_once(&_illegalCharacterSet_onceToken, &__block_literal_global);
  return (id)_illegalCharacterSet___illegalCharacterSet;
}

- (id)_legalWhiteSpaceSet
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__NSString_SCROBrailleAdditions___legalWhiteSpaceSet__block_invoke;
  block[3] = &unk_24CC1D2B0;
  block[4] = a1;
  if (_legalWhiteSpaceSet_onceToken != -1)
    dispatch_once(&_legalWhiteSpaceSet_onceToken, block);
  return (id)_legalWhiteSpaceSet___legalWhiteSpaceSet;
}

- (uint64_t)_rangeIsolatingIllegalCharacters:()SCROBrailleAdditions forwards:
{
  uint64_t v6;
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v6 = a3;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL && a4 != 0)
  {
    objc_msgSend(a1, "_illegalCharacterSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (a5)
      v11 = 0;
    else
      v11 = 4;
    v12 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v10, v11, v6, a4);

    if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      return v12;
  }
  return v6;
}

- (uint64_t)rangeOfWordContainingIndex:()SCROBrailleAdditions
{
  unint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v5 = objc_msgSend(a1, "length");
  if (v5)
  {
    objc_msgSend(a1, "_legalWhiteSpaceSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a3, v5 - a3);
    v8 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v6, 4, 0, a3);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      v10 = 0;
    else
      v10 = v8 + v9;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v11 = v5;
    else
      v11 = v7;
    if (v7 == a3)
    {
      if (a3 <= 1)
        v12 = 1;
      else
        v12 = a3;
      v13 = v12 - 1;
      if (v10 >= v13)
        v14 = v13;
      else
        v14 = v10;
      if (a3 != v14 || v14 >= v5)
        a3 = objc_msgSend(a1, "_rangeIsolatingIllegalCharacters:forwards:");
      goto LABEL_38;
    }
    if (v10 == v11 && v10 >= 1)
    {
      a3 = v10 - 1;
LABEL_38:

      return a3;
    }
    objc_msgSend(a1, "_illegalCharacterSet");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11 != a3)
    {
      v18 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v16, 0, a3, v11 - a3);
      v17 = a3;
      if (v18 != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v18 == a3)
        {
LABEL_37:

          goto LABEL_38;
        }
        v17 = a3;
      }
    }
    if (a3 == v10
      || (v19 = objc_msgSend(a1, "rangeOfCharacterFromSet:options:range:", v16, 4, v10, a3 - v10),
          v19 != 0x7FFFFFFFFFFFFFFFLL)
      && (v10 = v19 + v20, a3 == v19 + v20))
    {
      a3 = v17;
    }
    else if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 = v17;
    }
    else
    {
      a3 = v10;
    }
    goto LABEL_37;
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)rangeOfWordBeforeWordAtIndex:()SCROBrailleAdditions
{
  CFIndex Length;
  void *v6;
  CFIndex v7;
  uint64_t v8;
  uint64_t v9;
  CFIndex v10;
  uint64_t v11;
  CFIndex v12;
  uint64_t v13;

  if (!-[__CFString length](a1, "length"))
    return 0x7FFFFFFFFFFFFFFFLL;
  Length = CFStringGetLength(a1);
  -[__CFString _legalWhiteSpaceSet](a1, "_legalWhiteSpaceSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && Length >= a3)
  {
    v9 = -[__CFString rangeOfCharacterFromSet:options:range:](a1, "rangeOfCharacterFromSet:options:range:", v6, 4, 0, a3);
    v11 = v9 + v10;
    v12 = a3 - (v9 + v10);
    if (a3 == v9 + v10)
    {
      v12 = v10;
      v11 = v9;
    }
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = a3;
    else
      v7 = v12;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v11;
  }
  v13 = -[__CFString _rangeIsolatingIllegalCharacters:forwards:](a1, "_rangeIsolatingIllegalCharacters:forwards:", v8, v7, 0);

  return v13;
}

- (uint64_t)rangeOfWordAfterWordAtIndex:()SCROBrailleAdditions
{
  CFIndex Length;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v12;

  if (-[__CFString length](a1, "length") <= a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  Length = CFStringGetLength(a1);
  -[__CFString _legalWhiteSpaceSet](a1, "_legalWhiteSpaceSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  if ((a3 & 0x8000000000000000) == 0 && Length >= (uint64_t)a3)
  {
    v9 = -[__CFString rangeOfCharacterFromSet:options:range:](a1, "rangeOfCharacterFromSet:options:range:", v6, 0, a3, -[__CFString length](a1, "length", 0x7FFFFFFFFFFFFFFFLL, 0) - a3);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = -[__CFString length](a1, "length") - a3;
    }
    else if (v9 == a3)
    {
      v7 = v10;
    }
    else
    {
      v7 = v9 - a3;
    }
    v8 = a3;
  }
  v12 = -[__CFString _rangeIsolatingIllegalCharacters:forwards:](a1, "_rangeIsolatingIllegalCharacters:forwards:", v8, v7, 1);

  return v12;
}

@end
