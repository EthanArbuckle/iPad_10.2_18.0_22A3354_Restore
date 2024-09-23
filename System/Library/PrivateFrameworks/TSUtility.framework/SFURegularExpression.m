@implementation SFURegularExpression

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

+ (id)regularExpressionWithString:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithExpressionString:", a3);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_reserved)
  {
    MEMORY[0x219A02728]();
    NSZoneFree((NSZone *)-[SFURegularExpression zone](self, "zone"), self->_reserved);
  }
  v3.receiver = self;
  v3.super_class = (Class)SFURegularExpression;
  -[SFURegularExpression dealloc](&v3, sel_dealloc);
}

- (SFURegularExpression)initWithExpressionString:(id)a3
{
  return -[SFURegularExpression initWithExpressionString:options:](self, "initWithExpressionString:options:", a3, 0);
}

- (SFURegularExpression)initWithExpressionString:(id)a3 options:(unsigned int)a4
{
  id v6;
  size_t v7;
  CFIndex v8;
  UInt8 *v9;
  _QWORD *v10;
  int v11;
  uint64_t v12;
  objc_super v14;
  UInt8 buffer[64];
  uint64_t v16;
  CFRange v17;

  v16 = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)SFURegularExpression;
  v6 = -[SFURegularExpression init](&v14, sel_init);
  if (v6)
  {
    v7 = objc_msgSend(a3, "length");
    v8 = v7;
    v9 = buffer;
    if (v7 >= 0x40)
      v9 = (UInt8 *)malloc_type_malloc(v7, 0x8E7C56BEuLL);
    v17.location = 0;
    v17.length = v8;
    CFStringGetBytes((CFStringRef)a3, v17, 0x600u, 0x20u, 0, v9, v8, 0);
    v10 = NSZoneMalloc((NSZone *)objc_msgSend(v6, "zone"), 0x20uLL);
    *((_QWORD *)v6 + 2) = v10;
    v10[2] = &v9[v8];
    if ((a4 & 1) != 0)
      v11 = 34;
    else
      v11 = 32;
    v12 = regcomp(*((regex_t **)v6 + 2), (const char *)v9, ((4 * a4) & 8 | (a4 >> 2) & 1 | v11) ^ 9);
    if (v9 != buffer)
      free(v9);
    if ((_DWORD)v12)
    {
      NSLog((NSString *)CFSTR("*** %s: error %d"), "-[SFURegularExpression initWithExpressionString:options:]", v12);
      NSZoneFree((NSZone *)objc_msgSend(v6, "zone"), *((void **)v6 + 2));
      *((_QWORD *)v6 + 2) = 0;

      return 0;
    }
    else
    {
      *((_QWORD *)v6 + 1) = objc_msgSend(a3, "copyWithZone:", objc_msgSend(v6, "zone"));
    }
  }
  return (SFURegularExpression *)v6;
}

- (unint64_t)numberOfSubexpressions
{
  return *((_QWORD *)self->_reserved + 1);
}

- (SFURegularExpression)init
{
  return -[SFURegularExpression initWithExpressionString:](self, "initWithExpressionString:", &stru_24D61C228);
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ((_NSZone *)-[SFURegularExpression zone](self, "zone") == a3)
    return self;
  else
    return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithExpressionString:", self->_expressionString);
}

- (BOOL)isEqual:(id)a3
{
  if (!a3)
    return 0;
  if (a3 != self)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return -[NSString isEqualToString:](self->_expressionString, "isEqualToString:", objc_msgSend(a3, "expressionString"));
    return 0;
  }
  return 1;
}

- (unint64_t)hash
{
  return -[NSString hash](self->_expressionString, "hash");
}

- (id)expressionString
{
  return self->_expressionString;
}

