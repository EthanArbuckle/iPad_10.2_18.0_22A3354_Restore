@implementation PKPassSemantic

- (BOOL)hasValue
{
  return self->_stringValue
      || self->_dateValue
      || self->_eventDateInfoValue
      || self->_numberValue
      || self->_locationValue
      || self->_currencyAmountValue
      || self->_personNameComponentsValue
      || self->_stringsValue
      || self->_dictionariesValue != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassSemantic)initWithCoder:(id)a3
{
  id v4;
  PKPassSemantic *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPassSemantic;
  v5 = -[PKPassSemantic init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("semanticKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setSemanticKey:](v5, "setSemanticKey:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fieldKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setFieldKey:](v5, "setFieldKey:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("stringValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setStringValue:](v5, "setStringValue:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateValue"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setDateValue:](v5, "setDateValue:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventDateInfoValue"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setEventDateInfoValue:](v5, "setEventDateInfoValue:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("numberValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setNumberValue:](v5, "setNumberValue:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationValue"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setLocationValue:](v5, "setLocationValue:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyAmountValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setCurrencyAmountValue:](v5, "setCurrencyAmountValue:", v13);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("personNameComponentsValue"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setPersonNameComponentsValue:](v5, "setPersonNameComponentsValue:", v14);

    v15 = (void *)MEMORY[0x1E0C99E60];
    v16 = objc_opt_class();
    objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("stringsValue"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setStringsValue:](v5, "setStringsValue:", v18);

    v19 = objc_alloc(MEMORY[0x1E0C99E20]);
    v20 = objc_opt_class();
    v21 = (void *)objc_msgSend(v19, "initWithObjects:", v20, objc_opt_class(), 0);
    objc_msgSend((id)objc_opt_class(), "_supportedDictionaryValueTypes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addObjectsFromArray:", v22);

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v21, CFSTR("dictionariesValue"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPassSemantic setDictionariesValue:](v5, "setDictionariesValue:", v23);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  -[PKPassSemantic semanticKey](self, "semanticKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("semanticKey"));

  -[PKPassSemantic fieldKey](self, "fieldKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fieldKey"));

  -[PKPassSemantic stringValue](self, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("stringValue"));

  -[PKPassSemantic dateValue](self, "dateValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("dateValue"));

  -[PKPassSemantic eventDateInfoValue](self, "eventDateInfoValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("eventDateInfoValue"));

  -[PKPassSemantic numberValue](self, "numberValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("numberValue"));

  -[PKPassSemantic locationValue](self, "locationValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("locationValue"));

  -[PKPassSemantic currencyAmountValue](self, "currencyAmountValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("currencyAmountValue"));

  -[PKPassSemantic personNameComponentsValue](self, "personNameComponentsValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("personNameComponentsValue"));

  -[PKPassSemantic stringsValue](self, "stringsValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("stringsValue"));

  -[PKPassSemantic dictionariesValue](self, "dictionariesValue");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v15, CFSTR("dictionariesValue"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p>, "), objc_opt_class(), self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  if (self->_stringValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("string: %@"), self->_stringValue);
  }
  else if (self->_dateValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("date: %@"), self->_dateValue);
  }
  else if (self->_eventDateInfoValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("eventDateInfo: %@"), self->_eventDateInfoValue);
  }
  else if (self->_numberValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("number: %@"), self->_numberValue);
  }
  else if (self->_locationValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("location: %@"), self->_locationValue);
  }
  else if (self->_currencyAmountValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("currencyAmount: %@"), self->_currencyAmountValue);
  }
  else if (self->_personNameComponentsValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("personNameComponents: %@"), self->_personNameComponentsValue);
  }
  else if (self->_stringsValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("strings: %@"), self->_stringsValue);
  }
  else if (self->_dictionariesValue)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("dictionaries: %@"), self->_dictionariesValue);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("no value"), v8);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  NSString *fieldKey;
  uint64_t v9;
  void *v10;
  NSDate *dateValue;
  uint64_t v12;
  void *v13;
  PKEventDateInfo *eventDateInfoValue;
  uint64_t v15;
  void *v16;
  NSNumber *numberValue;
  uint64_t v18;
  void *v19;
  NSString *semanticKey;
  uint64_t v21;
  void *v22;
  NSString *stringValue;
  uint64_t v24;
  void *v25;
  NSArray *stringsValue;
  uint64_t v27;
  void *v28;
  NSArray *v29;
  void *v30;
  char v31;
  PKLocation *locationValue;
  uint64_t v33;
  void *v34;
  PKLocation *v35;
  void *v36;
  BOOL v37;
  NSArray *dictionariesValue;
  uint64_t v39;
  PKCurrencyAmount *currencyAmountValue;
  uint64_t v41;
  NSPersonNameComponents *personNameComponentsValue;
  uint64_t v43;
  void *v44;
  char v45;
  void *v47;
  void *v48;
  void *v49;
  void *v50;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v7 = v6;
  if (v6)
  {
    fieldKey = self->_fieldKey;
    objc_msgSend(v6, "fieldKey");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (fieldKey && v9)
    {
      if ((-[NSString isEqual:](fieldKey, "isEqual:", v9) & 1) != 0)
      {
LABEL_8:
        dateValue = self->_dateValue;
        objc_msgSend(v7, "dateValue");
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = (void *)v12;
        if (dateValue && v12)
        {
          if ((-[NSDate isEqual:](dateValue, "isEqual:", v12) & 1) != 0)
          {
LABEL_11:
            eventDateInfoValue = self->_eventDateInfoValue;
            objc_msgSend(v7, "eventDateInfoValue");
            v15 = objc_claimAutoreleasedReturnValue();
            v16 = (void *)v15;
            if (eventDateInfoValue && v15)
            {
              if ((-[PKEventDateInfo isEqual:](eventDateInfoValue, "isEqual:", v15) & 1) != 0)
              {
LABEL_14:
                numberValue = self->_numberValue;
                objc_msgSend(v7, "numberValue");
                v18 = objc_claimAutoreleasedReturnValue();
                v19 = (void *)v18;
                if (numberValue && v18)
                {
                  if ((-[NSNumber isEqual:](numberValue, "isEqual:", v18) & 1) != 0)
                  {
LABEL_17:
                    semanticKey = self->_semanticKey;
                    objc_msgSend(v7, "semanticKey");
                    v21 = objc_claimAutoreleasedReturnValue();
                    v22 = (void *)v21;
                    if (semanticKey && v21)
                    {
                      if ((-[NSString isEqual:](semanticKey, "isEqual:", v21) & 1) != 0)
                      {
LABEL_20:
                        stringValue = self->_stringValue;
                        objc_msgSend(v7, "stringValue");
                        v24 = objc_claimAutoreleasedReturnValue();
                        v25 = (void *)v24;
                        if (stringValue && v24)
                        {
                          if ((-[NSString isEqual:](stringValue, "isEqual:", v24) & 1) != 0)
                          {
LABEL_23:
                            stringsValue = self->_stringsValue;
                            objc_msgSend(v7, "stringsValue");
                            v27 = objc_claimAutoreleasedReturnValue();
                            v28 = (void *)v27;
                            if (stringsValue && v27)
                            {
                              v29 = stringsValue;
                              v30 = v28;
                              v31 = -[NSArray isEqual:](v29, "isEqual:", v28);
                              v28 = v30;
                              if ((v31 & 1) != 0)
                              {
LABEL_26:
                                v50 = v28;
                                locationValue = self->_locationValue;
                                objc_msgSend(v7, "locationValue");
                                v33 = objc_claimAutoreleasedReturnValue();
                                v34 = (void *)v33;
                                if (locationValue && v33)
                                {
                                  v35 = locationValue;
                                  v36 = v34;
                                  v37 = -[PKLocation isEqual:](v35, "isEqual:", v34);
                                  v34 = v36;
                                  if (v37)
                                  {
LABEL_29:
                                    v49 = v34;
                                    dictionariesValue = self->_dictionariesValue;
                                    objc_msgSend(v7, "dictionariesValue");
                                    v39 = objc_claimAutoreleasedReturnValue();
                                    v48 = (void *)v39;
                                    if (dictionariesValue && v39)
                                    {
                                      if ((-[NSArray isEqual:](dictionariesValue, "isEqual:", v39) & 1) != 0)
                                      {
LABEL_32:
                                        currencyAmountValue = self->_currencyAmountValue;
                                        objc_msgSend(v7, "currencyAmountValue");
                                        v41 = objc_claimAutoreleasedReturnValue();
                                        v47 = (void *)v41;
                                        if (currencyAmountValue && v41)
                                        {
                                          if (-[PKCurrencyAmount isEqual:](currencyAmountValue, "isEqual:", v41, v41, v48))
                                          {
                                            goto LABEL_35;
                                          }
                                        }
                                        else if (currencyAmountValue == (PKCurrencyAmount *)v41)
                                        {
LABEL_35:
                                          personNameComponentsValue = self->_personNameComponentsValue;
                                          objc_msgSend(v7, "personNameComponentsValue", v47);
                                          v43 = objc_claimAutoreleasedReturnValue();
                                          v44 = (void *)v43;
                                          if (personNameComponentsValue && v43)
                                            v45 = -[NSPersonNameComponents isEqual:](personNameComponentsValue, "isEqual:", v43);
                                          else
                                            v45 = personNameComponentsValue == (NSPersonNameComponents *)v43;

                                          goto LABEL_61;
                                        }
                                        v45 = 0;
LABEL_61:

                                        goto LABEL_62;
                                      }
                                    }
                                    else if (dictionariesValue == (NSArray *)v39)
                                    {
                                      goto LABEL_32;
                                    }
                                    v45 = 0;
LABEL_62:

                                    v34 = v49;
                                    goto LABEL_63;
                                  }
                                }
                                else if (locationValue == (PKLocation *)v33)
                                {
                                  goto LABEL_29;
                                }
                                v45 = 0;
LABEL_63:

                                v28 = v50;
                                goto LABEL_64;
                              }
                            }
                            else if (stringsValue == (NSArray *)v27)
                            {
                              goto LABEL_26;
                            }
                            v45 = 0;
LABEL_64:

                            goto LABEL_65;
                          }
                        }
                        else if (stringValue == (NSString *)v24)
                        {
                          goto LABEL_23;
                        }
                        v45 = 0;
LABEL_65:

                        goto LABEL_66;
                      }
                    }
                    else if (semanticKey == (NSString *)v21)
                    {
                      goto LABEL_20;
                    }
                    v45 = 0;
LABEL_66:

                    goto LABEL_67;
                  }
                }
                else if (numberValue == (NSNumber *)v18)
                {
                  goto LABEL_17;
                }
                v45 = 0;
LABEL_67:

                goto LABEL_68;
              }
            }
            else if (eventDateInfoValue == (PKEventDateInfo *)v15)
            {
              goto LABEL_14;
            }
            v45 = 0;
LABEL_68:

            goto LABEL_69;
          }
        }
        else if (dateValue == (NSDate *)v12)
        {
          goto LABEL_11;
        }
        v45 = 0;
LABEL_69:

        goto LABEL_70;
      }
    }
    else if (fieldKey == (NSString *)v9)
    {
      goto LABEL_8;
    }
    v45 = 0;
LABEL_70:

    goto LABEL_71;
  }
  v45 = 0;
LABEL_71:

  return v45;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  NSString *stringValue;
  BOOL v7;
  void *v8;
  NSDate *dateValue;
  int64_t v10;
  void *v11;
  PKEventDateInfo *eventDateInfoValue;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSNumber *numberValue;
  PKLocation *locationValue;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  void *v28;
  PKCurrencyAmount *currencyAmountValue;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t (**v42)(void *, NSPersonNameComponents *, _QWORD);
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  unint64_t v47;
  unint64_t v48;
  void *v49;
  unint64_t v50;
  void *v51;
  NSUInteger v52;
  unint64_t v53;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD aBlock[4];
  id v61;

  v4 = a3;
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  stringValue = self->_stringValue;
  if (stringValue)
    v7 = v5 == 0;
  else
    v7 = 1;
  if (v7)
  {
    objc_msgSend(v4, "dateValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    dateValue = self->_dateValue;
    if (dateValue && v8)
    {
      v10 = -[NSDate compare:](dateValue, "compare:", v8);
LABEL_62:

      goto LABEL_63;
    }
    objc_msgSend(v4, "eventDateInfoValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    eventDateInfoValue = self->_eventDateInfoValue;
    if (eventDateInfoValue && v11)
    {
      -[PKEventDateInfo date](eventDateInfoValue, "date");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "date");
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = (void *)v14;
      if (v13)
      {
        if (v14)
        {
          v10 = objc_msgSend(v13, "compare:", v14);
          if (!v10)
          {
            -[PKEventDateInfo timeZone](self->_eventDateInfoValue, "timeZone");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "name");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "timeZone");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "name");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v18, v16, v18);

          }
        }
        else
        {
          v10 = 1;
        }
      }
      else
      {
        v10 = -1;
      }
      goto LABEL_60;
    }
    objc_msgSend(v4, "numberValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    numberValue = self->_numberValue;
    if (numberValue && v13)
    {
      v10 = -[NSNumber compare:](numberValue, "compare:", v13);
LABEL_61:

      goto LABEL_62;
    }
    objc_msgSend(v4, "locationValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    locationValue = self->_locationValue;
    if (locationValue && v15)
    {
      -[PKLocation coordinate](locationValue, "coordinate");
      v22 = v21;
      objc_msgSend(v15, "coordinate");
      v24 = v23;
      -[PKLocation coordinate](self->_locationValue, "coordinate");
      v26 = v25;
      objc_msgSend(v15, "coordinate");
      if (v22 == v24 && v26 == v27)
      {
        v10 = 0;
      }
      else
      {
        -[PKLocation name](self->_locationValue, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "name");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v37, v36, v37);

        if (!v10)
        {
          -[PKLocation relevantText](self->_locationValue, "relevantText");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "relevantText");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v39, v38, v39);

        }
      }
      goto LABEL_60;
    }
    objc_msgSend(v4, "currencyAmountValue");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    currencyAmountValue = self->_currencyAmountValue;
    if (currencyAmountValue && v28)
    {
      -[PKCurrencyAmount currency](currencyAmountValue, "currency");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "currency");
      v58 = v15;
      v31 = v28;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v32, v30, v32);

      v28 = v31;
      v15 = v58;

      if (!v10)
      {
        -[PKCurrencyAmount amount](self->_currencyAmountValue, "amount");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "amount");
        v34 = objc_claimAutoreleasedReturnValue();
        v35 = (void *)v34;
        if (v33)
        {
          if (v34)
            v10 = objc_msgSend(v33, "compare:", v34);
          else
            v10 = 1;
        }
        else
        {
          v10 = -1;
        }

      }
      goto LABEL_59;
    }
    objc_msgSend(v4, "personNameComponentsValue");
    v40 = objc_claimAutoreleasedReturnValue();
    v59 = (void *)v40;
    if (self->_personNameComponentsValue)
    {
      v41 = v40;
      if (v40)
      {
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __26__PKPassSemantic_compare___block_invoke_2;
        aBlock[3] = &unk_1E2ACDF28;
        v61 = &__block_literal_global_99;
        v42 = (uint64_t (**)(void *, NSPersonNameComponents *, _QWORD))_Block_copy(aBlock);
        v10 = v42[2](v42, self->_personNameComponentsValue, v41);
        if (!v10)
        {
          -[NSPersonNameComponents phoneticRepresentation](self->_personNameComponentsValue, "phoneticRepresentation");
          v43 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "phoneticRepresentation");
          v44 = objc_claimAutoreleasedReturnValue();
          v45 = (void *)v44;
          v55 = (void *)v43;
          if (v43)
          {
            if (v44)
              v10 = v42[2](v42, (NSPersonNameComponents *)v43, v44);
            else
              v10 = 1;
          }
          else
          {
            v10 = -1;
          }

        }
        goto LABEL_58;
      }
    }
    v56 = v28;
    objc_msgSend(v4, "stringsValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[NSArray count](self->_stringsValue, "count");
    if (v47 <= objc_msgSend(v46, "count"))
    {
      v48 = -[NSArray count](self->_stringsValue, "count");
      if (v48 >= objc_msgSend(v46, "count"))
      {
        objc_msgSend(v4, "dictionariesValue");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = -[NSArray count](self->_dictionariesValue, "count");
        if (v50 <= objc_msgSend(v49, "count"))
        {
          v52 = -[NSArray count](self->_dictionariesValue, "count");
          v53 = objc_msgSend(v49, "count");
          v51 = v49;
          if (v52 < v53)
            v10 = -1;
          else
            v10 = 1;
        }
        else
        {
          v51 = v49;
          v10 = 1;
        }
        v28 = v56;

        goto LABEL_54;
      }
      v10 = -1;
    }
    else
    {
      v10 = 1;
    }
    v28 = v56;
LABEL_54:

LABEL_58:
LABEL_59:

LABEL_60:
    goto LABEL_61;
  }
  v10 = -[NSString compare:](stringValue, "compare:", v5);
