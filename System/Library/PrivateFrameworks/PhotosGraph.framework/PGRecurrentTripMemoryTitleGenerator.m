@implementation PGRecurrentTripMemoryTitleGenerator

- (PGRecurrentTripMemoryTitleGenerator)initWithLocationNodes:(id)a3 titleGenerationContext:(id)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  PGRecurrentTripMemoryTitleGenerator *v11;
  objc_super v13;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0C99E60];
  v9 = a4;
  objc_msgSend(v8, "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)PGRecurrentTripMemoryTitleGenerator;
  v11 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, v10, 0, v9);

  if (v11)
    objc_storeStrong((id *)&v11->_locationNodes, a3);

  return v11;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, void *, void *);

  v6 = (void (**)(id, void *, void *))a3;
  -[PGRecurrentTripMemoryTitleGenerator _locationTitle](self, "_locationTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGRecurrentTripMemoryTitleGenerator _timeTitle](self, "_timeTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v6[2](v6, v4, v5);

}

- (id)_locationTitle
{
  NSUInteger v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t i;
  uint64_t v15;
  char v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  const __CFString *v38;
  void *v39;
  void *v40;
  unsigned __int8 v42;
  void *v43;
  uint8_t buf[16];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[2];
  void *v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v3 = -[NSSet count](self->_locationNodes, "count");
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSSet anyObject](self->_locationNodes, "anyObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("State")) & 1) != 0)
    v42 = 0;
  else
    v42 = objc_msgSend(v6, "isEqualToString:", CFSTR("Country")) ^ 1;
  v43 = v6;
  -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locationHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v9 = self->_locationNodes;
  v10 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v46;
    v13 = 1;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v46 != v12)
          objc_enumerationMutation(v9);
        v15 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        v16 = objc_msgSend(v8, "locationIsInSupersetCategoryForLocationNode:", v15);
        +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", v15, v8);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length"))
          objc_msgSend(v4, "addObject:", v17);
        v13 &= v16;

      }
      v11 = -[NSSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    }
    while (v11);
    v18 = v13 ^ 1;
  }
  else
  {
    v18 = 0;
  }

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:selector:", 0, 1, sel_localizedCompare_);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sortedArrayUsingDescriptors:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "count");
  v23 = v21;
  v24 = v23;
  if (v22 == 2)
  {
    objc_msgSend(v23, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("PGRecurrentTripMemoryTitleFormatWithLocation %@ otherLocation %@"), CFSTR("PGRecurrentTripMemoryTitleFormatWithLocation %@ otherLocation %@"), CFSTR("Localizable"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringWithFormat:", v34, v30, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_27:
    v29 = v24;
LABEL_28:

    if (v35)
    {
      +[PGCommonTitleUtility titleWithLineBreakForTitle:andUsedNames:](PGCommonTitleUtility, "titleWithLineBreakForTitle:andUsedNames:", v35, v29);
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v27, 4);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
      v28 = 0;
    }
    goto LABEL_31;
  }
  if (v22 == 1)
  {
    objc_msgSend(v23, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v37;
    if (((v18 | v42) & 1) != 0)
      v38 = CFSTR("PGRecurrentTripMemoryTitleFormatWithLocation %@");
    else
      v38 = CFSTR("PGRecurrentTripMemoryTitleFormatInSupersetWithLocation %@");
    objc_msgSend(v37, "localizedStringForKey:value:table:", v38, v38, CFSTR("Localizable"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringWithFormat:", v33, v30);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (v22)
  {
    objc_msgSend(v23, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "lastObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v30;
    v49[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v39 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("PGRecurrentTripMemoryTitleFormatWithFromLocation %@ toLocation %@"), CFSTR("PGRecurrentTripMemoryTitleFormatWithFromLocation %@ toLocation %@"), CFSTR("Localizable"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "localizedStringWithFormat:", v40, v30, v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_28;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "loggingConnection");
  v26 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1CA237000, v26, OS_LOG_TYPE_ERROR, "RecurrentTripTitle requires at least one location node", buf, 2u);
  }

  v27 = 0;
  v28 = 0;
  v29 = v24;
LABEL_31:

  return v28;
}

- (id)_timeTitle
{
  PGTimeTitleOptions *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTimeTitleOptions setAllowedFormats:](v2, "setAllowedFormats:", 16);
  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v3, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSSet)locationNodes
{
  return self->_locationNodes;
}

- (void)setLocationNodes:(id)a3
{
  objc_storeStrong((id *)&self->_locationNodes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationNodes, 0);
}

@end
