@implementation PGHighlightsTitleSpecFactory

+ (id)specCollectionForMeaningLabel:(id)a3 allowAllCities:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "orderedHighlightTitleSpecTypesForMeaningLabel:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "unsignedIntegerValue"))
        {
          case 0:
            objc_msgSend(a1, "specPoolForPublicEvent");
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 1:
            objc_msgSend(a1, "specPoolForPublicEventWithBusiness");
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 2:
            objc_msgSend(a1, "specPoolForBusinessItem");
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 3:
            objc_msgSend(a1, "specPoolForGenericLocation:", v4);
            v13 = objc_claimAutoreleasedReturnValue();
            goto LABEL_12;
          case 4:
            objc_msgSend(a1, "specPoolForAOILocation");
            v13 = objc_claimAutoreleasedReturnValue();
LABEL_12:
            v14 = (void *)v13;
            objc_msgSend(v7, "addObject:", v13);
            goto LABEL_16;
          case 5:
            objc_msgSend(a1, "specPoolsForBirthdayIncludingLocationIfPossible:allowAllCities:", 0, v4);
            v15 = objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          case 6:
            objc_msgSend(a1, "specPoolsForHolidayEventIncludingLocationIfPossible:allowAllCities:", 1, v4);
            v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
            v14 = (void *)v15;
            objc_msgSend(v7, "addObjectsFromArray:", v15);
LABEL_16:

            break;
          default:
            break;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }
  +[PGTitleSpecCollection collectionWithSpecPools:](PGTitleSpecCollection, "collectionWithSpecPools:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)specPoolForPublicEventWithBusiness
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PGTitleSpec *v9;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@ - %@"), 0);
  +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:](PGTitleSpecPublicEventArgument, "argumentWithPublicEventType:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:](PGTitleSpecPublicEventArgument, "argumentWithPublicEventType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v5);

  v9 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)specPoolForPublicEvent
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PGTitleSpec *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 0);
  +[PGTitleSpecPublicEventArgument argumentWithPublicEventType:shouldUseLongPublicEventTitle:](PGTitleSpecPublicEventArgument, "argumentWithPublicEventType:shouldUseLongPublicEventTitle:", 0, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v4);

  v8 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)specPoolForBusinessItem
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PGTitleSpec *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 4);
  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineBreakBehavior:", 2);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v4);

  -[PGTitleSpec setHasSpecArgumentHandlingLineBreakBehavior:](v2, "setHasSpecArgumentHandlingLineBreakBehavior:", 1);
  v8 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)specPoolForGenericLocation:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "titleSpecForGenericLocation:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)titleSpecForGenericLocation:(BOOL)a3
{
  _BOOL4 v3;
  PGTitleSpec *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v3 = a3;
  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 4);
  if (v3)
    v5 = 481;
  else
    v5 = 353;
  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLineBreakBehavior:", 2);
  v9[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v4, "setArguments:", v7);

  -[PGTitleSpec setHasSpecArgumentHandlingLineBreakBehavior:](v4, "setHasSpecArgumentHandlingLineBreakBehavior:", 1);
  return v4;
}

