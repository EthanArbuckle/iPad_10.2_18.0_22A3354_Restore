@implementation RAPPlaceCorrectableString

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
        ((void (**)(_QWORD, RAPPlaceCorrectableString *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (RAPPlaceCorrectableString)initWithKind:(int64_t)a3 originalValue:(id)a4
{
  id v6;
  RAPPlaceCorrectableString *v7;
  RAPPlaceCorrectableString *v8;
  NSString *v9;
  NSString *originalValue;
  NSString *v11;
  NSString *value;
  objc_super v14;

  v6 = a4;
  v14.receiver = self;
  v14.super_class = (Class)RAPPlaceCorrectableString;
  v7 = -[RAPPlaceCorrectableString init](&v14, "init");
  v8 = v7;
  if (v7)
  {
    v7->_kind = a3;
    v9 = (NSString *)objc_msgSend(v6, "copy");
    originalValue = v8->_originalValue;
    v8->_originalValue = v9;

    v11 = (NSString *)-[NSString copy](v8->_originalValue, "copy");
    value = v8->_value;
    v8->_value = v11;

  }
  return v8;
}

- (NSString)localizedTitle
{
  NSString *localizedTitle;
  NSString *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  NSString *v8;

  localizedTitle = self->_localizedTitle;
  if (!localizedTitle)
  {
    v4 = 0;
    switch(-[RAPPlaceCorrectableString kind](self, "kind"))
    {
      case 0:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Name [Report a Problem label]");
        goto LABEL_21;
      case 1:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Address [Report a Problem label]");
        goto LABEL_21;
      case 2:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Phone [Report a Problem label]");
        goto LABEL_21;
      case 3:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Hours [Report a Problem label]");
        goto LABEL_21;
      case 4:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Website [Report a Problem label]");
        goto LABEL_21;
      case 5:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Category [Report a Problem label]");
        goto LABEL_21;
      case 6:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Closed Temporarily [Report an Issue]");
        goto LABEL_21;
      case 7:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Closed Permanently [Report an Issue]");
        goto LABEL_21;
      case 8:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Street [Report a Problem Address Type]");
        goto LABEL_21;
      case 9:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Subpremise [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xALL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("SubLocality [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xBLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("City [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xCLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("State [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xDLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("ZIP [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xELL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Country [Report a Problem Address Type]");
        goto LABEL_21;
      case 0xFLL:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Accepts Apple Pay [Report a Problem label]");
        goto LABEL_21;
      case 0x14:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Located Inside [Report an Issue]");
        goto LABEL_21;
      case 0x15:
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("Inside this place [Report an Issue]");
LABEL_21:
        v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

        break;
      default:
        break;
    }
    v8 = self->_localizedTitle;
    self->_localizedTitle = v4;

    localizedTitle = self->_localizedTitle;
  }
  return localizedTitle;
}

- (void)_setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (void)setValue:(id)a3
{
  NSString *v4;
  NSString *value;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_value) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    value = self->_value;
    self->_value = v4;

    -[RAPPlaceCorrectableString _invokeChangeHandlers](self, "_invokeChangeHandlers");
  }

}

- (void)revertCorrections
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString originalValue](self, "originalValue"));
  -[RAPPlaceCorrectableString setValue:](self, "setValue:", v3);

}

- (BOOL)isEdited
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;

  v3 = objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString value](self, "value"));
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = &stru_1011EB268;
  v6 = v5;

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableCharacterSet whitespaceCharacterSet](NSMutableCharacterSet, "whitespaceCharacterSet"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"));
  objc_msgSend(v7, "formUnionWithCharacterSet:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByTrimmingCharactersInSet:](v6, "stringByTrimmingCharactersInSet:", v7));
  v10 = objc_claimAutoreleasedReturnValue(-[RAPPlaceCorrectableString originalValue](self, "originalValue"));
  v11 = (void *)v10;
  if (v10)
    v12 = (__CFString *)v10;
  else
    v12 = &stru_1011EB268;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByTrimmingCharactersInSet:](v13, "stringByTrimmingCharactersInSet:", v7));
  LOBYTE(v13) = objc_msgSend(v9, "isEqual:", v14) ^ 1;

  return (char)v13;
}

- (int64_t)kind
{
  return self->_kind;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)originalValue
{
  return self->_originalValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_originalValue, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
