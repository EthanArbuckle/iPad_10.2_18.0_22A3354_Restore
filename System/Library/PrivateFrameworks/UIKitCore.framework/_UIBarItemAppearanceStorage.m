@implementation _UIBarItemAppearanceStorage

- (id)textAttributesForState:(unint64_t)a3
{
  NSMutableDictionary *textAttributesForState;
  void *v4;
  void *v5;
  void *v6;

  textAttributesForState = self->textAttributesForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](textAttributesForState, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (void)setTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *textAttributesForState;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *v15;
  id v16;

  v6 = a3;
  v16 = v6;
  if (v6)
    goto LABEL_12;
  textAttributesForState = self->textAttributesForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](textAttributesForState, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v9)
  {
LABEL_12:
    if (self->textAttributesForState)
    {
      if (v6)
      {
LABEL_5:
        v10 = (void *)objc_msgSend(v6, "mutableCopy");
        v11 = self->textAttributesForState;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

LABEL_8:
        v6 = v16;
        goto LABEL_9;
      }
    }
    else
    {
      v13 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      v14 = self->textAttributesForState;
      self->textAttributesForState = v13;

      v6 = v16;
      if (v16)
        goto LABEL_5;
    }
    v15 = self->textAttributesForState;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](v15, "removeObjectForKey:", v10);
    goto LABEL_8;
  }
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->textAttributesForState, 0);
}

- (void)setTextAttribute:(id)a3 forKey:(id)a4 state:(unint64_t)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  NSMutableDictionary *v12;
  NSMutableDictionary *textAttributesForState;
  id v14;

  v14 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->textAttributesForState, "objectForKeyedSubscript:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v14
    || (objc_msgSend(v10, "objectForKeyedSubscript:", v8),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    if (self->textAttributesForState)
    {
      if (v10)
        goto LABEL_5;
    }
    else
    {
      v12 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 3);
      textAttributesForState = self->textAttributesForState;
      self->textAttributesForState = v12;

      if (v10)
        goto LABEL_5;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->textAttributesForState, "setObject:forKeyedSubscript:", v10, v9);
LABEL_5:
    if (v14)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, v8);
    else
      objc_msgSend(v10, "removeObjectForKey:", v8);
  }

}

- (id)textAttributeForKey:(id)a3 state:(unint64_t)a4
{
  id v6;
  NSMutableDictionary *textAttributesForState;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  textAttributesForState = self->textAttributesForState;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](textAttributesForState, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 && !v10)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->textAttributesForState, "objectForKeyedSubscript:", &unk_1E1A96DE0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

- (void)enumerateTextAttributesWithBlock:(id)a3
{
  id v4;
  NSMutableDictionary *textAttributesForState;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  textAttributesForState = self->textAttributesForState;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64___UIBarItemAppearanceStorage_enumerateTextAttributesWithBlock___block_invoke;
  v7[3] = &unk_1E16B5BB0;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](textAttributesForState, "enumerateKeysAndObjectsUsingBlock:", v7);

}

@end
