@implementation IMLibraryFragmentFilter

- (IMLibraryFragmentFilter)initWithFilterSpecification:(id *)a3
{
  IMLibraryFragmentFilter *v4;
  uint64_t v5;
  NSMutableDictionary *identifiedDocuments;
  __int128 v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IMLibraryFragmentFilter;
  v4 = -[IMLibraryFragmentFilter init](&v9, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    identifiedDocuments = v4->_identifiedDocuments;
    v4->_identifiedDocuments = (NSMutableDictionary *)v5;

    v7 = *(_OWORD *)&a3->var0;
    v4->_specification.windowWidth = a3->var2;
    *(_OWORD *)&v4->_specification.loadFactor = v7;
  }
  return v4;
}

- (void)dealloc
{
  NSMutableDictionary *identifiedDocuments;
  objc_super v4;

  identifiedDocuments = self->_identifiedDocuments;
  self->_identifiedDocuments = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMLibraryFragmentFilter;
  -[IMLibraryFragmentFilter dealloc](&v4, "dealloc");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  $DBC1B2CDF54530263ABC651DBE6A1D0B *p_specification;
  id v5;
  id v6;

  p_specification = &self->_specification;
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", p_specification, 24));
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("specification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifiedDocuments, CFSTR("identifiedDocuements"));

}

- (IMLibraryFragmentFilter)initWithCoder:(id)a3
{
  id v4;
  IMLibraryFragmentFilter *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  uint64_t v12;
  NSMutableDictionary *identifiedDocuments;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)IMLibraryFragmentFilter;
  v5 = -[IMLibraryFragmentFilter init](&v15, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("specification"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v7, "getBytes:length:", &v5->_specification, 24);
    v8 = objc_opt_class(NSMutableDictionary);
    v9 = objc_opt_class(IMDocumentFragmentFilter);
    v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, objc_opt_class(NSString), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("identifiedDocuements")));
    identifiedDocuments = v5->_identifiedDocuments;
    v5->_identifiedDocuments = (NSMutableDictionary *)v12;

  }
  return v5;
}

+ ($81054265B03F4417B018A533484DF1B1)fragmentFilterSpecificationForDocumentLength:(SEL)a3 librarySpecification:(int64_t)a4
{
  double var0;

  var0 = a5->var0;
  retstr->var0.var0 = a4;
  retstr->var0.var1 = var0;
  *(_OWORD *)&retstr->var0.var2 = *(_OWORD *)&a5->var1;
  return result;
}

- (void)addFilter:(id)a3 withIdentifier:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_identifiedDocuments, "setObject:forKey:", a3, a4);
}

- (void)addDocument:(id)a3 withIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  IMDocumentFragmentFilter *v10;
  IMDocumentFragmentFilter *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;

  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v7 = a4;
  v8 = (void *)objc_opt_class(self);
  v9 = objc_msgSend(v6, "length");
  if (v8)
  {
    v12 = *(_OWORD *)&self->_specification.loadFactor;
    *(_QWORD *)&v13 = self->_specification.windowWidth;
    objc_msgSend(v8, "fragmentFilterSpecificationForDocumentLength:librarySpecification:", v9, &v12);
  }
  else
  {
    v14 = 0u;
    v15 = 0u;
  }
  v10 = [IMDocumentFragmentFilter alloc];
  v12 = v14;
  v13 = v15;
  v11 = -[IMDocumentFragmentFilter initWithDocument:filterSpecification:](v10, "initWithDocument:filterSpecification:", v6, &v12);
  -[IMLibraryFragmentFilter addFilter:withIdentifier:](self, "addFilter:withIdentifier:", v11, v7);

}

- (BOOL)containsDocumentWithIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiedDocuments, "objectForKey:", a3));
  v4 = v3 != 0;

  return v4;
}

- (unint64_t)documentCount
{
  return (unint64_t)-[NSMutableDictionary count](self->_identifiedDocuments, "count");
}

- (id)allIdentifiers
{
  return -[NSMutableDictionary allKeys](self->_identifiedDocuments, "allKeys");
}

- (id)candidateIdentifiersForQuery:(id)a3
{
  id v4;
  id v5;
  NSMutableDictionary *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", -[NSMutableDictionary count](self->_identifiedDocuments, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_identifiedDocuments;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_identifiedDocuments, "objectForKey:", v11, (_QWORD)v14));
        if (objc_msgSend(v12, "mightContainFragment:", v4))
          objc_msgSend(v5, "addObject:", v11);

      }
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiedDocuments, 0);
}

@end
