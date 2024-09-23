@implementation PKSeatingInformation

- (PKSeatingInformation)init
{

  return 0;
}

- (id)initFromSemantic:(id)a3
{
  id v4;
  PKSeatingInformation *v5;
  void *v6;
  int v7;
  id result;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSArray *allSeats;
  PKSeatingInformation *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PKSeatingInformation;
  v5 = -[PKSeatingInformation init](&v24, sel_init);
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v4, "semanticKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(CFSTR("seats"), "isEqualToString:", v6);

  if (!v7)
    goto LABEL_18;
  objc_msgSend(v4, "dictionariesValue");
  result = (id)objc_claimAutoreleasedReturnValue();
  if (result)
  {
    v9 = result;
    v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = +[PKSeat createFromDictionary:](PKSeat, "createFromDictionary:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15), (_QWORD)v20);
          if (v16)
          {
            if ((objc_msgSend(v10, "containsObject:", v16) & 1) == 0)
              objc_msgSend(v10, "addObject:", v16);
          }

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v10, "count"))
    {
      v17 = objc_msgSend(v10, "copy");
      allSeats = v5->_allSeats;
      v5->_allSeats = (NSArray *)v17;

LABEL_16:
      v19 = v5;
LABEL_19:

      return v19;
    }

LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

- (id)initFromSemantics:(id)a3
{
  id v4;
  PKSeatingInformation *v5;
  PKSeatingInformation *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  NSArray *allSeats;
  PKSeatingInformation *v20;
  PKSeatingInformation *v22;
  id v23;
  id obj;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKSeatingInformation;
  v5 = -[PKSeatingInformation init](&v34, sel_init);
  v6 = v5;
  if (v5)
  {
    v22 = v5;
    v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v23 = v4;
    obj = v4;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    if (v8)
    {
      v9 = v8;
      v25 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v31 != v25)
            objc_enumerationMutation(obj);
          v11 = -[PKSeatingInformation initFromSemantic:]([PKSeatingInformation alloc], "initFromSemantic:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
          objc_msgSend(v11, "allSeats");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            v28 = 0u;
            v29 = 0u;
            v26 = 0u;
            v27 = 0u;
            v13 = v12;
            v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v27;
              do
              {
                for (j = 0; j != v15; ++j)
                {
                  if (*(_QWORD *)v27 != v16)
                    objc_enumerationMutation(v13);
                  v18 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
                  if (!-[NSArray containsObject:](v7, "containsObject:", v18, v22))
                    -[NSArray addObject:](v7, "addObject:", v18);
                }
                v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
              }
              while (v15);
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
      }
      while (v9);
    }

    if (!-[NSArray count](v7, "count"))
    {

      v20 = 0;
      v6 = v22;
      v4 = v23;
      goto LABEL_24;
    }
    v6 = v22;
    allSeats = v22->_allSeats;
    v22->_allSeats = v7;

    v4 = v23;
  }
  v20 = v6;
LABEL_24:

  return v20;
}

- (PKSeat)firstSeat
{
  return (PKSeat *)-[NSArray firstObject](self->_allSeats, "firstObject");
}

- (id)firstSeatContainingAttributes:(unint64_t)a3
{
  NSArray *allSeats;
  _QWORD v5[5];

  allSeats = self->_allSeats;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PKSeatingInformation_firstSeatContainingAttributes___block_invoke;
  v5[3] = &__block_descriptor_40_e16_B16__0__PKSeat_8l;
  v5[4] = a3;
  -[NSArray pk_firstObjectPassingTest:](allSeats, "pk_firstObjectPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __54__PKSeatingInformation_firstSeatContainingAttributes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsAttributes:", *(_QWORD *)(a1 + 32));
}

