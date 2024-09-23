@implementation AutocompleteSection

- (AutocompleteSection)initWithTitle:(id)a3 items:(id)a4 isQuerySuggestionsSection:(BOOL)a5
{
  id v8;
  AutocompleteSection *v9;
  NSString *v10;
  NSString *title;
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)AutocompleteSection;
  v9 = -[PersonalizedCompoundItemGroup initWithItems:](&v13, "initWithItems:", a4);
  if (v9)
  {
    v10 = (NSString *)objc_msgSend(v8, "copy");
    title = v9->_title;
    v9->_title = v10;

    v9->_isQuerySuggestionsSection = a5;
  }

  return v9;
}

+ (id)sectionWithTitle:(id)a3 items:(id)a4 isQuerySuggestionsSection:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend(objc_alloc((Class)a1), "initWithTitle:items:isQuerySuggestionsSection:", v9, v8, v5);

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isQuerySuggestionsSection
{
  return self->_isQuerySuggestionsSection;
}

- (void)setIsQuerySuggestionsSection:(BOOL)a3
{
  self->_isQuerySuggestionsSection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
