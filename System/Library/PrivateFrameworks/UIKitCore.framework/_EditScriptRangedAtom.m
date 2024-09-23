@implementation _EditScriptRangedAtom

- (_EditScriptRangedAtom)initWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _EditScriptRangedAtom *v8;
  _EditScriptRangedAtom *v9;
  objc_super v11;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_EditScriptRangedAtom;
  v8 = -[_EditScriptRangedAtom init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[_EditScriptRangedAtom setEditRange:](v8, "setEditRange:", location, length);
    -[_EditScriptRangedAtom setReplacementText:](v9, "setReplacementText:", v7);
  }

  return v9;
}

- (id)description
{
  NSString *p_isa;
  const __CFString *v4;
  void *v5;

  p_isa = self->_replacementText;
  if (!-[NSString length](self->_replacementText, "length"))
  {
    v4 = CFSTR("[blank]");
    goto LABEL_5;
  }
  if (-[NSString isEqualToString:](self->_replacementText, "isEqualToString:", CFSTR(" ")))
  {
    v4 = CFSTR("[space]");
LABEL_5:

    p_isa = &v4->isa;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%lu, %lu):%@\n"), self->_editRange.location, self->_editRange.length, p_isa);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (_EditScriptRangedAtom)atomWithEditRange:(_NSRange)a3 replacementText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  _EditScriptRangedAtom *v7;

  length = a3.length;
  location = a3.location;
  v6 = a4;
  v7 = -[_EditScriptRangedAtom initWithEditRange:replacementText:]([_EditScriptRangedAtom alloc], "initWithEditRange:replacementText:", location, length, v6);

  return v7;
}

- (_NSRange)editRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_editRange.length;
  location = self->_editRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setEditRange:(_NSRange)a3
{
  self->_editRange = a3;
}

- (NSString)replacementText
{
  return self->_replacementText;
}

- (void)setReplacementText:(id)a3
{
  objc_storeStrong((id *)&self->_replacementText, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementText, 0);
}

@end
