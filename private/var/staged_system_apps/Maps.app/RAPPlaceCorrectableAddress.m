@implementation RAPPlaceCorrectableAddress

- (void)addObserver:(id)a3 changeHandler:(id)a4
{
  id v6;
  NSMapTable *observers;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  observers = self->_observers;
  if (!observers)
  {
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    v9 = self->_observers;
    self->_observers = v8;

    observers = self->_observers;
  }
  v10 = objc_msgSend(v6, "copy");
  -[NSMapTable setObject:forKey:](observers, "setObject:forKey:", v10, v11);

}

- (void)removeObserver:(id)a3
{
  -[NSMapTable removeObjectForKey:](self->_observers, "removeObjectForKey:", a3);
}

- (void)_invokeChangeHandlers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_observers, "keyEnumerator", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_observers, "objectForKey:", v8));
        ((void (**)(_QWORD, RAPPlaceCorrectableAddress *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

+ (id)emptyCorrectableAddress
{
  return -[RAPPlaceCorrectableAddress _initWithStreet:subPremise:city:state:zipCode:country:addressFormattingLocaleIdentifier:]([RAPPlaceCorrectableAddress alloc], "_initWithStreet:subPremise:city:state:zipCode:country:addressFormattingLocaleIdentifier:", 0, 0, 0, 0, 0, 0, 0);
}

- (id)_initWithMapItem:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  v5 = -[RAPPlaceCorrectableAddress _initWithStreet:subPremise:city:state:zipCode:country:addressFormattingLocaleIdentifier:](self, "_initWithStreet:subPremise:city:state:zipCode:country:addressFormattingLocaleIdentifier:", 0, 0, 0, 0, 0, 0, 0);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_geoMapItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressObject"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "fullAddressWithMultiline:", 1));

    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_createAndObserveStringOfKind:originalValue:", 16, v8));
    v10 = (void *)v5[11];
    v5[11] = v9;

  }
  return v5;
}

- (id)_initWithStreet:(id)a3 subPremise:(id)a4 city:(id)a5 state:(id)a6 zipCode:(id)a7 country:(id)a8 addressFormattingLocaleIdentifier:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  RAPPlaceCorrectableAddress *v21;
  RAPPlaceCorrectableAddress *v22;
  RAPPlaceCorrectableAddress *v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  RAPPlaceCorrectableString *street;
  uint64_t v28;
  uint64_t v29;
  RAPPlaceCorrectableString *subPremise;
  uint64_t v31;
  uint64_t v32;
  RAPPlaceCorrectableString *city;
  uint64_t v34;
  uint64_t v35;
  RAPPlaceCorrectableString *state;
  uint64_t v37;
  uint64_t v38;
  RAPPlaceCorrectableString *zipCode;
  uint64_t v40;
  uint64_t v41;
  RAPPlaceCorrectableString *country;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  RAPPlaceCorrectableString *freeformAddress;
  uint64_t v47;
  uint64_t v48;
  RAPPlaceCorrectableString *buildingNumber;
  uint64_t v50;
  uint64_t v51;
  RAPPlaceCorrectableString *unitNumber;
  uint64_t v53;
  uint64_t v54;
  RAPPlaceCorrectableString *floorNumber;
  NSString *v56;
  NSString *addressFormattingLocaleIdentifier;
  id v59;
  _QWORD v60[4];
  RAPPlaceCorrectableAddress *v61;
  objc_super v62;

  v59 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v62.receiver = self;
  v62.super_class = (Class)RAPPlaceCorrectableAddress;
  v21 = -[RAPPlaceCorrectableAddress init](&v62, "init");
  v22 = v21;
  if (v21)
  {
    v21->_kind = 1;
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_1003085E0;
    v60[3] = &unk_1011B12D8;
    v23 = v21;
    v61 = v23;
    v24 = objc_retainBlock(v60);
    v25 = ((uint64_t (*)(_QWORD *, uint64_t, id))v24[2])(v24, 8, v59);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    street = v23->_street;
    v23->_street = (RAPPlaceCorrectableString *)v26;

    v28 = ((uint64_t (*)(_QWORD *, uint64_t, id))v24[2])(v24, 9, v15);
    v29 = objc_claimAutoreleasedReturnValue(v28);
    subPremise = v23->_subPremise;
    v23->_subPremise = (RAPPlaceCorrectableString *)v29;

    v31 = ((uint64_t (*)(_QWORD *, uint64_t, id))v24[2])(v24, 11, v16);
    v32 = objc_claimAutoreleasedReturnValue(v31);
    city = v23->_city;
    v23->_city = (RAPPlaceCorrectableString *)v32;

    v34 = ((uint64_t (*)(_QWORD *, uint64_t, id))v24[2])(v24, 12, v17);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    state = v23->_state;
    v23->_state = (RAPPlaceCorrectableString *)v35;

    v37 = ((uint64_t (*)(_QWORD *, uint64_t, id))v24[2])(v24, 13, v18);
    v38 = objc_claimAutoreleasedReturnValue(v37);
    zipCode = v23->_zipCode;
    v23->_zipCode = (RAPPlaceCorrectableString *)v38;

    v40 = ((uint64_t (*)(_QWORD *, uint64_t, id))v24[2])(v24, 14, v19);
    v41 = objc_claimAutoreleasedReturnValue(v40);
    country = v23->_country;
    v23->_country = (RAPPlaceCorrectableString *)v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress _structuredAddress](v23, "_structuredAddress"));
    v44 = ((uint64_t (*)(_QWORD *, uint64_t, void *))v24[2])(v24, 16, v43);
    v45 = objc_claimAutoreleasedReturnValue(v44);
    freeformAddress = v23->_freeformAddress;
    v23->_freeformAddress = (RAPPlaceCorrectableString *)v45;

    v47 = ((uint64_t (*)(_QWORD *, uint64_t, const __CFString *))v24[2])(v24, 17, &stru_1011EB268);
    v48 = objc_claimAutoreleasedReturnValue(v47);
    buildingNumber = v23->_buildingNumber;
    v23->_buildingNumber = (RAPPlaceCorrectableString *)v48;

    v50 = ((uint64_t (*)(_QWORD *, uint64_t, const __CFString *))v24[2])(v24, 19, &stru_1011EB268);
    v51 = objc_claimAutoreleasedReturnValue(v50);
    unitNumber = v23->_unitNumber;
    v23->_unitNumber = (RAPPlaceCorrectableString *)v51;

    v53 = ((uint64_t (*)(_QWORD *, uint64_t, const __CFString *))v24[2])(v24, 18, &stru_1011EB268);
    v54 = objc_claimAutoreleasedReturnValue(v53);
    floorNumber = v23->_floorNumber;
    v23->_floorNumber = (RAPPlaceCorrectableString *)v54;

    v56 = (NSString *)objc_msgSend(v20, "copy");
    addressFormattingLocaleIdentifier = v23->_addressFormattingLocaleIdentifier;
    v23->_addressFormattingLocaleIdentifier = v56;

  }
  return v22;
}

