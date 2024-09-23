@implementation PKFelicaShinkansenTicket

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaShinkansenTicket)init
{

  return 0;
}

- (PKFelicaShinkansenTicket)initWithDictionary:(id)a3
{
  id v4;
  PKFelicaShinkansenTicket *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  PKFelicaShinkansenTrain *v12;
  uint64_t v13;
  NSArray *trains;
  PKFelicaShinkansenTicket *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSNumber *validityStartDate;
  void *v20;
  uint64_t v21;
  NSNumber *validityTerm;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v28.receiver = self;
    v28.super_class = (Class)PKFelicaShinkansenTicket;
    v5 = -[PKFelicaShinkansenTicket init](&v28, sel_init);
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFTrains"), 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v25;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v25 != v10)
              objc_enumerationMutation(v7);
            v12 = -[PKFelicaShinkansenTrain initWithDictionary:]([PKFelicaShinkansenTrain alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i));
            if (v12)
              objc_msgSend(v6, "addObject:", v12);

          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        }
        while (v9);
      }

      if (objc_msgSend(v6, "count"))
      {
        v13 = objc_msgSend(v6, "copy");
        trains = v5->_trains;
        v5->_trains = (NSArray *)v13;
      }
      else
      {
        trains = v5->_trains;
        v5->_trains = 0;
      }

      v16 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFValidityStartDate"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "numberWithInteger:", IntegerFromFelicaDateFormat(v17));
      v18 = objc_claimAutoreleasedReturnValue();
      validityStartDate = v5->_validityStartDate;
      v5->_validityStartDate = (NSNumber *)v18;

      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NFValidityTerm"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "copy");
      validityTerm = v5->_validityTerm;
      v5->_validityTerm = (NSNumber *)v21;

    }
    self = v5;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (PKFelicaShinkansenTicket)initWithCoder:(id)a3
{
  id v4;
  PKFelicaShinkansenTicket *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *trains;
  uint64_t v11;
  NSNumber *validityStartDate;
  uint64_t v13;
  NSNumber *validityTerm;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PKFelicaShinkansenTicket;
  v5 = -[PKFelicaShinkansenTicket init](&v16, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("trains"));
    v9 = objc_claimAutoreleasedReturnValue();
    trains = v5->_trains;
    v5->_trains = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validityStartDate"));
    v11 = objc_claimAutoreleasedReturnValue();
    validityStartDate = v5->_validityStartDate;
    v5->_validityStartDate = (NSNumber *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validityTerm"));
    v13 = objc_claimAutoreleasedReturnValue();
    validityTerm = v5->_validityTerm;
    v5->_validityTerm = (NSNumber *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *trains;
  id v5;

  trains = self->_trains;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", trains, CFSTR("trains"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validityStartDate, CFSTR("validityStartDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_validityTerm, CFSTR("validityTerm"));

}

- (NSArray)trains
{
  return self->_trains;
}

- (NSNumber)validityStartDate
{
  return self->_validityStartDate;
}

- (NSNumber)validityTerm
{
  return self->_validityTerm;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validityTerm, 0);
  objc_storeStrong((id *)&self->_validityStartDate, 0);
  objc_storeStrong((id *)&self->_trains, 0);
}

@end
