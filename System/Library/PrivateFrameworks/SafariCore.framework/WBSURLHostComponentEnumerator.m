@implementation WBSURLHostComponentEnumerator

- (WBSURLHostComponentEnumerator)init
{
  return -[WBSURLHostComponentEnumerator initWithHost:options:](self, "initWithHost:options:", &stru_1E64A2498, 0);
}

- (WBSURLHostComponentEnumerator)initWithHost:(id)a3 options:(unint64_t)a4
{
  id v6;
  WBSURLHostComponentEnumerator *v7;
  WBSURLHostComponentEnumerator *v8;
  uint64_t v9;
  NSString *host;
  uint64_t v11;
  WBSURLHostComponentEnumerator *v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)WBSURLHostComponentEnumerator;
  v7 = -[WBSURLHostComponentEnumerator init](&v14, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_options = a4;
    v7->_kind = -1;
    v9 = objc_msgSend(v6, "copy");
    host = v8->_host;
    v8->_host = (NSString *)v9;

    v11 = -[NSString length](v8->_host, "length");
    v8->_length = v11;
    v8->_nextSearchRange.location = 0;
    v8->_nextSearchRange.length = v11;
    -[WBSURLHostComponentEnumerator clearAccumulatedDomains](v8, "clearAccumulatedDomains");
    v12 = v8;
  }

  return v8;
}