- (id)seatsContainingAttributes:(unint64_t)a3
{
  NSArray *allSeats;
  _QWORD v5[5];

  allSeats = self->_allSeats;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__PKSeatingInformation_seatsContainingAttributes___block_invoke;
  v5[3] = &__block_descriptor_40_e23_B32__0__PKSeat_8Q16_B24l;
  v5[4] = a3;
  -[NSArray pk_objectsPassingTest:](allSeats, "pk_objectsPassingTest:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __50__PKSeatingInformation_seatsContainingAttributes___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "containsAttributes:", *(_QWORD *)(a1 + 32));
}

- (BOOL)hasMultipleSections
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;

  -[PKSeatingInformation _allLevels](self, "_allLevels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") > 1)
  {
    v5 = 1;
  }
  else
  {
    -[PKSeatingInformation _allSections](self, "_allSections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      -[PKSeatingInformation _allRows](self, "_allRows");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (unint64_t)objc_msgSend(v6, "count") > 1;

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (unint64_t)seatInfoItemsCount
{
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;

  -[PKSeatingInformation displayableAllSectionsString](self, "displayableAllSectionsString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSeatingInformation displayableAllRowsString](self, "displayableAllRowsString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 1;
  if (v3)
    v5 = 2;
  if (v4)
    v6 = v5;
  else
    v6 = v3 != 0;
  -[PKSeatingInformation displayableAllSectionsColor](self, "displayableAllSectionsColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = v6 + 1;
  else
    v8 = v6;
  -[PKSeatingInformation displayableAllSeatsString](self, "displayableAllSeatsString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SEATS"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11
      || (PKLocalizedTicketingString(CFSTR("LOCALIZED_NUMBER_RANGE_FORMAT"), 0),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v9, "componentsSeparatedByString:", v12),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "count"),
          v13,
          v12,
          v14 == 2))
    {
      v8 += 2;
    }
    else
    {
      PKLocalizedTicketingString(CFSTR("LOCALIZED_LIST_DELIMITER_NO_SPACE"), 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "componentsSeparatedByString:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "count"))
        v17 = objc_msgSend(v16, "count");
      else
        v17 = 1;
      v8 += v17;

    }
  }

  return v8;
}

- (id)displayableAllSeatsString
{
  void *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  -[PKSeatingInformation seatsContainingAttributes:](self, "seatsContainingAttributes:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (!v4)
  {
    v7 = 0;
    goto LABEL_9;
  }
  if (v4 == 1)
  {
    objc_msgSend(v3, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "designation");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v4 >= 5)
    {
      PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SEATS"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    -[PKSeatingInformation _allLevels](self, "_allLevels");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      -[PKSeatingInformation _allSections](self, "_allSections");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v9, "count") < 2)
      {
        -[PKSeatingInformation _allRows](self, "_allRows");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v10, "count") < 2)
        {
          if (_MergedGlobals_289 != -1)
            dispatch_once(&_MergedGlobals_289, &__block_literal_global_151_1);
          v32 = v10;
          v33 = v9;
          v34 = v5;
          v11 = (id)qword_1ECF22CB0;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v12 = v3;
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v38;
            LOBYTE(v16) = 1;
            LOBYTE(v17) = 1;
            do
            {
              for (i = 0; i != v14; ++i)
              {
                if (*(_QWORD *)v38 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "designation");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v11, "numberFromString:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();

                v16 = (v20 == 0) & v16;
                v17 = (v20 != 0) & v17;

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            }
            while (v14);
          }
          else
          {
            v16 = 1;
            v17 = 1;
          }

          objc_msgSend(v12, "pk_arrayByApplyingBlock:", &__block_literal_global_222);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)objc_msgSend(v21, "mutableCopy");

          if (v17)
          {
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __49__PKSeatingInformation_displayableAllSeatsString__block_invoke_2;
            v35[3] = &unk_1E2ADCC98;
            v23 = v11;
            v36 = v23;
            objc_msgSend(v22, "sortUsingComparator:", v35);
            objc_msgSend(v22, "firstObject");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "lastObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "numberFromString:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "integerValue");

            objc_msgSend(v23, "numberFromString:", v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "integerValue");

            if (v29 - v27 == objc_msgSend(v22, "count") - 1)
            {
              PKLocalizedTicketingString(CFSTR("LOCALIZED_NUMBER_RANGE_FORMAT"), CFSTR("%@%@"), v24, v25);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              PKLocalizedTicketingString(CFSTR("LOCALIZED_LIST_DELIMITER_NO_SPACE"), 0);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "componentsJoinedByString:", v31);
              v7 = (void *)objc_claimAutoreleasedReturnValue();

            }
            v9 = v33;
            v5 = v34;
            v10 = v32;

          }
          else
          {
            if (v16)
            {
              objc_msgSend(v22, "sortUsingComparator:", &__block_literal_global_78_0);
              PKLocalizedTicketingString(CFSTR("LOCALIZED_LIST_DELIMITER_NO_SPACE"), 0);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "componentsJoinedByString:", v30);
              v7 = (void *)objc_claimAutoreleasedReturnValue();

            }
            else
            {
              PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SEATS"), 0);
              v7 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v9 = v33;
            v5 = v34;
            v10 = v32;
          }

        }
        else
        {
          PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SEATS"), 0);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
        }

      }
      else
      {
        PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SEATS"), 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_5;
    }
    PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SEATS"), 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
