@implementation PXSearchZeroKeywordSection

- (PXSearchZeroKeywordSection)initWithType:(int64_t)a3 viewModels:(id)a4
{
  id v6;
  PXSearchZeroKeywordSection *v7;
  PXSearchZeroKeywordSection *v8;
  uint64_t v9;
  NSArray *viewModels;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSearchZeroKeywordSection;
  v7 = -[PXSearchZeroKeywordSection init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_sectionType = a3;
    v9 = objc_msgSend(v6, "copy");
    viewModels = v8->_viewModels;
    v8->_viewModels = (NSArray *)v9;

  }
  return v8;
}

- (void)removeItem:(id)a3
{
  PXSearchZeroKeywordSection *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSArray *viewModels;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[PXSearchZeroKeywordSection viewModels](v4, "viewModels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObject:", v9);
  v7 = objc_msgSend(v6, "copy");
  viewModels = v4->_viewModels;
  v4->_viewModels = (NSArray *)v7;

  objc_sync_exit(v4);
}

- (id)description
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "appendFormat:", CFSTR("Section type: %ld\n"), -[PXSearchZeroKeywordSection sectionType](self, "sectionType"));
  -[PXSearchZeroKeywordSection viewModels](self, "viewModels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("ViewModels: %@\n"), v4);

  return v3;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (NSArray)viewModels
{
  return self->_viewModels;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModels, 0);
}

@end
