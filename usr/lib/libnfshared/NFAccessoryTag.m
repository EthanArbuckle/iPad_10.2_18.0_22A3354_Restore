@implementation NFAccessoryTag

- (NFAccessoryTag)init
{

  return 0;
}

- (NFAccessoryTag)initWithDelegate:(id)a3
{
  id v4;
  NFAccessoryTag *v5;
  NFAccessoryTag *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NFAccessoryTag;
  v5 = -[NFAccessoryTag init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_delegate, v4);

  return v6;
}

- (NFAccessoryTagDelegate)delegate
{
  return (NFAccessoryTagDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