- (_NSRange)matchedRangeForCString:(const char *)a3 range:(_NSRange)a4 subexpressionRanges:(_NSRange *)a5 count:(unsigned int)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  regmatch_t *p_pmatch;
  uint64_t v15;
  uint64_t rm_so;
  uint64_t v17;
  uint64_t v18;
  regoff_t *p_rm_eo;
  NSUInteger *p_length;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _NSRange *v25;
  NSUInteger v26;
  NSUInteger v27;
  regmatch_t __pmatch;
  uint64_t v29;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v29 = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  v12 = a6;
  if (-[SFURegularExpression numberOfSubexpressions](self, "numberOfSubexpressions") < a6)
    v12 = -[SFURegularExpression numberOfSubexpressions](self, "numberOfSubexpressions");
  v13 = v12 + 1;
  if (v12 + 1 >= 6)
    p_pmatch = (regmatch_t *)malloc_type_malloc(16 * v13, 0x1000040451B5BE8uLL);
  else
    p_pmatch = &__pmatch;
  v15 = location + length;
  rm_so = 0x7FFFFFFFFFFFFFFFLL;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = -1;
    v17 = -1;
  }
  else
  {
    v17 = location;
  }
  p_pmatch->rm_so = v17;
  p_pmatch->rm_eo = v15;
  if (regexec((const regex_t *)self->_reserved, a3, v12 + 1, p_pmatch, 4))
  {
    v18 = 0;
  }
  else
  {
    v18 = (p_pmatch->rm_eo - p_pmatch->rm_so) & ~(p_pmatch->rm_so >> 63);
    if (p_pmatch->rm_so >= 0)
      rm_so = p_pmatch->rm_so;
    if (v13 >= 2)
    {
      p_rm_eo = &p_pmatch[1].rm_eo;
      p_length = &a5->length;
      v21 = v12;
      do
      {
        v22 = *(p_rm_eo - 1);
        v23 = (*p_rm_eo - v22) & ~(v22 >> 63);
        if (v22 < 0)
          v22 = 0x7FFFFFFFFFFFFFFFLL;
        *(p_length - 1) = v22;
        *p_length = v23;
        p_rm_eo += 2;
        p_length += 2;
        --v21;
      }
      while (v21);
    }
    if (v13 < v11)
    {
      v24 = ~v12 + v11;
      v25 = &a5[v12 + 1];
      do
      {
        *v25++ = (_NSRange)xmmword_216DA5E40;
        --v24;
      }
      while (v24);
    }
  }
  if (p_pmatch != &__pmatch)
    free(p_pmatch);
  v26 = rm_so;
  v27 = v18;
  result.length = v27;
  result.location = v26;
  return result;
}

- (_NSRange)matchedRangeForString:(id)a3 range:(_NSRange)a4 subexpressionRanges:(_NSRange *)a5 count:(unsigned int)a6
{
  uint64_t v6;
  NSUInteger length;
  NSUInteger location;
  CFDataRef ASCIIData;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  _NSRange result;

  v6 = *(_QWORD *)&a6;
  length = a4.length;
  location = a4.location;
  ASCIIData = _createASCIIData((const __CFString *)a3, 0x3Fu, a4.location, a4.length);
  v12 = -[SFURegularExpression matchedRangeForCString:range:subexpressionRanges:count:](self, "matchedRangeForCString:range:subexpressionRanges:count:", -[__CFData bytes](ASCIIData, "bytes"), location, length, a5, v6);
  v14 = v13;

  v15 = v12;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (SFURegularExpression)initWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = objc_msgSend(a3, "versionForClassName:", CFSTR("SFURegularExpression"));
  v7 = v6;
  if (v6 < 2)
  {
    if (v6 == 1)
      return -[SFURegularExpression initWithExpressionString:](self, "initWithExpressionString:", objc_msgSend(a3, "decodeObject"));
  }
  else
  {
    v8 = AMOFullMethodName((uint64_t)self, a2);
    NSLog((NSString *)CFSTR("%@: class version %lu cannot read instances archived with version %lu"), v8, 1, v7);
    -[SFURegularExpression dealloc](self, "dealloc");
    return 0;
  }
  return self;
}

- (const)getBytesForString:(id)a3 lossByte:(unsigned __int8)a4
{
  CFDataRef ASCIIData;
  const __CFData *v5;

  ASCIIData = _createASCIIData((const __CFString *)a3, a4, 0, objc_msgSend(a3, "length"));
  v5 = ASCIIData;
  return (const char *)-[__CFData bytes](ASCIIData, "bytes");
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:", self->_expressionString);
}

@end