LABEL_5:

LABEL_9:
  return v7;
}

uint64_t __49__PKSeatingInformation_displayableAllSeatsString__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "designation");
}

uint64_t __49__PKSeatingInformation_displayableAllSeatsString__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "numberFromString:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "numberFromString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

uint64_t __49__PKSeatingInformation_displayableAllSeatsString__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localizedCompare:");
}

- (id)displayableAllRowsString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PKSeatingInformation _allLevels](self, "_allLevels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    -[PKSeatingInformation _allSections](self, "_allSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      -[PKSeatingInformation _allRows](self, "_allRows");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        if (objc_msgSend(v6, "count") == 1)
          objc_msgSend(v7, "anyObject");
        else
          PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_ROWS"), 0);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }

    }
    else
    {
      PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_ROWS"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_ROWS"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)displayableAllSectionsString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PKSeatingInformation _allLevels](self, "_allLevels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v3, "count") < 2)
  {
    -[PKSeatingInformation _allSections](self, "_allSections");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if (objc_msgSend(v5, "count") == 1)
        objc_msgSend(v6, "anyObject");
      else
        PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SECTIONS"), 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }

  }
  else
  {
    PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_SECTIONS"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)displayableAllAislesString
{
  void *v2;
  void *v3;
  void *v4;

  -[PKSeatingInformation _allAisles](self, "_allAisles");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "count") == 1)
      objc_msgSend(v3, "anyObject");
    else
      PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_AISLES"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)displayableAllLevelsString
{
  void *v2;
  void *v3;
  void *v4;

  -[PKSeatingInformation _allLevels](self, "_allLevels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "count") == 1)
      objc_msgSend(v3, "anyObject");
    else
      PKLocalizedTicketingString(CFSTR("LABEL_MULTIPLE_LEVELS"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)displayableAllSectionsColor
{
  void *v2;
  void *v3;
  void *v4;

  -[PKSeatingInformation _allSectionColors](self, "_allSectionColors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "count") == 1)
  {
    objc_msgSend(v3, "anyObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)changeMessageFromInformation:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(a3, "firstSeat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSeatingInformation firstSeat](self, "firstSeat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v4 || !v5)
  {
    if (v5 == v4)
      goto LABEL_4;
LABEL_6:
    v8 = objc_msgSend(v6, "diffFromSeat:", v4);
    v9 = v8 & 0x1F;
    objc_msgSend(v6, "designation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "row");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "section");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "aisle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "level");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v10 && v9 == 1)
    {
      PKLocalizedTicketingString(CFSTR("SEMANTICS_SEATS_DESIGNATION_CHANGE_MESSAGE"), CFSTR("%@"), v10);
    }
    else if (v11 && v9 == 2)
    {
      PKLocalizedTicketingString(CFSTR("SEMANTICS_SEATS_ROW_CHANGE_MESSAGE"), CFSTR("%@"), v11);
    }
    else if (v12 && v9 == 4)
    {
      PKLocalizedTicketingString(CFSTR("SEMANTICS_SEATS_SECTION_CHANGE_MESSAGE"), CFSTR("%@"), v12);
    }
    else if (v13 && v9 == 8)
    {
      PKLocalizedTicketingString(CFSTR("SEMANTICS_SEATS_AISLE_CHANGE_MESSAGE"), CFSTR("%@"), v12);
    }
    else
    {
      if (!v14 || v9 != 16)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (v15 && (v8 & 0x10) != 0)
        {
          PKLocalizedTicketingString(CFSTR("SEAT_LEVEL"), CFSTR("%@"), v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v18);

        }
        if (v13 && (v8 & 8) != 0)
        {
          PKLocalizedTicketingString(CFSTR("SEAT_AISLE"), CFSTR("%@"), v13);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v19);

        }
        if (v12 && (v8 & 4) != 0)
        {
          PKLocalizedTicketingString(CFSTR("SEAT_SECTION"), CFSTR("%@"), v12);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v20);

        }
        if (v11 && (v8 & 2) != 0)
        {
          PKLocalizedTicketingString(CFSTR("SEAT_ROW"), CFSTR("%@"), v11);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v21);

        }
        if (v10 && (v8 & 1) != 0)
        {
          PKLocalizedTicketingString(CFSTR("SEAT_NUMBER"), CFSTR("%@"), v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v22);

        }
        PKLocalizedTicketingString(CFSTR("LOCALIZED_LIST_DELIMITER_WITH_SPACE"), 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", v23);
        v25 = v17;
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        PKLocalizedTicketingString(CFSTR("SEMANTICS_SEATS_MANY_CHANGE_MESSAGE"), CFSTR("%@"), v24);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_22;
      }
      PKLocalizedTicketingString(CFSTR("SEMANTICS_SEATS_LEVEL_CHANGE_MESSAGE"), CFSTR("%@"), v14);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  if ((objc_msgSend(v5, "isEqual:", v4) & 1) == 0)
    goto LABEL_6;
LABEL_4:
  v7 = 0;
LABEL_23:

  return v7;
}

- (id)_allSections
{
  void *v2;
  void *v3;

  -[PKSeatingInformation seatsContainingAttributes:](self, "seatsContainingAttributes:", 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_113_0);
  else
    v3 = 0;

  return v3;
}

uint64_t __36__PKSeatingInformation__allSections__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "section");
}

- (id)_allRows
{
  void *v2;
  void *v3;

  -[PKSeatingInformation seatsContainingAttributes:](self, "seatsContainingAttributes:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_114_0);
  else
    v3 = 0;

  return v3;
}

uint64_t __32__PKSeatingInformation__allRows__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "row");
}

- (id)_allAisles
{
  void *v2;
  void *v3;

  -[PKSeatingInformation seatsContainingAttributes:](self, "seatsContainingAttributes:", 8);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_115_0);
  else
    v3 = 0;

  return v3;
}

uint64_t __34__PKSeatingInformation__allAisles__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "aisle");
}

- (id)_allLevels
{
  void *v2;
  void *v3;

  -[PKSeatingInformation seatsContainingAttributes:](self, "seatsContainingAttributes:", 16);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_116_0);
  else
    v3 = 0;

  return v3;
}

uint64_t __34__PKSeatingInformation__allLevels__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "level");
}

- (id)_allSectionColors
{
  void *v2;
  void *v3;

  -[PKSeatingInformation seatsContainingAttributes:](self, "seatsContainingAttributes:", 64);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
    v3 = (void *)objc_msgSend(v2, "pk_createSetByApplyingBlock:", &__block_literal_global_118);
  else
    v3 = 0;

  return v3;
}

uint64_t __41__PKSeatingInformation__allSectionColors__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sectionColor");
}

- (NSArray)allSeats
{
  return self->_allSeats;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allSeats, 0);
}

@end
