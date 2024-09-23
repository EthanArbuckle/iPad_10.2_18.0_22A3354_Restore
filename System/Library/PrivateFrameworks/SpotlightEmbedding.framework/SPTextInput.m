@implementation SPTextInput

- (SPTextInput)initWithText:(id)a3
{
  id v5;
  SPTextInput *v6;
  SPTextInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPTextInput;
  v6 = -[SPTextInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_text, a3);
    v7->_type = 1;
  }

  return v7;
}

- (SPTextInput)initWithTokenIds:(id)a3
{
  id v4;
  SPTextInput *v5;
  uint64_t v6;
  NSArray *tokenIDs;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPTextInput;
  v5 = -[SPTextInput init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    tokenIDs = v5->_tokenIDs;
    v5->_tokenIDs = (NSArray *)v6;

    v5->_type = 2;
  }

  return v5;
}

- (SPTextInput)initWithAttributedString:(id)a3
{
  id v5;
  SPTextInput *v6;
  SPTextInput *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPTextInput;
  v6 = -[SPTextInput init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_attributedString, a3);
    v7->_type = 3;
  }

  return v7;
}

- (unint64_t)tokenLength
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  if (-[SPTextInput type](self, "type") != 2)
    return 0;
  -[SPTextInput tokenIDs](self, "tokenIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[SPTextInput tokenIDs](self, "tokenIDs");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToNumber:", &unk_2518FF1D8);

    v4 -= v7;
    -[SPTextInput tokenIDs](self, "tokenIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v8, "count") <= 1)
    {

    }
    else
    {
      -[SPTextInput tokenIDs](self, "tokenIDs");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToNumber:", &unk_2518FF1D8);

      v4 -= v11;
    }
  }
  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSArray)tokenIDs
{
  return self->_tokenIDs;
}

- (void)setTokenIDs:(id)a3
{
  objc_storeStrong((id *)&self->_tokenIDs, a3);
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_attributedString, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
  objc_storeStrong((id *)&self->_tokenIDs, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
