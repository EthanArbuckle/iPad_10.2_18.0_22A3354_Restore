@implementation PXSearchZeroKeywordSocialGroupViewModel

- (PXSearchZeroKeywordSocialGroupViewModel)initWithRepresentedObject:(id)a3 representedSocialGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PXSearchZeroKeywordSocialGroupViewModel *v15;
  uint64_t v16;
  NSArray *socialGroup;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v13), "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v14);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v19.receiver = self;
  v19.super_class = (Class)PXSearchZeroKeywordSocialGroupViewModel;
  v15 = -[PXSearchZeroKeywordBaseViewModel initWithType:title:representedObject:displayInfo:](&v19, sel_initWithType_title_representedObject_displayInfo_, 1, &stru_1E5149688, v6, v8);
  if (v15)
  {
    v16 = objc_msgSend(v9, "copy");
    socialGroup = v15->_socialGroup;
    v15->_socialGroup = (NSArray *)v16;

  }
  return v15;
}

- (id)debugDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXSearchZeroKeywordSocialGroupViewModel;
  -[PXSearchZeroKeywordBaseViewModel debugDictionary](&v8, sel_debugDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PXSearchZeroKeywordSocialGroupViewModel socialGroup](self, "socialGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("socialGroup"));

  return v4;
}

- (NSArray)socialGroup
{
  return self->_socialGroup;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroup, 0);
}

@end