LABEL_63:

  return v10;
}

uint64_t __26__PKPassSemantic_compare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    if (v5)
      v7 = objc_msgSend(v4, "compare:", v5);
    else
      v7 = 1;
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

uint64_t __26__PKPassSemantic_compare___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(v5, "familyName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "familyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9);

  if (!v10)
  {
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v5, "givenName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "givenName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

    if (!v10)
    {
      v14 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v5, "middleName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "middleName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);

      if (!v10)
      {
        v17 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v5, "namePrefix");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "namePrefix");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v19);

        if (!v10)
        {
          v20 = *(_QWORD *)(a1 + 32);
          objc_msgSend(v5, "nameSuffix");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "nameSuffix");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v20 + 16))(v20, v21, v22);

          if (!v10)
          {
            v23 = *(_QWORD *)(a1 + 32);
            objc_msgSend(v5, "nickname");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "nickname");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v23 + 16))(v23, v24, v25);

          }
        }
      }
    }
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_fieldKey);
  objc_msgSend(v3, "safelyAddObject:", self->_dateValue);
  objc_msgSend(v3, "safelyAddObject:", self->_eventDateInfoValue);
  objc_msgSend(v3, "safelyAddObject:", self->_numberValue);
  objc_msgSend(v3, "safelyAddObject:", self->_semanticKey);
  objc_msgSend(v3, "safelyAddObject:", self->_stringValue);
  objc_msgSend(v3, "safelyAddObject:", self->_stringsValue);
  objc_msgSend(v3, "safelyAddObject:", self->_locationValue);
  objc_msgSend(v3, "safelyAddObject:", self->_dictionariesValue);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyAmountValue);
  objc_msgSend(v3, "safelyAddObject:", self->_personNameComponentsValue);
  v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)isSupportedDictionaryValueType:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  objc_msgSend((id)objc_opt_class(), "_supportedDictionaryValueTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__PKPassSemantic_isSupportedDictionaryValueType___block_invoke;
  v7[3] = &unk_1E2ACDF50;
  v5 = v3;
  v8 = v5;
  v9 = &v10;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  LOBYTE(v4) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

uint64_t __49__PKPassSemantic_isSupportedDictionaryValueType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)isSupportedDictionaryKeyType:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)_supportedDictionaryValueTypes
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSString)semanticKey
{
  return self->_semanticKey;
}

