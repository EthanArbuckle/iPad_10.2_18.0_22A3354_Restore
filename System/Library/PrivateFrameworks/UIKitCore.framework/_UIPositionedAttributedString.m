@implementation _UIPositionedAttributedString

+ (id)attributedString:(id)a3 atPosition:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;

  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (a3 && v6)
  {
    v9 = a3;
    v8 = objc_opt_new();
    v10 = objc_msgSend(v9, "copy");

    v11 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = v10;

    objc_storeStrong((id *)(v8 + 16), a4);
  }

  return (id)v8;
}

- (id)description
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  objc_class *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;

  -[_UIPositionedAttributedString string](self, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)-[__CFString length](v4, "length") >= 0x33)
  {
    -[__CFString substringToIndex:](v4, "substringToIndex:", 47);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("..."));
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (__CFString *)v6;
  }
  -[_UIPositionedAttributedString position](self, "position");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "description");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = CFSTR("nil");
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v14 = CFSTR("(nil)");
  if (v4)
    v14 = v4;
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@:%p %@ @%@>"), v12, self, v14, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSAttributedString)string
{
  return self->_string;
}

- (UITextPosition)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_position, 0);
  objc_storeStrong((id *)&self->_string, 0);
}

@end
