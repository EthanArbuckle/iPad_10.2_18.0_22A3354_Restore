@implementation FloatingButtonItem

- (FloatingButtonItem)initWithButton:(id)a3 option:(int64_t)a4
{
  id v7;
  FloatingButtonItem *v8;
  FloatingButtonItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FloatingButtonItem;
  v8 = -[FloatingButtonItem init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_button, a3);
    v9->_option = a4;
  }

  return v9;
}

+ (FloatingButtonItem)separatorItem
{
  if (qword_1014D2068 != -1)
    dispatch_once(&qword_1014D2068, &stru_1011B0178);
  return (FloatingButtonItem *)(id)qword_1014D2060;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  objc_storeStrong((id *)&self->_button, a3);
}

- (int64_t)option
{
  return self->_option;
}

- (BOOL)isSeparator
{
  return self->_isSeparator;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_button, 0);
}

@end
