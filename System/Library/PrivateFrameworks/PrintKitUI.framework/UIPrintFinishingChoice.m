@implementation UIPrintFinishingChoice

- (UIPrintFinishingChoice)initWithTitle:(id)a3 finishingChoiceID:(int64_t)a4 finishingChoiceInfo:(id)a5
{
  id v9;
  id v10;
  UIPrintFinishingChoice *v11;
  UIPrintFinishingChoice *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)UIPrintFinishingChoice;
  v11 = -[UIPrintFinishingChoice init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a3);
    v12->_finishingChoiceID = a4;
    objc_storeStrong((id *)&v12->_finishingChoiceInfo, a5);
  }

  return v12;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (int64_t)finishingChoiceID
{
  return self->_finishingChoiceID;
}

- (void)setFinishingChoiceID:(int64_t)a3
{
  self->_finishingChoiceID = a3;
}

- (NSDictionary)finishingChoiceInfo
{
  return self->_finishingChoiceInfo;
}

- (void)setFinishingChoiceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_finishingChoiceInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishingChoiceInfo, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