+ (id)specPoolForAOILocation
{
  PGTitleSpec *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PGTitleSpec *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = -[PGTitleSpec initWithFormat:titleCategory:]([PGTitleSpec alloc], "initWithFormat:titleCategory:", CFSTR("%@"), 4);
  +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 8, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLineBreakBehavior:", 2);
  v9[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v2, "setArguments:", v4);

  -[PGTitleSpec setHasSpecArgumentHandlingLineBreakBehavior:](v2, "setHasSpecArgumentHandlingLineBreakBehavior:", 1);
  v8 = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)specPoolsForBirthdayIncludingLocationIfPossible:(BOOL)a3 allowAllCities:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  PGTitleSpec *v7;
  void *v8;
  void *v9;
  PGTitleSpec *v10;
  PGTitleSpec *v11;
  void *v12;
  void *v13;
  void *v14;
  PGTitleSpec *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  PGTitleSpec *v25;
  void *v26;
  void *v27;
  PGTitleSpec *v28;
  void *v29;
  void *v30;
  PGTitleSpec *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PGTitleSpec *v41;
  _BOOL4 v42;
  void *v43;
  _BOOL4 v44;
  PGTitleSpec *v45;
  PGTitleSpec *v46;
  void *v47;
  _QWORD v48[3];
  _QWORD v49[5];
  PGTitleSpec *v50;
  PGTitleSpec *v51;
  _QWORD v52[2];
  _QWORD v53[3];
  void *v54;
  PGTitleSpec *v55;
  PGTitleSpec *v56;
  uint64_t v57;
  _QWORD v58[4];

  v42 = a4;
  v44 = a3;
  v58[2] = *MEMORY[0x1E0C80C00];
  +[PGTitleSpecPeopleArgument argumentWithPeopleType:](PGTitleSpecPeopleArgument, "argumentWithPeopleType:", 4);
  v5 = objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecTimeArgument argumentWithTimeType:](PGTitleSpecTimeArgument, "argumentWithTimeType:", 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@"), CFSTR("PGPeopleBirthdayTitleFormatWithName %@ ordinalYearsString %@"), CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PGTitleSpec initWithFormat:titleCategory:](v7, "initWithFormat:titleCategory:", v9, 3);

  v11 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)v6;
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PGPeopleBirthdayTitleFormatWithName %@"), CFSTR("PGPeopleBirthdayTitleFormatWithName %@"), CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PGTitleSpec initWithFormat:titleCategory:](v11, "initWithFormat:titleCategory:", v14, 3);

  v16 = (void *)v5;
  v58[0] = v5;
  v58[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v10, "setArguments:", v17);

  v57 = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTitleSpec setArguments:](v15, "setArguments:", v18);

  v46 = v10;
  v56 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = v15;
  v55 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v21);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "titleSpecForGenericLocation:", v42);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v54, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
  {
    v25 = [PGTitleSpec alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PGPeopleBirthdayTitleFormatWithLocation %@ name %@ ordinalYearsString %@"), CFSTR("PGPeopleBirthdayTitleFormatWithLocation %@ name %@ ordinalYearsString %@"), CFSTR("Localizable"));
    v43 = v20;
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = -[PGTitleSpec initWithFormat:titleCategory:](v25, "initWithFormat:titleCategory:", v27, 3);

    v28 = [PGTitleSpec alloc];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("PGPeopleBirthdayTitleFormatWithLocation %@ andName %@"), CFSTR("PGPeopleBirthdayTitleFormatWithLocation %@ andName %@"), CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = -[PGTitleSpec initWithFormat:titleCategory:](v28, "initWithFormat:titleCategory:", v30, 4);

    +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v53[0] = v32;
    v53[1] = v5;
    v53[2] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleSpec setArguments:](v41, "setArguments:", v33);

    v52[0] = v32;
    v52[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 2);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleSpec setArguments:](v31, "setArguments:", v34);

    v51 = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v50, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = (void *)v5;
    v49[0] = v36;
    v49[1] = v38;
    v49[2] = v43;
    v49[3] = v47;
    v49[4] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 5);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v43;
  }
  else
  {
    v48[0] = v20;
    v48[1] = v47;
    v48[2] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v39;
}

+ (id)specPoolsForHolidayEventIncludingLocationIfPossible:(BOOL)a3 allowAllCities:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[3];
  void *v20;
  void *v21;
  _QWORD v22[2];

  v4 = a4;
  v5 = a3;
  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "titleSpecForHolidayEventIncludingLocationIfPossible:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "titleSpecForGenericLocation:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v21, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "titleSpecForHolidayEventIncludingLocationIfPossible:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGTitleSpecPool poolWithSpecs:](PGTitleSpecPool, "poolWithSpecs:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v19[0] = v9;
    v19[1] = v15;
    v19[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18[0] = v9;
    v18[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (id)titleSpecForHolidayEventIncludingLocationIfPossible:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  PGTitleSpec *v5;
  void *v6;
  void *v7;
  void *v8;
  PGTitleSpec *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  _QWORD v15[3];

  v3 = a3;
  v15[2] = *MEMORY[0x1E0C80C00];
  +[PGTitleSpecTimeArgument argumentWithTimeType:](PGTitleSpecTimeArgument, "argumentWithTimeType:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [PGTitleSpec alloc];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PGLocalizedHolidayLocation %@ holidayEventName %@"), CFSTR("PGLocalizedHolidayLocation %@ holidayEventName %@"), CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PGTitleSpec initWithFormat:titleCategory:](v5, "initWithFormat:titleCategory:", v8, 0);

    +[PGTitleSpecLocationArgument argumentWithLocationType:filterLocations:](PGTitleSpecLocationArgument, "argumentWithLocationType:filterLocations:", 1, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    v15[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleSpec setArguments:](v9, "setArguments:", v11);

  }
  else
  {
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PGLocalizedHolidayEventName %@"), CFSTR("PGLocalizedHolidayEventName %@"), CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PGTitleSpec initWithFormat:titleCategory:](v5, "initWithFormat:titleCategory:", v12, 0);

    v14 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleSpec setArguments:](v9, "setArguments:", v10);
  }

  return v9;
}

