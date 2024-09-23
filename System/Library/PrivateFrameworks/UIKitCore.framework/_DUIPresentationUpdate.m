@implementation _DUIPresentationUpdate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIPresentationUpdate)initWithCoder:(id)a3
{
  id v4;
  _DUIPresentationUpdate *v5;
  uint64_t v6;
  NSArray *modifiedPreviews;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_DUIPresentationUpdate;
  v5 = -[_DUIPresentationUpdate init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("modifiedPreviews"));
    v6 = objc_claimAutoreleasedReturnValue();
    modifiedPreviews = v5->_modifiedPreviews;
    v5->_modifiedPreviews = (NSArray *)v6;

    v5->_badgeStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("badgeStyle"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t badgeStyle;
  id v5;

  badgeStyle = self->_badgeStyle;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", badgeStyle, CFSTR("badgeStyle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modifiedPreviews, CFSTR("modifiedPreviews"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSArray *modifiedPreviews;
  void *v8;
  NSArray *v9;
  NSArray *v10;
  NSArray *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = v5;
    if (self->_badgeStyle == *((_QWORD *)v5 + 2))
    {
      modifiedPreviews = self->_modifiedPreviews;
      v8 = (void *)*((_QWORD *)v5 + 1);
      v9 = modifiedPreviews;
      v10 = v8;
      v11 = v10;
      if (v9 == v10)
      {
        v12 = 1;
      }
      else
      {
        v12 = 0;
        if (v9 && v10)
          v12 = -[NSArray isEqual:](v9, "isEqual:", v10);
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  return self->_badgeStyle ^ -[NSArray hash](self->_modifiedPreviews, "hash");
}

- (NSArray)modifiedPreviews
{
  return self->_modifiedPreviews;
}

- (void)setModifiedPreviews:(id)a3
{
  objc_storeStrong((id *)&self->_modifiedPreviews, a3);
}

- (int64_t)badgeStyle
{
  return self->_badgeStyle;
}

- (void)setBadgeStyle:(int64_t)a3
{
  self->_badgeStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedPreviews, 0);
}

@end
