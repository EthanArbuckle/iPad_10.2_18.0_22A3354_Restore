@implementation TLKInlineRoundedText

- (void)setString:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_string != v10)
  {
    objc_storeStrong((id *)&self->_string, a3);
    -[TLKObject observer](self, "observer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[TLKObject observer](self, "observer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "batchUpdateCount");

      if (!v8)
      {
        -[TLKObject observer](self, "observer");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "propertiesDidChange");

      }
    }
  }

}

- (unint64_t)_itemType
{
  return 2;
}

- (NSString)string
{
  return self->_string;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);
}

@end
