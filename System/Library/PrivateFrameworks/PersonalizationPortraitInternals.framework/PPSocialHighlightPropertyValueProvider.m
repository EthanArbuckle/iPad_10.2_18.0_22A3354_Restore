@implementation PPSocialHighlightPropertyValueProvider

- (void).cxx_destruct
{
  objc_storeStrong(&self->_providingBlock, 0);
}

- (_QWORD)initWithProvidingBlock:(_QWORD *)a1
{
  id v3;
  uint64_t v4;
  void *v5;
  objc_super v7;

  v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)PPSocialHighlightPropertyValueProvider;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      v4 = objc_msgSend(v3, "copy");
      v5 = (void *)a1[1];
      a1[1] = v4;

    }
  }

  return a1;
}

- (id)valueForHighlight:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1C3BD6630]();
  v6 = (void *)MEMORY[0x1E0CB37E8];
  (*((void (**)(void))self->_providingBlock + 2))();
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v5);

  return v7;
}

@end
