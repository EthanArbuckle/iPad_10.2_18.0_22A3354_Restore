@implementation PPFeedbackItem

- (PPFeedbackItem)initWithItemString:(id)a3 itemFeedbackType:(unsigned int)a4
{
  id v8;
  PPFeedbackItem *v9;
  void *v11;
  void *v12;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PPFeedbackItem;
  v9 = -[PPFeedbackItem init](&v13, sel_init);
  if (v9)
  {
    if (v8)
    {
      if (a4)
      {
LABEL_4:
        objc_storeStrong((id *)&v9->_itemString, a3);
        v9->_itemFeedbackType = a4;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PPFeedbackItem.m"), 26, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemString"));

      if (a4)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("PPFeedbackItem.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("itemFeedbackType"));

    goto LABEL_4;
  }
LABEL_5:

  return v9;
}

- (unint64_t)hash
{
  uint64_t itemFeedbackType;

  itemFeedbackType = self->_itemFeedbackType;
  return -[NSString hash](self->_itemString, "hash") - itemFeedbackType + 32 * itemFeedbackType;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *itemString;
  id v5;

  itemString = self->_itemString;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", itemString, CFSTR("itemString"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_itemFeedbackType, CFSTR("itemFeedbackType"));

}

- (PPFeedbackItem)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  PPFeedbackItem *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsValueForKey:", CFSTR("itemFeedbackType"));
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = 0;
  }
  else
  {
    self = -[PPFeedbackItem initWithItemString:itemFeedbackType:](self, "initWithItemString:itemFeedbackType:", v5, objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("itemFeedbackType")));
    v8 = self;
  }

  return v8;
}

- (id)description
{
  void *v3;
  NSString *itemString;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  itemString = self->_itemString;
  objc_msgSend((id)objc_opt_class(), "stringForItemFeedbackType:", self->_itemFeedbackType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("{%@:%@}"), itemString, v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  PPFeedbackItem *v4;
  PPFeedbackItem *v5;
  BOOL v6;

  v4 = (PPFeedbackItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPFeedbackItem isEqualToPPFeedbackItem:](self, "isEqualToPPFeedbackItem:", v5);

  return v6;
}

- (BOOL)isEqualToPPFeedbackItem:(id)a3
{
  id v4;
  _DWORD *v5;
  NSString *itemString;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  BOOL v11;

  v4 = a3;
  v5 = v4;
  if (!v4)
    goto LABEL_4;
  itemString = self->_itemString;
  v7 = (NSString *)*((id *)v4 + 2);
  if (itemString == v7)
  {

    goto LABEL_6;
  }
  v8 = v7;
  v9 = itemString;
  v10 = -[NSString isEqual:](v9, "isEqual:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_6:
    v11 = self->_itemFeedbackType == v5[2];
    goto LABEL_7;
  }
LABEL_4:
  v11 = 0;
LABEL_7:

  return v11;
}

- (NSString)itemString
{
  return self->_itemString;
}

- (unsigned)itemFeedbackType
{
  return self->_itemFeedbackType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemString, 0);
}

+ (id)stringForItemFeedbackType:(unsigned int)a3
{
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3 < 6)
    return off_1E226BFE8[a3];
  pp_default_log_handle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a3;
    *(_DWORD *)buf = 138412546;
    v13 = v11;
    v14 = 2048;
    v15 = a3;
    _os_log_error_impl(&dword_18BE3A000, v6, OS_LOG_TYPE_ERROR, "%@ called with invalid PPItemFeedbackType value of %lu", buf, 0x16u);

  }
  else
  {
    v7 = a3;
  }

  v8 = (void *)MEMORY[0x1E0C99DA0];
  v9 = *MEMORY[0x1E0C99768];
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "raise:format:", v9, CFSTR("%@ called with invalid PPItemFeedbackType value of %lu"), v10, v7);

  return CFSTR("invalid");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
