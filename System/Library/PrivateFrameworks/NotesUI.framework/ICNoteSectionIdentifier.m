@implementation ICNoteSectionIdentifier

- (BOOL)isEqual:(id)a3
{
  ICNoteSectionIdentifier *v4;
  ICNoteSectionIdentifier *v5;
  void *v6;
  BOOL v7;

  v4 = (ICNoteSectionIdentifier *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_opt_class();
    ICDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[ICNoteSectionIdentifier isEqualToICNoteSectionIdentifier:](self, "isEqualToICNoteSectionIdentifier:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isEqualToICNoteSectionIdentifier:(id)a3
{
  id v4;
  int64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = -[ICNoteSectionIdentifier sectionType](self, "sectionType");
  v6 = objc_msgSend(v4, "sectionType");

  return v5 == v6;
}

- (unint64_t)hash
{
  unint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = self->_hash;
  if (!result)
  {
    v4 = -[ICNoteSectionIdentifier sectionType](self, "sectionType");
    result = ICHashWithHashKeys(v4, v5, v6, v7, v8, v9, v10, v11, 0);
  }
  self->_hash = result;
  return result;
}

- (int64_t)sectionType
{
  return self->_sectionType;
}

- (ICNoteSectionIdentifier)initWithNoteSectionType:(int64_t)a3
{
  ICNoteSectionIdentifier *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICNoteSectionIdentifier;
  result = -[ICNoteSectionIdentifier init](&v5, sel_init);
  if (result)
    result->_sectionType = a3;
  return result;
}

+ (NSArray)sortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("sectionType"), 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)expansionStateContext
{
  int64_t v2;

  v2 = -[ICNoteSectionIdentifier sectionType](self, "sectionType");
  if ((unint64_t)(v2 - 1) > 6)
    return (NSString *)CFSTR("ICNoteSectionTypeTags");
  else
    return &off_1E5C1E410[v2 - 1]->isa;
}

- (BOOL)isCollapsible
{
  return (unint64_t)(-[ICNoteSectionIdentifier sectionType](self, "sectionType") - 1) < 3;
}

- (BOOL)containsRelevantIdentifiers
{
  return (-[ICNoteSectionIdentifier sectionType](self, "sectionType") & 0xFFFFFFFFFFFFFFFDLL) != 0;
}

+ (NSDictionary)titles
{
  if (titles_onceToken != -1)
    dispatch_once(&titles_onceToken, &__block_literal_global_10);
  return (NSDictionary *)(id)titles_titles;
}

void __33__ICNoteSectionIdentifier_titles__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v7[0] = &stru_1E5C2F8C0;
  v6[0] = &unk_1E5C71C10;
  v6[1] = &unk_1E5C71C28;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Invitations"), CFSTR("Invitations"), 0, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v0;
  v6[2] = &unk_1E5C71C40;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Folders"), CFSTR("Folders"), 0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v1;
  v6[3] = &unk_1E5C71C58;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Pinned"), CFSTR("Pinned"), 0, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v2;
  v6[4] = &unk_1E5C71C70;
  objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Notes"), CFSTR("Notes"), 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[4] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)titles_titles;
  titles_titles = v4;

}

- (NSString)title
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend((id)objc_opt_class(), "titles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[ICNoteSectionIdentifier sectionType](self, "sectionType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = -[ICNoteSectionIdentifier sectionType](self, "sectionType");
  if ((unint64_t)(v5 - 1) > 6)
    v6 = CFSTR("ICNoteSectionTypeTags");
  else
    v6 = off_1E5C1E410[v5 - 1];
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> sectionType: %@"), v4, self, v6);
}

- (void)setSectionType:(int64_t)a3
{
  self->_sectionType = a3;
}

@end
