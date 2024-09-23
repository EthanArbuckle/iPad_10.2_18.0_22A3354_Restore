@implementation TLKSelectableGridTuple

- (void)setTitle:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_title != v10)
  {
    objc_storeStrong((id *)&self->_title, a3);
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

- (void)setSubtitle:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSString *v10;

  v10 = (NSString *)a3;
  if (self->_subtitle != v10)
  {
    objc_storeStrong((id *)&self->_subtitle, a3);
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

+ (id)tupleWithTitle:(id)a3 subtitle:(id)a4
{
  id v5;
  id v6;
  TLKSelectableGridTuple *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(TLKSelectableGridTuple);
  -[TLKSelectableGridTuple setTitle:](v7, "setTitle:", v6);

  -[TLKSelectableGridTuple setSubtitle:](v7, "setSubtitle:", v5);
  return v7;
}

+ (id)tuplesForTitles:(id)a3 subtitles:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      +[TLKSelectableGridTuple tupleWithTitle:subtitle:](TLKSelectableGridTuple, "tupleWithTitle:subtitle:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v11);

      ++v8;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }
  v12 = (void *)objc_msgSend(v7, "copy");

  return v12;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)objc_opt_new();
  v8.receiver = self;
  v8.super_class = (Class)TLKSelectableGridTuple;
  -[TLKSelectableGridTuple description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  -[TLKSelectableGridTuple title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKSelectableGridTuple subtitle](self, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" (Title: '%@', Subtitle: '%@')"), v5, v6);

  return v3;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (double)size
{
  return self->_size;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
