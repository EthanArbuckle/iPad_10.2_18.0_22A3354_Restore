@implementation PFMetadataBuilder

- (PFMetadataBuilder)init
{
  PFMetadataBuilder *v2;
  uint64_t v3;
  NSTimeZone *creationTimeZone;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PFMetadataBuilder;
  v2 = -[PFMetadataBuilder init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
    v3 = objc_claimAutoreleasedReturnValue();
    creationTimeZone = v2->_creationTimeZone;
    v2->_creationTimeZone = (NSTimeZone *)v3;

  }
  return v2;
}

- (void)setCreationDate:(id)a3 timeZone:(id)a4
{
  id v6;

  v6 = a4;
  -[PFMetadataBuilder setCreationDate:](self, "setCreationDate:", a3);
  -[PFMetadataBuilder setCreationTimeZone:](self, "setCreationTimeZone:", v6);

}

- (id)combinedKeywordsAndPeople
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PFMetadataBuilder keywords](self, "keywords");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFMetadataBuilder peopleNames](self, "peopleNames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count") + objc_msgSend(v3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    objc_msgSend(v6, "addObjectsFromArray:", v3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v5, "containsObject:", v12, (_QWORD)v14) & 1) == 0)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (NSTimeZone)creationTimeZone
{
  return self->_creationTimeZone;
}

- (void)setCreationTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_creationTimeZone, a3);
}

- (NSString)caption
{
  return self->_caption;
}

- (void)setCaption:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)keywords
{
  return self->_keywords;
}

- (void)setKeywords:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)peopleNames
{
  return self->_peopleNames;
}

- (void)setPeopleNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_peopleNames, 0);
  objc_storeStrong((id *)&self->_accessibilityDescription, 0);
  objc_storeStrong((id *)&self->_keywords, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_caption, 0);
  objc_storeStrong((id *)&self->_creationTimeZone, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
