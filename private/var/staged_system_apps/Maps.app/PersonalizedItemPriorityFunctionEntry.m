@implementation PersonalizedItemPriorityFunctionEntry

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5 matchBlock:(id)a6
{
  id v10;
  id v11;

  v10 = a6;
  v11 = objc_msgSend(objc_alloc((Class)a1), "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", a3, 0, a4, 0, a5, v10);

  return v11;
}

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 matchBlock:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  v9 = objc_msgSend(objc_alloc((Class)a1), "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", a3, 0, a4, 1, 0, v8);

  return v9;
}

+ (id)entryWithPriority:(int64_t)a3 matchBlock:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", a3, 1, 0, 1, 0, v6);

  return v7;
}

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4 sourceSubtype:(int64_t)a5
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", a3, 0, a4, 0, a5, 0);
}

+ (id)entryWithPriority:(int64_t)a3 sourceType:(int64_t)a4
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", a3, 0, a4, 1, 0, 0);
}

+ (id)defaultEntryWithPriority:(int64_t)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithPriority:matchesAnySourceType:sourceType:matchesAnySourceSubtype:sourceSubtype:matchBlock:", a3, 1, 0, 1, 0, 0);
}

- (PersonalizedItemPriorityFunctionEntry)initWithPriority:(int64_t)a3 matchesAnySourceType:(BOOL)a4 sourceType:(int64_t)a5 matchesAnySourceSubtype:(BOOL)a6 sourceSubtype:(int64_t)a7 matchBlock:(id)a8
{
  id v14;
  PersonalizedItemPriorityFunctionEntry *v15;
  PersonalizedItemPriorityFunctionEntry *v16;
  id v17;
  id matchBlock;
  objc_super v20;

  v14 = a8;
  v20.receiver = self;
  v20.super_class = (Class)PersonalizedItemPriorityFunctionEntry;
  v15 = -[PersonalizedItemPriorityFunctionEntry init](&v20, "init");
  v16 = v15;
  if (v15)
  {
    v15->_priority = a3;
    v15->_matchesAnySourceType = a4;
    v15->_matchesAnySourceSubtype = a6;
    v15->_sourceType = a5;
    v15->_sourceSubtype = a7;
    v17 = objc_retainBlock(v14);
    matchBlock = v16->_matchBlock;
    v16->_matchBlock = v17;

  }
  return v16;
}

- (BOOL)matches:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t (**v9)(_QWORD, _QWORD);
  char v10;

  v4 = a3;
  if ((-[PersonalizedItemPriorityFunctionEntry matchesAnySourceType](self, "matchesAnySourceType")
     || (v5 = objc_msgSend(v4, "sourceType"),
         v5 == (id)-[PersonalizedItemPriorityFunctionEntry sourceType](self, "sourceType")))
    && (-[PersonalizedItemPriorityFunctionEntry matchesAnySourceSubtype](self, "matchesAnySourceSubtype")
     || (v6 = objc_msgSend(v4, "sourceSubtype"),
         v6 == (id)-[PersonalizedItemPriorityFunctionEntry sourceSubtype](self, "sourceSubtype"))))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[PersonalizedItemPriorityFunctionEntry matchBlock](self, "matchBlock"));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PersonalizedItemPriorityFunctionEntry matchBlock](self, "matchBlock"));
      v10 = ((uint64_t (**)(_QWORD, id))v9)[2](v9, v4);

    }
    else
    {
      v10 = 1;
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (int64_t)priority
{
  return self->_priority;
}

- (id)matchBlock
{
  return self->_matchBlock;
}

- (BOOL)matchesAnySourceType
{
  return self->_matchesAnySourceType;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (BOOL)matchesAnySourceSubtype
{
  return self->_matchesAnySourceSubtype;
}

- (int64_t)sourceSubtype
{
  return self->_sourceSubtype;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_matchBlock, 0);
}

@end
