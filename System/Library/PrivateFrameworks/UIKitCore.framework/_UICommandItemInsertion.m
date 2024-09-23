@implementation _UICommandItemInsertion

+ (id)insertionWithAnchor:(id)a3 fallbacks:(id)a4 insertsBefore:(id)a5 insertsAfter:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _UICommandItemInsertion *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[_UICommandItemInsertion initWithAnchor:fallbacks:insertsBefore:insertsAfter:]([_UICommandItemInsertion alloc], "initWithAnchor:fallbacks:insertsBefore:insertsAfter:", v12, v11, v10, v9);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_UICommandItemInsertion)initWithAnchor:(id)a3 fallbacks:(id)a4 insertsBefore:(id)a5 insertsAfter:(id)a6
{
  id v10;
  id v11;
  id v12;
  _UICommandItemInsertion *v13;
  uint64_t v14;
  NSArray *fallbacks;
  uint64_t v16;
  NSArray *insertsBefore;
  uint64_t v18;
  NSArray *insertsAfter;
  objc_super v21;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)_UICommandItemInsertion;
  v13 = -[_UICommandChange initWithAnchor:](&v21, sel_initWithAnchor_, a3);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    fallbacks = v13->_fallbacks;
    v13->_fallbacks = (NSArray *)v14;

    v16 = objc_msgSend(v11, "copy");
    insertsBefore = v13->_insertsBefore;
    v13->_insertsBefore = (NSArray *)v16;

    v18 = objc_msgSend(v12, "copy");
    insertsAfter = v13->_insertsAfter;
    v13->_insertsAfter = (NSArray *)v18;

  }
  return v13;
}

- (_UICommandItemInsertion)initWithCoder:(id)a3
{
  id v4;
  _UICommandItemInsertion *v5;
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
  NSArray *insertsBefore;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *insertsAfter;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)_UICommandItemInsertion;
  v5 = -[_UICommandChange initWithCoder:](&v24, sel_initWithCoder_, v4);
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
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("insertsBefore"));
    v15 = objc_claimAutoreleasedReturnValue();
    insertsBefore = v5->_insertsBefore;
    v5->_insertsBefore = (NSArray *)v15;

    v17 = (void *)MEMORY[0x1E0C99E60];
    v18 = objc_opt_class();
    v19 = objc_opt_class();
    objc_msgSend(v17, "setWithObjects:", v18, v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("insertsAfter"));
    v21 = objc_claimAutoreleasedReturnValue();
    insertsAfter = v5->_insertsAfter;
    v5->_insertsAfter = (NSArray *)v21;

  }
  return v5;
}

- (void)acceptItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a3)
    (*((void (**)(id, _UICommandItemInsertion *))a3 + 2))(a3, self);
}

- (BOOL)acceptBoolItemInsertionVisit:(id)a3 itemDeletionVisit:(id)a4 menuInsertionVisit:(id)a5 menuDeletionVisit:(id)a6
{
  if (a3)
    return (*((uint64_t (**)(id, _UICommandItemInsertion *))a3 + 2))(a3, self);
  else
    return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UICommandItemInsertion;
  v4 = a3;
  -[_UICommandChange encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_fallbacks, CFSTR("fallbacks"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_insertsBefore, CFSTR("insertsBefore"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_insertsAfter, CFSTR("insertsAfter"));

}

- (NSArray)fallbacks
{
  return self->_fallbacks;
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
  objc_storeStrong((id *)&self->_fallbacks, 0);
}

@end
