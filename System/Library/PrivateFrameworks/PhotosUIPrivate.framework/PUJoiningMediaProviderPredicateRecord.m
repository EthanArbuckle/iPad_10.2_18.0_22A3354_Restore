@implementation PUJoiningMediaProviderPredicateRecord

- (PUJoiningMediaProviderPredicateRecord)initWithMediaProvider:(id)a3 predicate:(id)a4
{
  id v8;
  id v9;
  PUJoiningMediaProviderPredicateRecord *v10;
  uint64_t v11;
  id predicate;
  void *v14;
  void *v15;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PUJoiningMediaProviderPredicateRecord;
  v10 = -[PUJoiningMediaProviderPredicateRecord init](&v16, sel_init);
  if (v10)
  {
    if (v8)
    {
      if (v9)
      {
LABEL_4:
        objc_storeStrong((id *)&v10->_mediaProvider, a3);
        v11 = objc_msgSend(v9, "copy");
        predicate = v10->_predicate;
        v10->_predicate = (id)v11;

        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUJoiningMediaProvider.m"), 153, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mediaProvider != nil"));

      if (v9)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v10, CFSTR("PUJoiningMediaProvider.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("predicate != nil"));

    goto LABEL_4;
  }
LABEL_5:

  return v10;
}

- (PUMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (id)predicate
{
  return self->_predicate;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_predicate, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

@end
