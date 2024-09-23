@implementation SXDocumentSectionBlueprint

+ (SXDocumentSectionBlueprint)blueprintWithItems:(id)a3
{
  id v3;
  _QWORD *v4;
  void *v5;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = (void *)v4[1];
  v4[1] = v3;

  return (SXDocumentSectionBlueprint *)v4;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
