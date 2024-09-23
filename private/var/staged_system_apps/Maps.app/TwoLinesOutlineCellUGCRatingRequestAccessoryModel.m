@implementation TwoLinesOutlineCellUGCRatingRequestAccessoryModel

- (TwoLinesOutlineCellUGCRatingRequestAccessoryModel)initWithDelegate:(id)a3
{
  id v4;
  TwoLinesOutlineCellUGCRatingRequestAccessoryModel *v5;
  TwoLinesOutlineCellUGCRatingRequestAccessoryModel *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)TwoLinesOutlineCellUGCRatingRequestAccessoryModel;
  v5 = -[TwoLinesOutlineCellUGCRatingRequestAccessoryModel init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (id)createAccessoryConfigurationWithAction:(id)a3
{
  id v3;
  UGCProactiveCallToActionButtonView *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v3 = a3;
  v4 = -[UGCProactiveCallToActionButtonView initWithFrame:]([UGCProactiveCallToActionButtonView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UGCProactiveCallToActionButtonView button](v4, "button"));
  objc_msgSend(v5, "addAction:forControlEvents:", v3, 0x2000);

  -[UGCProactiveCallToActionButtonView systemLayoutSizeFittingSize:](v4, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  -[UGCProactiveCallToActionButtonView setFrame:](v4, "setFrame:", 0.0, 0.0, v6, v7);
  v8 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationCustomView), "initWithCustomView:", v4);
  objc_msgSend(v8, "setUsesDefaultLayoutWidth:", 0);

  return v8;
}

- (int64_t)visibility
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  TwoLinesOutlineCellUGCRatingRequestAccessoryModel *v4;
  TwoLinesOutlineCellUGCRatingRequestAccessoryModel *v5;
  uint64_t v6;
  TwoLinesOutlineCellUGCRatingRequestAccessoryModel *v7;
  id v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v4 = (TwoLinesOutlineCellUGCRatingRequestAccessoryModel *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v11 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = -[TwoLinesOutlineCellUGCRatingRequestAccessoryModel visibility](v7, "visibility");
    if (v8 == (id)-[TwoLinesOutlineCellUGCRatingRequestAccessoryModel visibility](self, "visibility"))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellUGCRatingRequestAccessoryModel delegate](v7, "delegate"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TwoLinesOutlineCellUGCRatingRequestAccessoryModel delegate](self, "delegate"));
      if (v9 == v10)
        v11 = 1;
      else
        v11 = objc_msgSend(v9, "isEqual:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (TwoLinesOutlineCellAccessoryDelegate)delegate
{
  return (TwoLinesOutlineCellAccessoryDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