+ (BOOL)_isStructuredAddressType:(int64_t)a3
{
  return (unint64_t)(a3 - 8) < 7;
}

- (NSArray)orderedCorrectableItems
{
  NSArray *orderedCorrectableItems;
  RAPPlaceCorrectableString *floorNumber;
  NSArray *v5;
  NSArray *v6;
  __int128 v8;
  RAPPlaceCorrectableString *city;
  __int128 v10;
  RAPPlaceCorrectableString *country;
  __int128 v12;
  RAPPlaceCorrectableString *unitNumber;
  RAPPlaceCorrectableString *v14;

  orderedCorrectableItems = self->_orderedCorrectableItems;
  if (!orderedCorrectableItems)
  {
    v8 = *(_OWORD *)&self->_street;
    city = self->_city;
    v10 = *(_OWORD *)&self->_state;
    country = self->_country;
    v12 = *(_OWORD *)&self->_freeformAddress;
    floorNumber = self->_floorNumber;
    unitNumber = self->_unitNumber;
    v14 = floorNumber;
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 10));
    v6 = self->_orderedCorrectableItems;
    self->_orderedCorrectableItems = v5;

    orderedCorrectableItems = self->_orderedCorrectableItems;
  }
  return orderedCorrectableItems;
}

- (void)_updateFreeformAddressWithStructuredChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress _structuredAddress](self, "_structuredAddress"));
  -[RAPPlaceCorrectableString setValue:](self->_freeformAddress, "setValue:", v3);

}