+ (id)orderedHighlightTitleSpecTypesForMeaningLabel:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = orderedHighlightTitleSpecTypesForMeaningLabel__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&orderedHighlightTitleSpecTypesForMeaningLabel__onceToken, &__block_literal_global_31979);
  objc_msgSend((id)orderedHighlightTitleSpecTypesForMeaningLabel__specTypesByMeaningLabel, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __78__PGHighlightsTitleSpecFactory_orderedHighlightTitleSpecTypesForMeaningLabel___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[27];
  _QWORD v4[28];

  v4[27] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Activity");
  v3[1] = CFSTR("Hiking");
  v4[0] = &unk_1E84E9BB0;
  v4[1] = &unk_1E84E9BB0;
  v3[2] = CFSTR("Climbing");
  v3[3] = CFSTR("Beaching");
  v4[2] = &unk_1E84E9BB0;
  v4[3] = &unk_1E84E9BB0;
  v3[4] = CFSTR("Diving");
  v3[5] = CFSTR("WinterSport");
  v4[4] = &unk_1E84E9BB0;
  v4[5] = &unk_1E84E9BB0;
  v3[6] = CFSTR("Entertainment");
  v3[7] = CFSTR("Theater");
  v4[6] = &unk_1E84E9BC8;
  v4[7] = &unk_1E84E9BC8;
  v3[8] = CFSTR("Dance");
  v3[9] = CFSTR("AmusementPark");
  v4[8] = &unk_1E84E9BC8;
  v4[9] = &unk_1E84E9BC8;
  v3[10] = CFSTR("SportEvent");
  v3[11] = CFSTR("Performance");
  v4[10] = &unk_1E84E9BC8;
  v4[11] = &unk_1E84E9BC8;
  v3[12] = CFSTR("Concert");
  v3[13] = CFSTR("Festival");
  v4[12] = &unk_1E84E9BC8;
  v4[13] = &unk_1E84E9BC8;
  v3[14] = CFSTR("NightOut");
  v3[15] = CFSTR("Museum");
  v4[14] = &unk_1E84E9BE0;
  v4[15] = &unk_1E84E9BC8;
  v3[16] = CFSTR("Celebration");
  v3[17] = CFSTR("Birthday");
  v4[16] = &unk_1E84E9B98;
  v4[17] = &unk_1E84E9C28;
  v3[18] = CFSTR("Anniversary");
  v3[19] = CFSTR("Wedding");
  v4[18] = &unk_1E84E9B98;
  v4[19] = &unk_1E84E9B98;
  v3[20] = CFSTR("HolidayEvent");
  v3[21] = CFSTR("Restaurant");
  v4[20] = &unk_1E84E9C40;
  v4[21] = &unk_1E84E9BF8;
  v3[22] = CFSTR("Breakfast");
  v3[23] = CFSTR("Lunch");
  v4[22] = &unk_1E84E9BF8;
  v4[23] = &unk_1E84E9BF8;
  v3[24] = CFSTR("Dinner");
  v3[25] = CFSTR("Gathering");
  v4[24] = &unk_1E84E9BF8;
  v4[25] = &unk_1E84E9B98;
  objc_msgSend(MEMORY[0x1E0D4B228], "appleEvents");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v3[26] = v0;
  v4[26] = &unk_1E84E9C10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 27);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)orderedHighlightTitleSpecTypesForMeaningLabel__specTypesByMeaningLabel;
  orderedHighlightTitleSpecTypesForMeaningLabel__specTypesByMeaningLabel = v1;

}

@end
