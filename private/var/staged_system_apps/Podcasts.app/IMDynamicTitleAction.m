@implementation IMDynamicTitleAction

- (id)title
{
  NSString *v3;
  void *v4;
  uint64_t (**titleBlock)(id, void *);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)IMDynamicTitleAction;
  v3 = -[IMAction title](&v10, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  titleBlock = (uint64_t (**)(id, void *))self->_titleBlock;
  if (titleBlock)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[IMAction controller](self, "controller"));
    v7 = titleBlock[2](titleBlock, v6);
    v8 = objc_claimAutoreleasedReturnValue(v7);

    v4 = (void *)v8;
  }
  return v4;
}

- (id)titleBlock
{
  return self->_titleBlock;
}

- (void)setTitleBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_titleBlock, 0);
}

@end
