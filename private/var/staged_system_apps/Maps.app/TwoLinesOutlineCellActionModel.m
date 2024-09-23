@implementation TwoLinesOutlineCellActionModel

- (TwoLinesOutlineCellActionModel)initWithButtonTitle1:(id)a3 buttonTitle2:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  id v10;
  TwoLinesOutlineCellActionModel *v11;
  NSString *v12;
  NSString *buttonTitle1;
  NSString *v14;
  NSString *buttonTitle2;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TwoLinesOutlineCellActionModel;
  v11 = -[TwoLinesOutlineCellActionModel init](&v17, "init");
  if (v11)
  {
    v12 = (NSString *)objc_msgSend(v8, "copy");
    buttonTitle1 = v11->_buttonTitle1;
    v11->_buttonTitle1 = v12;

    v14 = (NSString *)objc_msgSend(v9, "copy");
    buttonTitle2 = v11->_buttonTitle2;
    v11->_buttonTitle2 = v14;

    objc_storeStrong((id *)&v11->_delegate, a5);
  }

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_buttonTitle1, "hash");
  return -[NSString hash](self->_buttonTitle2, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesOutlineCellActionModel *v4;
  TwoLinesOutlineCellActionModel *v5;
  uint64_t v6;
  TwoLinesOutlineCellActionModel *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  NSString *v11;
  TwoLinesOutlineCellActionViewDelegate *v12;
  TwoLinesOutlineCellActionViewDelegate *v13;
  unsigned __int8 v14;

  v4 = (TwoLinesOutlineCellActionModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v14 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (NSString *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionModel buttonTitle1](v7, "buttonTitle1"));
    v9 = v8;
    if (v8 == self->_buttonTitle1 || -[NSString isEqual:](v8, "isEqual:"))
    {
      v10 = (NSString *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionModel buttonTitle2](v7, "buttonTitle2"));
      v11 = v10;
      if (v10 == self->_buttonTitle2 || -[NSString isEqual:](v10, "isEqual:"))
      {
        v12 = (TwoLinesOutlineCellActionViewDelegate *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellActionModel delegate](v7, "delegate"));
        v13 = v12;
        if (v12 == self->_delegate)
          v14 = 1;
        else
          v14 = -[TwoLinesOutlineCellActionViewDelegate isEqual:](v12, "isEqual:");

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)buttonTitle1
{
  return self->_buttonTitle1;
}

- (NSString)buttonTitle2
{
  return self->_buttonTitle2;
}

- (TwoLinesOutlineCellActionViewDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_buttonTitle2, 0);
  objc_storeStrong((id *)&self->_buttonTitle1, 0);
}

@end
