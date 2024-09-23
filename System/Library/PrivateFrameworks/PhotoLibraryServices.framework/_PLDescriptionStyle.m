@implementation _PLDescriptionStyle

- (_PLDescriptionStyle)initWithIntialFieldSeparator:(id)a3 fieldSeparator:(id)a4 nameValueSeparator:(id)a5 suffix:(id)a6 extraIndent:(int64_t)a7 prettyPrint:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _PLDescriptionStyle *v18;
  uint64_t v19;
  NSString *initialFieldSeparator;
  uint64_t v21;
  NSString *fieldSeparator;
  uint64_t v23;
  NSString *nameValueSeparator;
  uint64_t v25;
  NSString *suffix;
  _PLDescriptionStyle *v27;
  objc_super v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v29.receiver = self;
  v29.super_class = (Class)_PLDescriptionStyle;
  v18 = -[_PLDescriptionStyle init](&v29, sel_init);
  if (v18)
  {
    v19 = objc_msgSend(v14, "copy");
    initialFieldSeparator = v18->_initialFieldSeparator;
    v18->_initialFieldSeparator = (NSString *)v19;

    v21 = objc_msgSend(v15, "copy");
    fieldSeparator = v18->_fieldSeparator;
    v18->_fieldSeparator = (NSString *)v21;

    v23 = objc_msgSend(v16, "copy");
    nameValueSeparator = v18->_nameValueSeparator;
    v18->_nameValueSeparator = (NSString *)v23;

    v25 = objc_msgSend(v17, "copy");
    suffix = v18->_suffix;
    v18->_suffix = (NSString *)v25;

    v18->_extraIndent = a7;
    v18->_prettyPrint = a8;
    v27 = v18;
  }

  return v18;
}

- (id)descriptionForObject:(id)a3 withIndent:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = v6;
  if (self->_prettyPrint)
  {
    objc_msgSend(v6, "_pl_prettyDescriptionWithIndent:", a4);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v11 = (void *)v8;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_msgSend(v7, "description");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v7, "descriptionWithLocale:indent:", 0, a4 - 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("\n%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v11;
}

- (NSString)initialFieldSeparator
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)fieldSeparator
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)nameValueSeparator
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)suffix
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (int64_t)extraIndent
{
  return self->_extraIndent;
}

- (BOOL)prettyPrint
{
  return self->_prettyPrint;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suffix, 0);
  objc_storeStrong((id *)&self->_nameValueSeparator, 0);
  objc_storeStrong((id *)&self->_fieldSeparator, 0);
  objc_storeStrong((id *)&self->_initialFieldSeparator, 0);
}

+ (id)styleForEnum:(int64_t)a3
{
  uint64_t *v3;

  switch(a3)
  {
    case 0:
      pl_dispatch_once();
      v3 = &styleForEnum__pl_once_object_17;
      goto LABEL_7;
    case 1:
      pl_dispatch_once();
      v3 = &styleForEnum__pl_once_object_18;
      goto LABEL_7;
    case 2:
      pl_dispatch_once();
      v3 = &styleForEnum__pl_once_object_19;
      goto LABEL_7;
    case 3:
      pl_dispatch_once();
      v3 = &styleForEnum__pl_once_object_20;
LABEL_7:
      a1 = (id)*v3;
      break;
    default:
      return a1;
  }
  return a1;
}

@end
