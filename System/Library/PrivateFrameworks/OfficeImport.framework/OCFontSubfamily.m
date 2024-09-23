@implementation OCFontSubfamily

- (OCFontSubfamily)initWithName:(id)a3 metadata:(id)a4
{
  id v6;
  id v7;
  OCFontSubfamily *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OCFontSubfamily;
  v8 = -[OCFontSubfamily init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_metadata, a4);
  }

  return v8;
}

+ (id)fontSubfamilyWithName:(id)a3 metadata:(id)a4
{
  id v5;
  id v6;
  OCFontSubfamily *v7;

  v5 = a3;
  v6 = a4;
  v7 = -[OCFontSubfamily initWithName:metadata:]([OCFontSubfamily alloc], "initWithName:metadata:", v5, v6);

  return v7;
}

- (NSString)name
{
  return self->_name;
}

- (OCFontMetadata)metadata
{
  return self->_metadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
