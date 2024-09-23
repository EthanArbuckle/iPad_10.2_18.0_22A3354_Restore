@implementation SXDefaultComponentTextStyleModifier

- (void)modifyDOM:(id)a3 context:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SXComponentTextStyle *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v6 = a4;
  if (!self->_shouldReturnUnmodifiedDOM)
  {
    objc_msgSend(v19, "componentTextStyles");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("default"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8
      && objc_msgSend(v8, "fontSize") != 0x7FFFFFFFFFFFFFFFLL
      && (objc_msgSend(v8, "textColor"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      self->_shouldReturnUnmodifiedDOM = 1;
    }
    else
    {
      objc_msgSend(v8, "JSONRepresentation");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
        v10 = (void *)MEMORY[0x24BDBD1B8];
      v12 = (void *)objc_msgSend(v10, "mutableCopy");

      if (objc_msgSend(v8, "fontSize") == 0x7FFFFFFFFFFFFFFFLL)
        objc_msgSend(v12, "setObject:forKey:", &unk_24D6FF100, CFSTR("fontSize"));
      objc_msgSend(v8, "textColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v13)
        objc_msgSend(v12, "setObject:forKey:", CFSTR("#000"), CFSTR("textColor"));
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        objc_msgSend(v12, "setObject:forKey:", CFSTR("default"), CFSTR("identifier"));
      v15 = [SXComponentTextStyle alloc];
      objc_msgSend(v6, "specVersion");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SXJSONObject initWithJSONObject:andVersion:](v15, "initWithJSONObject:andVersion:", v12, v16);

      objc_msgSend(v19, "componentTextStyles");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setObject:forKey:", v17, CFSTR("default"));

      v8 = (void *)v17;
    }

  }
}

- (BOOL)shouldReturnUnmodifiedDOM
{
  return self->_shouldReturnUnmodifiedDOM;
}

- (void)setShouldReturnUnmodifiedDOM:(BOOL)a3
{
  self->_shouldReturnUnmodifiedDOM = a3;
}

@end
