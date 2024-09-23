@implementation RAPPlaceCorrectableFlag

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
        ((void (**)(_QWORD, RAPPlaceCorrectableFlag *, uint64_t))v9)[2](v9, self, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (RAPPlaceCorrectableFlag)initWithKind:(int64_t)a3 originalValue:(BOOL)a4
{
  RAPPlaceCorrectableFlag *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RAPPlaceCorrectableFlag;
  result = -[RAPPlaceCorrectableFlag init](&v7, "init");
  if (result)
  {
    result->_kind = a3;
    result->_originalValue = a4;
    result->_value = a4;
  }
  return result;
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
    switch(-[RAPPlaceCorrectableFlag kind](self, "kind"))
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

- (void)setValue:(BOOL)a3
{
  if (self->_value != a3)
  {
    self->_value = a3;
    -[RAPPlaceCorrectableFlag _invokeChangeHandlers](self, "_invokeChangeHandlers");
  }
}

- (void)revertCorrections
{
  -[RAPPlaceCorrectableFlag setValue:](self, "setValue:", -[RAPPlaceCorrectableFlag originalValue](self, "originalValue"));
}

- (BOOL)isEdited
{
  return self->_value != self->_originalValue;
}

- (int64_t)kind
{
  return self->_kind;
}

- (BOOL)value
{
  return self->_value;
}

- (BOOL)originalValue
{
  return self->_originalValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
