@implementation VITextLookupResult

- (VITextLookupResult)initWithSections:(id)a3
{
  id v4;
  VITextLookupResult *v5;
  uint64_t v6;
  NSArray *sections;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VITextLookupResult;
  v5 = -[VITextLookupResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  NSArray *sections;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  if (a3 == self)
    return 1;
  v15 = v5;
  v16 = v3;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  sections = self->_sections;
  objc_msgSend(v11, "sections", v6, v15, v4, v16, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(sections) = VIObjectIsEqual((unint64_t)sections, (uint64_t)v13);

  return (char)sections;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_sections, "hash");
}

- (NSArray)sections
{
  return self->_sections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