- (void)clearAccumulatedDomains
{
  NSMutableString *v3;
  NSMutableString *accumulatorString;

  if ((self->_options & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v3 = (NSMutableString *)objc_claimAutoreleasedReturnValue();
    accumulatorString = self->_accumulatorString;
    self->_accumulatorString = v3;

  }
}

- (id)nextObject
{
  __CFString *v2;
  _NSRange *p_nextSearchRange;
  __CFString *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger location;
  uint64_t v9;
  uint64_t v10;
  unint64_t options;
  int v12;
  void *v13;
  void *v14;
  unint64_t v15;
  __CFString *v16;
  int64_t v17;
  __CFString *v18;
  unint64_t v19;
  uint64_t v20;
  NSMutableString *v21;
  NSMutableString *accumulatorString;
  unint64_t length;
  int64_t v24;
  __CFString *v25;
  NSMutableString *v27;
  NSMutableString *v28;
  NSMutableString *v29;
  void *v30;
  char v31;
  _NSRange v32;

  p_nextSearchRange = &self->_nextSearchRange;
  if (!self->_nextSearchRange.length)
  {
    v2 = 0;
    v17 = -1;
    goto LABEL_58;
  }
  if (!self->_didCheckTopLevelDomain)
  {
    self->_didCheckTopLevelDomain = 1;
    -[NSString safari_effectiveTopLevelDomainForHost](self->_host, "safari_effectiveTopLevelDomainForHost");
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      if (-[WBSURLHostComponentEnumerator _checkIsIPAddress](self, "_checkIsIPAddress"))
      {
        p_nextSearchRange->length = 0;
        return self->_host;
      }
      goto LABEL_3;
    }
    v2 = v18;
    self->_didFindTopLevelDomain = 1;
    self->_didBeginConsumingCharacters = 1;
    self->_numberOfAccummulatedComponents = 1;
    v19 = -[__CFString length](v18, "length");
    if ((self->_options & 4) == 0 && -[__CFString hasSuffix:](v2, "hasSuffix:", CFSTR(".")))
    {
      -[__CFString substringToIndex:](v2, "substringToIndex:", v19 - 1);
      v20 = objc_claimAutoreleasedReturnValue();

      v2 = (__CFString *)v20;
    }
    if ((self->_options & 1) == 0)
    {
      v21 = (NSMutableString *)-[__CFString mutableCopy](v2, "mutableCopy");
      accumulatorString = self->_accumulatorString;
      self->_accumulatorString = v21;

      length = self->_length;
      if (length > v19 && -[NSString characterAtIndex:](self->_host, "characterAtIndex:", length + ~v19) == 46)
        -[NSMutableString insertString:atIndex:](self->_accumulatorString, "insertString:atIndex:", CFSTR("."), 0);
    }
    p_nextSearchRange->length = self->_length - v19;
    v17 = 3;
LABEL_58:
    self->_kind = v17;
    return v2;
  }
LABEL_3:
  v5 = 0;
  v32 = (_NSRange)0;
  while (1)
  {
    v6 = p_nextSearchRange->length;
    if (!v6)
    {
      v24 = 2;
      if (!v5)
        v24 = -1;
      self->_kind = v24;
      v25 = v5;
      v5 = v25;
      goto LABEL_48;
    }
    v7 = v6 - self->_didBeginConsumingCharacters;
    location = p_nextSearchRange->location;
    v31 = 0;
    v9 = -[WBSURLHostComponentEnumerator _nextPointRangeInRange:didFindPeriod:](self, "_nextPointRangeInRange:didFindPeriod:", location, v7, &v31);
    self->_didBeginConsumingCharacters = 1;
    p_nextSearchRange->length = v9 + v10;
    if (!v9
      && !self->_didFindTopLevelDomain
      && !self->_didGenerateFullHighLevelDomain
      && !self->_numberOfAccummulatedComponents)
    {
      break;
    }
    if (location + v7 != v9 + v10)
    {
      -[NSString substringWithRange:](self->_host, "substringWithRange:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = self->_numberOfAccummulatedComponents + 1;
      self->_numberOfAccummulatedComponents = v15;
      if (self->_didGenerateFullHighLevelDomain)
      {
        self->_kind = 5;
        if ((self->_options & 1) != 0)
        {
          v2 = v13;
        }
        else
        {
          -[NSMutableString insertString:atIndex:](self->_accumulatorString, "insertString:atIndex:", v13, 0);
          v2 = (__CFString *)-[NSMutableString copy](self->_accumulatorString, "copy");
          if (v31)
            -[NSMutableString insertString:atIndex:](self->_accumulatorString, "insertString:atIndex:", CFSTR("."), 0);
        }
        v12 = 1;
        v16 = v5;
      }
      else if (v15 == 2)
      {
        if (v5)
        {
          v12 = 1;
          self->_isSpeculative = 1;
          self->_kind = 3;
          *p_nextSearchRange = v32;
          self->_numberOfAccummulatedComponents = 1;
          v16 = v5;
          v2 = v16;
        }
        else
        {
          if (self->_containsEmptyComponents)
            self->_isSpeculative = 1;
          self->_kind = 4;
          self->_didGenerateFullHighLevelDomain = 1;
          if ((self->_options & 1) != 0)
          {
            v2 = v13;
          }
          else
          {
            -[NSMutableString insertString:atIndex:](self->_accumulatorString, "insertString:atIndex:", v13, 0);
            v2 = (__CFString *)-[NSMutableString copy](self->_accumulatorString, "copy");
            if (v31)
              -[NSMutableString insertString:atIndex:](self->_accumulatorString, "insertString:atIndex:", CFSTR("."), 0);
          }
          v16 = 0;
          v12 = 1;
        }
      }
      else
      {
        v32 = *p_nextSearchRange;
        if ((self->_options & 1) != 0)
        {
          v16 = v13;

        }
        else
        {
          self->_kind = 3;
          -[NSMutableString insertString:atIndex:](self->_accumulatorString, "insertString:atIndex:", v13, 0);
          v16 = (__CFString *)-[NSMutableString copy](self->_accumulatorString, "copy");

          if (v31)
            -[NSMutableString insertString:atIndex:](self->_accumulatorString, "insertString:atIndex:", CFSTR("."), 0);
        }
        v12 = 2;
      }

      v5 = v16;
      goto LABEL_34;
    }
    self->_containsEmptyComponents = 1;
    self->_kind = 6;
    options = self->_options;
    if ((options & 2) != 0)
    {
      if ((options & 1) != 0)
      {
        v2 = &stru_1E64A2498;
        goto LABEL_49;
      }
      v27 = self->_accumulatorString;
      if (self->_numberOfAccummulatedComponents)
      {
        v2 = (__CFString *)-[NSMutableString copy](v27, "copy");
        if (v31)
        {
          v28 = self->_accumulatorString;
          goto LABEL_56;
        }
        goto LABEL_49;
      }
      -[NSMutableString insertString:atIndex:](v27, "insertString:atIndex:", CFSTR("."), 0);
      v25 = (__CFString *)-[NSMutableString copy](self->_accumulatorString, "copy");
LABEL_48:
      v2 = v25;
      goto LABEL_49;
    }
    v12 = 2;
LABEL_34:
    if (v12 != 2)
      goto LABEL_49;
  }
  self->_kind = 2;
  if ((self->_options & 1) != 0)
  {
    -[NSString substringWithRange:](self->_host, "substringWithRange:", location, v7);
    v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_48;
  }
  v29 = self->_accumulatorString;
  -[NSString substringWithRange:](self->_host, "substringWithRange:", location, v7);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString insertString:atIndex:](v29, "insertString:atIndex:", v30, 0);

  v2 = (__CFString *)-[NSMutableString copy](self->_accumulatorString, "copy");
  if (v31)
  {
    v28 = self->_accumulatorString;
LABEL_56:
    -[NSMutableString insertString:atIndex:](v28, "insertString:atIndex:", CFSTR("."), 0);
  }
LABEL_49:

  return v2;
}

