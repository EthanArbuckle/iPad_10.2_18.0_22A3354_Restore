@implementation _UICommandMenuInsertion

+ (id)insertionWithAnchor:(id)a3 fallbacks:(id)a4 insertsAtStart:(id)a5 insertsAtEnd:(id)a6 insertsBefore:(id)a7 insertsAfter:(id)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _UICommandMenuInsertion *v19;

  v13 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = -[_UICommandMenuInsertion initWithAnchor:fallbacks:insertsAtStart:insertsAtEnd:insertsBefore:insertsAfter:]([_UICommandMenuInsertion alloc], "initWithAnchor:fallbacks:insertsAtStart:insertsAtEnd:insertsBefore:insertsAfter:", v18, v17, v16, v15, v14, v13);

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandMenuInsertion)initWithAnchor:(id)a3 fallbacks:(id)a4 insertsAtStart:(id)a5 insertsAtEnd:(id)a6 insertsBefore:(id)a7 insertsAfter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _UICommandMenuInsertion *v19;
  uint64_t v20;
  NSArray *fallbacks;
  uint64_t v22;
  NSArray *insertsAtStart;
  uint64_t v24;
  NSArray *insertsAtEnd;
  uint64_t v26;
  NSArray *insertsBefore;
  uint64_t v28;
  NSArray *insertsAfter;
  objc_super v31;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v31.receiver = self;
  v31.super_class = (Class)_UICommandMenuInsertion;
  v19 = -[_UICommandChange initWithAnchor:](&v31, sel_initWithAnchor_, a3);
  if (v19)
  {
    v20 = objc_msgSend(v14, "copy");
    fallbacks = v19->_fallbacks;
    v19->_fallbacks = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    insertsAtStart = v19->_insertsAtStart;
    v19->_insertsAtStart = (NSArray *)v22;

    v24 = objc_msgSend(v16, "copy");
    insertsAtEnd = v19->_insertsAtEnd;
    v19->_insertsAtEnd = (NSArray *)v24;

    v26 = objc_msgSend(v17, "copy");
    insertsBefore = v19->_insertsBefore;
    v19->_insertsBefore = (NSArray *)v26;

    v28 = objc_msgSend(v18, "copy");
    insertsAfter = v19->_insertsAfter;
    v19->_insertsAfter = (NSArray *)v28;

  }
  return v19;
}

- (_UICommandMenuInsertion)initWithCoder:(id)a3
{
  id v4;
  _UICommandMenuInsertion *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *fallbacks;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSArray *insertsAtStart;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *insertsAtEnd;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  NSArray *insertsBefore;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSArray *insertsAfter;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)_UICommandMenuInsertion;
  v5 = -[_UICommandChange initWithCoder:](&v36, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("fallbacks"));
    v9 = objc_claimAutoreleasedReturnValue();
    fallbacks = v5->_fallbacks;
    v5->_fallbacks = (NSArray *)v9;

    v11 = (void *)MEMORY[0x1E0C99E60];
    v12 = objc_opt_class();
    v13 = objc_opt_class();
    objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("insertsAtStart"));
    v15 = objc_claimAutoreleasedReturnValue();
    insertsAtStart = v5->_insertsAtStart;
    v5->_insertsAtStart = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("insertsAtEnd"));
    v21 = objc_claimAutoreleasedReturnValue();
    insertsAtEnd = v5->_insertsAtEnd;
    v5->_insertsAtEnd = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    v25 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, v25, objc_opt_class(), 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v26, CFSTR("insertsBefore"));
    v27 = objc_claimAutoreleasedReturnValue();
    insertsBefore = v5->_insertsBefore;
    v5->_insertsBefore = (NSArray *)v27;

    v29 = (void *)MEMORY[0x1E0C99E60];
    v30 = objc_opt_class();
    v31 = objc_opt_class();
    objc_msgSend(v29, "setWithObjects:", v30, v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("insertsAfter"));
    v33 = objc_claimAutoreleasedReturnValue();
    insertsAfter = v5->_insertsAfter;
    v5->_insertsAfter = (NSArray *)v33;

  }
  return v5;
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a5)
    (*((void (**)(id, _UICommandMenuInsertion *))a5 + 2))(a5, self);
}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a5)
    return (*((uint64_t (**)(id, _UICommandMenuInsertion *))a5 + 2))(a5, self);
  else
    return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICommandMenuInsertion;
  v4 = a3;
  -[_UICommandChange encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbacks, CFSTR("fallbacks"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_insertsAtStart, CFSTR("insertsAtStart"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_insertsAtEnd, CFSTR("insertsAtEnd"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_insertsBefore, CFSTR("insertsBefore"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_insertsAfter, CFSTR("insertsAfter"));

}

- (NSArray)fallbacks
{
  return self->_fallbacks;
}

- (NSArray)insertsAtStart
{
  return self->_insertsAtStart;
}

- (NSArray)insertsAtEnd
{
  return self->_insertsAtEnd;
}

- (NSArray)insertsBefore
{
  return self->_insertsBefore;
}

- (NSArray)insertsAfter
{
  return self->_insertsAfter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertsAfter, 0);
  objc_storeStrong((id *)&self->_insertsBefore, 0);
  objc_storeStrong((id *)&self->_insertsAtEnd, 0);
  objc_storeStrong((id *)&self->_insertsAtStart, 0);
  objc_storeStrong((id *)&self->_fallbacks, 0);
}

@end
