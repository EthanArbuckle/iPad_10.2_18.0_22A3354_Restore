@implementation VCSYChangeEnumerator

- (VCSYChangeEnumerator)initWithLazyArray:(id)a3
{
  id v5;
  VCSYChangeEnumerator *v6;
  uint64_t v7;
  NSEnumerator *enumerator;
  VCSYChangeEnumerator *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("VCSYChangeEnumerator.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("array"));

  }
  v12.receiver = self;
  v12.super_class = (Class)VCSYChangeEnumerator;
  v6 = -[VCSYChangeEnumerator init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectEnumerator");
    v7 = objc_claimAutoreleasedReturnValue();
    enumerator = v6->_enumerator;
    v6->_enumerator = (NSEnumerator *)v7;

    v6->_count = objc_msgSend(v5, "count");
    v6->_index = 0;
    v9 = v6;
  }

  return v6;
}

- (id)nextObject
{
  unint64_t index;
  void *v4;
  unint64_t v5;

  index = self->_index;
  self->_index = index + 1;
  if (index >= self->_count)
  {
LABEL_5:
    v4 = 0;
  }
  else
  {
    while (1)
    {
      -[NSEnumerator nextObject](self->_enumerator, "nextObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        if (!objc_msgSend(MEMORY[0x1E0D133D8], "isDegenerate:", v4))
          break;
      }

      v5 = self->_index;
      self->_index = v5 + 1;
      if (v5 >= self->_count)
        goto LABEL_5;
    }
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enumerator, 0);
}

@end
