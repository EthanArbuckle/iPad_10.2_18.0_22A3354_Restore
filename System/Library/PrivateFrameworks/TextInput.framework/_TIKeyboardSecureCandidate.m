@implementation _TIKeyboardSecureCandidate

- (_TIKeyboardSecureCandidate)initWithSecureHeader:(id)a3 secureContent:(id)a4 secureFormattedContent:(id)a5 input:(id)a6 truncationSentinel:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _TIKeyboardSecureCandidate *v17;
  _TIKeyboardSecureCandidate *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)_TIKeyboardSecureCandidate;
  v17 = -[_TIKeyboardSecureCandidate init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_secureHeader, a3);
    objc_storeStrong((id *)&v18->_secureContent, a4);
    objc_storeStrong((id *)&v18->_secureFormattedContent, a5);
    objc_storeStrong((id *)&v18->_input, a6);
    objc_storeStrong((id *)&v18->_truncationSentinel, a7);
  }

  return v18;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  id *v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = (id *)v4;
  if (v4)
  {
    objc_storeStrong((id *)(v4 + 8), self->_secureHeader);
    objc_storeStrong(v5 + 2, self->_secureContent);
    objc_storeStrong(v5 + 3, self->_secureFormattedContent);
    objc_storeStrong(v5 + 4, self->_input);
    objc_storeStrong(v5 + 5, self->_truncationSentinel);
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    -[_TIKeyboardSecureCandidate secureHeader](self, "secureHeader");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secureHeader");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v6 == (void *)v7)
    {

    }
    else
    {
      v8 = (void *)v7;
      -[_TIKeyboardSecureCandidate secureHeader](self, "secureHeader");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "secureHeader");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v11)
        goto LABEL_17;
    }
    -[_TIKeyboardSecureCandidate secureContent](self, "secureContent");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secureContent");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v13 == (void *)v14)
    {

    }
    else
    {
      v15 = (void *)v14;
      -[_TIKeyboardSecureCandidate secureContent](self, "secureContent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "secureContent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "isEqualToString:", v17);

      if (!v18)
        goto LABEL_17;
    }
    -[_TIKeyboardSecureCandidate secureFormattedContent](self, "secureFormattedContent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "secureFormattedContent");
    v20 = objc_claimAutoreleasedReturnValue();
    if (v19 == (void *)v20)
    {

    }
    else
    {
      v21 = (void *)v20;
      -[_TIKeyboardSecureCandidate secureFormattedContent](self, "secureFormattedContent");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "secureFormattedContent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if (!v24)
        goto LABEL_17;
    }
    -[_TIKeyboardSecureCandidate input](self, "input");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "input");
    v26 = objc_claimAutoreleasedReturnValue();
    if (v25 == (void *)v26)
    {

    }
    else
    {
      v27 = (void *)v26;
      -[_TIKeyboardSecureCandidate input](self, "input");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "input");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v28, "isEqualToString:", v29);

      if (!v30)
      {
LABEL_17:
        v12 = 0;
LABEL_23:

        goto LABEL_24;
      }
    }
    -[_TIKeyboardSecureCandidate truncationSentinel](self, "truncationSentinel");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "truncationSentinel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31 == v32)
    {
      v12 = 1;
    }
    else
    {
      -[_TIKeyboardSecureCandidate truncationSentinel](self, "truncationSentinel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "truncationSentinel");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v33, "isEqualToString:", v34);

    }
    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[_TIKeyboardSecureCandidate secureHeader](self, "secureHeader");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("secureHeader(%@)"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TIKeyboardSecureCandidate secureContent](self, "secureContent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(";secureContent(%@)"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TIKeyboardSecureCandidate secureFormattedContent](self, "secureFormattedContent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(";secureFormattedContent(%@)"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TIKeyboardSecureCandidate input](self, "input");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(";input(%@)"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TIKeyboardSecureCandidate truncationSentinel](self, "truncationSentinel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(";truncationSentinel(%@)"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)candidateHash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = 257 * -[NSString hash](self->_secureHeader, "hash");
  v4 = 257 * (-[NSString hash](self->_secureContent, "hash") + v3);
  return v4 + -[NSString hash](self->_secureFormattedContent, "hash");
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;

  v3 = 257 * -[_TIKeyboardSecureCandidate candidateHash](self, "candidateHash");
  v4 = 257 * (-[NSString hash](self->_input, "hash") + v3);
  return v4 + -[NSString hash](self->_truncationSentinel, "hash");
}

- (NSString)secureHeader
{
  return self->_secureHeader;
}

- (NSString)secureContent
{
  return self->_secureContent;
}

- (NSString)secureFormattedContent
{
  return self->_secureFormattedContent;
}

- (NSString)input
{
  return self->_input;
}

- (NSString)truncationSentinel
{
  return self->_truncationSentinel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_truncationSentinel, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_secureFormattedContent, 0);
  objc_storeStrong((id *)&self->_secureContent, 0);
  objc_storeStrong((id *)&self->_secureHeader, 0);
}

@end