- (BOOL)_checkIsIPAddress
{
  unsigned int v3;
  const char *v4;
  const char *v5;
  in6_addr v7;
  unsigned int v8;

  v3 = -[NSString characterAtIndex:](self->_host, "characterAtIndex:", 0);
  if (v3 == 58 || v3 <= 0xFF && (*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v3 + 60) & 0x10000) != 0)
  {
    v4 = -[NSString cStringUsingEncoding:](self->_host, "cStringUsingEncoding:", 1);
    if (v4)
    {
      v5 = v4;
      v8 = 0;
      LODWORD(v4) = inet_pton(2, v4, &v8);
      if ((_DWORD)v4 == 1)
      {
        self->_kind = 0;
        self->_ipv4Address = bswap32(v8);
      }
      else
      {
        v7 = (in6_addr)0;
        LOBYTE(v4) = inet_pton(30, v5, &v7) == 1;
        if ((_BYTE)v4)
        {
          self->_kind = 1;
          self->_ipv6Address = v7;
        }
      }
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return (char)v4;
}

- (_NSRange)_nextPointRangeInRange:(_NSRange)a3 didFindPeriod:(BOOL *)a4
{
  NSUInteger v5;
  NSUInteger v6;
  BOOL v7;
  _NSRange result;

  v5 = -[NSString rangeOfString:options:range:](self->_host, "rangeOfString:options:range:", CFSTR("."), 4, a3.location, a3.length);
  v7 = v5 != 0x7FFFFFFFFFFFFFFFLL;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0;
    v6 = 0;
  }
  *a4 = v7;
  result.length = v6;
  result.location = v5;
  return result;
}

- (NSString)host
{
  return self->_host;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)kind
{
  return self->_kind;
}

- (BOOL)containsEmptyComponents
{
  return self->_containsEmptyComponents;
}

- (BOOL)isSpeculative
{
  return self->_isSpeculative;
}

- (unsigned)ipv4Address
{
  return self->_ipv4Address;
}

- (in6_addr)ipv6Address
{
  in6_addr *p_ipv6Address;
  uint64_t v3;
  uint64_t v4;
  in6_addr result;

  p_ipv6Address = &self->_ipv6Address;
  v3 = *(_QWORD *)self->_ipv6Address.__u6_addr8;
  v4 = *(_QWORD *)&p_ipv6Address->__u6_addr32[2];
  *(_QWORD *)&result.__u6_addr32[2] = v4;
  *(_QWORD *)result.__u6_addr8 = v3;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_topLevelDomainSubstring, 0);
  objc_storeStrong((id *)&self->_accumulatorString, 0);
}

@end
