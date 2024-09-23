@implementation PKReusablePassViewQueue

- (id)dequeueReusablePassView
{
  void *v3;

  -[NSMutableSet anyObject](self->_passViews, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[NSMutableSet removeObject:](self->_passViews, "removeObject:", v3);
  return v3;
}

- (PKReusablePassViewQueue)initWithCount:(unint64_t)a3
{
  PKReusablePassViewQueue *v4;
  uint64_t v5;
  NSMutableSet *passViews;
  PKPassView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKReusablePassViewQueue;
  v4 = -[PKReusablePassViewQueue init](&v9, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", a3);
    passViews = v4->_passViews;
    v4->_passViews = (NSMutableSet *)v5;

    for (; a3; --a3)
    {
      v7 = -[PKPassView initWithPass:]([PKPassView alloc], "initWithPass:", 0);
      -[NSMutableSet addObject:](v4->_passViews, "addObject:", v7);

    }
  }
  return v4;
}

- (void)enqueueReusablePassView:(id)a3
{
  -[NSMutableSet addObject:](self->_passViews, "addObject:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passViews, 0);
}

@end
