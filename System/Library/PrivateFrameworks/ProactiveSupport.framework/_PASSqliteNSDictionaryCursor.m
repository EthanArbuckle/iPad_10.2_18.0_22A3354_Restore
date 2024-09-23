@implementation _PASSqliteNSDictionaryCursor

- (void)setCollection:(id)a3
{
  id v5;
  void *v6;
  objc_super v7;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)MEMORY[0x1A1AFDC98]();
    objc_storeStrong((id *)&self->_dictionary, a3);
    objc_autoreleasePoolPop(v6);
  }
  v7.receiver = self;
  v7.super_class = (Class)_PASSqliteNSDictionaryCursor;
  -[_PASSqliteCollectionsCursor setCollection:](&v7, sel_setCollection_, v5);

}

- (void)applyKeyConstraint:(int)a3 withArgument:(id)a4
{
  id v7;
  void *v8;
  id *p_currentKey;
  id v10;
  char v11;
  id v12;
  uint64_t v13;
  id currentKey;
  id currentValue;
  NSDictionary **p_dictionary;
  NSDictionary *dictionary;
  void *v18;
  id v19;
  id v20;
  id v21;
  NSDictionary *v22;
  id v23;

  v7 = a4;
  v8 = v7;
  switch(a3)
  {
    case 72:
      goto LABEL_4;
    case 71:
      v23 = v7;
      currentKey = self->_currentKey;
      self->_currentKey = 0;

      currentValue = self->_currentValue;
      self->_currentValue = 0;

      v13 = 24;
      goto LABEL_8;
    case 2:
LABEL_4:
      p_currentKey = &self->_currentKey;
      v10 = self->_currentKey;
      v23 = v8;
      if (!v10)
      {
        p_dictionary = &self->_dictionary;
        dictionary = self->_dictionary;
        if (dictionary)
        {
          -[NSDictionary objectForKeyedSubscript:](dictionary, "objectForKeyedSubscript:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = self->_currentValue;
          self->_currentValue = v18;

          if (v18)
          {
            objc_storeStrong(&self->_currentKey, a4);
            goto LABEL_15;
          }
          v20 = *p_currentKey;
        }
        else
        {
          v20 = 0;
        }
        *p_currentKey = 0;

        v21 = self->_currentValue;
        self->_currentValue = 0;

        goto LABEL_15;
      }
      v11 = objc_msgSend(v10, "isEqual:", v8);
      v8 = v23;
      if ((v11 & 1) == 0)
      {
        v12 = *p_currentKey;
        *p_currentKey = 0;

        v13 = 48;
LABEL_8:
        p_dictionary = (NSDictionary **)((char *)self + v13);
LABEL_15:
        v22 = *p_dictionary;
        *p_dictionary = 0;

        v8 = v23;
      }
      break;
  }

}

- (void)finalizeConstraints
{
  NSDictionary *dictionary;
  void *v4;
  void *v5;
  id currentKey;
  void *v7;
  id currentValue;
  void *v9;
  NSEnumerator *v10;
  NSEnumerator *keysEnumerator;

  dictionary = self->_dictionary;
  if (dictionary && -[NSDictionary count](dictionary, "count"))
  {
    if (-[NSDictionary count](self->_dictionary, "count") == 1)
    {
      -[NSDictionary allKeys](self->_dictionary, "allKeys");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      currentKey = self->_currentKey;
      self->_currentKey = v5;

      -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:", self->_currentKey);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      currentValue = self->_currentValue;
      self->_currentValue = v7;

    }
    else
    {
      v9 = (void *)MEMORY[0x1A1AFDC98]();
      -[NSDictionary keyEnumerator](self->_dictionary, "keyEnumerator");
      v10 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
      keysEnumerator = self->_keysEnumerator;
      self->_keysEnumerator = v10;

      -[_PASSqliteNSDictionaryCursor stepIndexedRow](self, "stepIndexedRow");
      objc_autoreleasePoolPop(v9);
    }
  }
}

- (id)currentIndexedKey
{
  return self->_currentKey;
}

- (id)currentIndexedValue
{
  return self->_currentValue;
}

- (BOOL)currentIndexedRowSatisfiesConstraints
{
  void *v4;
  void *v5;
  void *v7;
  objc_super v8;

  -[_PASSqliteNSDictionaryCursor currentIndexedKey](self, "currentIndexedKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_PASSqliteCollections.m"), 1255, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self currentIndexedKey] != [NSNull null]"));

  }
  v8.receiver = self;
  v8.super_class = (Class)_PASSqliteNSDictionaryCursor;
  return -[_PASSqliteCollectionsCursor currentIndexedRowSatisfiesConstraints](&v8, sel_currentIndexedRowSatisfiesConstraints);
}

- (void)stepIndexedRow
{
  void *v3;
  id currentKey;
  void *v5;
  id currentValue;

  -[NSEnumerator nextObject](self->_keysEnumerator, "nextObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  currentKey = self->_currentKey;
  self->_currentKey = v3;

  if (self->_currentKey)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_dictionary, "objectForKeyedSubscript:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    currentValue = self->_currentValue;
    self->_currentValue = v5;
  }
  else
  {
    currentValue = self->_currentValue;
    self->_currentValue = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_valueEqualTo, 0);
  objc_storeStrong(&self->_currentValue, 0);
  objc_storeStrong(&self->_currentKey, 0);
  objc_storeStrong((id *)&self->_keysEnumerator, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

+ (const)sqliteMethodName
{
  return "_pas_nsdictionary";
}

+ (id)planningInfoForKeyConstraint:(int)a3
{
  return +[_PASSqliteNSSetCursor planningInfoForValueConstraint:](_PASSqliteNSSetCursor, "planningInfoForValueConstraint:", *(_QWORD *)&a3);
}

@end