- (id)_structuredAddress
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v3 = objc_alloc_init((Class)CNMutablePostalAddress);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_street, "value"));
  objc_msgSend(v3, "setStreet:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_subPremise, "value"));
  objc_msgSend(v3, "setSubAdministrativeArea:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_city, "value"));
  objc_msgSend(v3, "setCity:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_state, "value"));
  objc_msgSend(v3, "setState:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_zipCode, "value"));
  objc_msgSend(v3, "setPostalCode:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self->_country, "value"));
  objc_msgSend(v3, "setCountry:", v9);

  objc_msgSend(v3, "setISOCountryCode:", self->_addressFormattingLocaleIdentifier);
  v10 = objc_alloc_init((Class)CNPostalAddressFormatter);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringFromPostalAddress:", v3));

  return v11;
}

- (id)_createAndObserveStringOfKind:(int64_t)a3 originalValue:(id)a4
{
  id v6;
  RAPPlaceCorrectableString *v7;

  v6 = a4;
  v7 = -[RAPPlaceCorrectableString initWithKind:originalValue:]([RAPPlaceCorrectableString alloc], "initWithKind:originalValue:", a3, v6);

  -[RAPPlaceCorrectableString addObserver:changeHandler:](v7, "addObserver:changeHandler:", self, &stru_1011B1318);
  return v7;
}

- (NSString)localizedTitle
{
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;

  v2 = 0;
  switch(-[RAPPlaceCorrectableAddress kind](self, "kind"))
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Name [Report a Problem label]");
      goto LABEL_20;
    case 1:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Address [Report a Problem label]");
      goto LABEL_20;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Phone [Report a Problem label]");
      goto LABEL_20;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Hours [Report a Problem label]");
      goto LABEL_20;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Website [Report a Problem label]");
      goto LABEL_20;
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Category [Report a Problem label]");
      goto LABEL_20;
    case 6:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Closed Temporarily [Report an Issue]");
      goto LABEL_20;
    case 7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Closed Permanently [Report an Issue]");
      goto LABEL_20;
    case 8:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Street [Report a Problem Address Type]");
      goto LABEL_20;
    case 9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Subpremise [Report a Problem Address Type]");
      goto LABEL_20;
    case 0xALL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("SubLocality [Report a Problem Address Type]");
      goto LABEL_20;
    case 0xBLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("City [Report a Problem Address Type]");
      goto LABEL_20;
    case 0xCLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("State [Report a Problem Address Type]");
      goto LABEL_20;
    case 0xDLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("ZIP [Report a Problem Address Type]");
      goto LABEL_20;
    case 0xELL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Country [Report a Problem Address Type]");
      goto LABEL_20;
    case 0xFLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Accepts Apple Pay [Report a Problem label]");
      goto LABEL_20;
    case 0x14:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Located Inside [Report an Issue]");
      goto LABEL_20;
    case 0x15:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Inside this place [Report an Issue]");
LABEL_20:
      v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, CFSTR("localized string not found"), 0));

      break;
    default:
      return (NSString *)v2;
  }
  return (NSString *)v2;
}

- (void)revertCorrections
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress orderedCorrectableItems](self, "orderedCorrectableItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "revertCorrections");
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)isEdited
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress orderedCorrectableItems](self, "orderedCorrectableItems", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "isEdited") & 1) != 0)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (void)setAddressFormattingLocaleIdentifier:(id)a3
{
  NSString *v4;
  NSString *addressFormattingLocaleIdentifier;

  if (self->_addressFormattingLocaleIdentifier != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    addressFormattingLocaleIdentifier = self->_addressFormattingLocaleIdentifier;
    self->_addressFormattingLocaleIdentifier = v4;

    -[RAPPlaceCorrectableAddress _invokeChangeHandlers](self, "_invokeChangeHandlers");
  }
}

- (void)updateFreeformAddressFromMapItem:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "_fullAddressWithMultiline:", 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableAddress freeformAddress](self, "freeformAddress"));
  objc_msgSend(v4, "setValue:", v5);

}

- (int64_t)kind
{
  return self->_kind;
}

- (RAPPlaceCorrectableString)street
{
  return self->_street;
}

- (RAPPlaceCorrectableString)subPremise
{
  return self->_subPremise;
}

- (RAPPlaceCorrectableString)city
{
  return self->_city;
}

- (RAPPlaceCorrectableString)state
{
  return self->_state;
}

- (RAPPlaceCorrectableString)zipCode
{
  return self->_zipCode;
}

- (RAPPlaceCorrectableString)country
{
  return self->_country;
}

- (NSString)addressFormattingLocaleIdentifier
{
  return self->_addressFormattingLocaleIdentifier;
}

- (RAPPlaceCorrectableString)freeformAddress
{
  return self->_freeformAddress;
}

- (RAPPlaceCorrectableString)buildingNumber
{
  return self->_buildingNumber;
}

- (RAPPlaceCorrectableString)floorNumber
{
  return self->_floorNumber;
}

- (RAPPlaceCorrectableString)unitNumber
{
  return self->_unitNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitNumber, 0);
  objc_storeStrong((id *)&self->_floorNumber, 0);
  objc_storeStrong((id *)&self->_buildingNumber, 0);
  objc_storeStrong((id *)&self->_freeformAddress, 0);
  objc_storeStrong((id *)&self->_addressFormattingLocaleIdentifier, 0);
  objc_storeStrong((id *)&self->_orderedCorrectableItems, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_zipCode, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_subPremise, 0);
  objc_storeStrong((id *)&self->_street, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
