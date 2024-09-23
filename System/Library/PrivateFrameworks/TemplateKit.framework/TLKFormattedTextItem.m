@implementation TLKFormattedTextItem

- (BOOL)isEmphasized
{
  return self->_isEmphasized;
}

- (BOOL)isBold
{
  return self->_isBold;
}

- (int64_t)color
{
  return self->_color;
}

- (void)setIsBold:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_isBold != a3)
  {
    self->_isBold = a3;
    -[TLKObject observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKObject observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKObject observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (void)setIsEmphasized:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (self->_isEmphasized != a3)
  {
    self->_isEmphasized = a3;
    -[TLKObject observer](self, "observer");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      -[TLKObject observer](self, "observer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "batchUpdateCount");

      if (!v7)
      {
        -[TLKObject observer](self, "observer");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "propertiesDidChange");

      }
    }
  }
}

- (BOOL)hasContent
{
  return 1;
}

- (unint64_t)_itemType
{
  return 0;
}

- (void)setColor:(int64_t)a3
{
  self->_color = a3;
}

@end
