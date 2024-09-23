@implementation _UIPasteboardOptions

+ (id)optionsWithDictionary:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithOptionsDictionary:", v4);

  return v5;
}

- (_UIPasteboardOptions)initWithOptionsDictionary:(id)a3
{
  id v5;
  _UIPasteboardOptions *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIPasteboardOptions;
  v6 = -[_UIPasteboardOptions init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localOnly"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UIPasteboardOptions.m"), 27, CFSTR("The value for UIPasteboardOptionLocalOnly must be an NSNumber."));

      }
      v6->_localOnly = objc_msgSend(v7, "BOOLValue");
    }
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("expirationDate"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v6, CFSTR("UIPasteboardOptions.m"), 33, CFSTR("The value for UIPasteboardOptionExpirationDate must be an NSDate."));

      }
      objc_storeStrong((id *)&v6->_expirationDate, v8);
    }

  }
  return v6;
}

- (BOOL)isPinned
{
  return self->_pinned;
}

- (void)setPinned:(BOOL)a3
{
  self->_pinned = a3;
}

- (BOOL)isLocalOnly
{
  return self->_localOnly;
}

- (void)setLocalOnly:(BOOL)a3
{
  self->_localOnly = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