- (void)setSemanticKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)fieldKey
{
  return self->_fieldKey;
}

- (void)setFieldKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
  objc_storeStrong((id *)&self->_dateValue, a3);
}

- (PKEventDateInfo)eventDateInfoValue
{
  return self->_eventDateInfoValue;
}

- (void)setEventDateInfoValue:(id)a3
{
  objc_storeStrong((id *)&self->_eventDateInfoValue, a3);
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
  objc_storeStrong((id *)&self->_numberValue, a3);
}

- (PKLocation)locationValue
{
  return self->_locationValue;
}

- (void)setLocationValue:(id)a3
{
  objc_storeStrong((id *)&self->_locationValue, a3);
}

- (PKCurrencyAmount)currencyAmountValue
{
  return self->_currencyAmountValue;
}

- (void)setCurrencyAmountValue:(id)a3
{
  objc_storeStrong((id *)&self->_currencyAmountValue, a3);
}

- (NSPersonNameComponents)personNameComponentsValue
{
  return self->_personNameComponentsValue;
}

- (void)setPersonNameComponentsValue:(id)a3
{
  objc_storeStrong((id *)&self->_personNameComponentsValue, a3);
}

- (NSArray)stringsValue
{
  return self->_stringsValue;
}

- (void)setStringsValue:(id)a3
{
  objc_storeStrong((id *)&self->_stringsValue, a3);
}

- (NSArray)dictionariesValue
{
  return self->_dictionariesValue;
}

- (void)setDictionariesValue:(id)a3
{
  objc_storeStrong((id *)&self->_dictionariesValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionariesValue, 0);
  objc_storeStrong((id *)&self->_stringsValue, 0);
  objc_storeStrong((id *)&self->_personNameComponentsValue, 0);
  objc_storeStrong((id *)&self->_currencyAmountValue, 0);
  objc_storeStrong((id *)&self->_locationValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_eventDateInfoValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_fieldKey, 0);
  objc_storeStrong((id *)&self->_semanticKey, 0);
}

@end
