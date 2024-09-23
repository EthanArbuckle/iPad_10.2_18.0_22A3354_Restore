@implementation BKTextRangeRotorInfo

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextRangeRotorInfo textRange](self, "textRange"));
  v6 = objc_msgSend(v5, "range");
  v8 = v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textRange"));
  v10 = objc_msgSend(v9, "range");
  v12 = v11;

  if (v6 < v10)
    return -1;
  v14 = -1;
  if (v8 >= v12)
    v14 = v8 > v12;
  if (v6 <= v10)
    return v14;
  else
    return 1;
}

- (NSString)type
{
  return 0;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void *v8;
  NSRange v10;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextRangeRotorInfo type](self, "type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKTextRangeRotorInfo textRange](self, "textRange"));
  v10.location = (NSUInteger)objc_msgSend(v5, "range");
  v6 = NSStringFromRange(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p type=%@ range=%@>"), v3, self, v4, v7));

  return v8;
}

- (BookTextRange)textRange
{
  return self->_textRange;
}

- (void)setTextRange:(id)a3
{
  objc_storeStrong((id *)&self->_textRange, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_textRange, 0);
}

@end
