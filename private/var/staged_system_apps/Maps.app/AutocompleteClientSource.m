@implementation AutocompleteClientSource

+ (int64_t)autocompleteClientSourceTypeWithItem:(id)a3
{
  id v4;
  int64_t v5;

  v4 = a3;
  if ((objc_msgSend(a1, "itemIsRecentSearch:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else if ((objc_msgSend(a1, "itemIsRecentPlace:", v4) & 1) != 0)
  {
    v5 = 2;
  }
  else if ((objc_msgSend(a1, "itemIsFromMail:", v4) & 1) != 0)
  {
    v5 = 3;
  }
  else if ((objc_msgSend(a1, "itemIsFromMessages:", v4) & 1) != 0)
  {
    v5 = 4;
  }
  else if (objc_msgSend(a1, "itemIsMarkedLocation:", v4))
  {
    v5 = 5;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)itemIsRecentSearch:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "containsPossiblePersonalizedItemSourceType:", 7))
    v4 = objc_msgSend(v3, "containsPossiblePersonalizedItemSourceSubtype:", 11);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)itemIsRecentPlace:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "containsPossiblePersonalizedItemSourceType:", 7)
    && (objc_msgSend(v3, "containsPossiblePersonalizedItemSourceSubtype:", 10) & 1) != 0)
  {
    v4 = 1;
  }
  else if (objc_msgSend(v3, "containsPossiblePersonalizedItemSourceType:", 9))
  {
    v4 = objc_msgSend(v3, "containsPossiblePersonalizedItemSourceSubtype:", 17);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)itemIsFromMail:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "containsPossiblePersonalizedItemSourceType:", 5))
    v4 = objc_msgSend(v3, "containsPossiblePersonalizedItemSourceSubtype:", 4);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)itemIsFromMessages:(id)a3
{
  id v3;
  unsigned __int8 v4;

  v3 = a3;
  if (objc_msgSend(v3, "containsPossiblePersonalizedItemSourceType:", 5))
    v4 = objc_msgSend(v3, "containsPossiblePersonalizedItemSourceSubtype:", 5);
  else
    v4 = 0;

  return v4;
}

+ (BOOL)itemIsMarkedLocation:(id)a3
{
  void *v3;
  uint64_t v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "autocompleteObject"));
  v4 = objc_opt_class(SearchResult);
  v5 = (objc_opt_isKindOfClass(v3, v4) & 1) != 0 && objc_msgSend(v3, "type") == 3;

  return v5;
}

+ (id)autocompleteClientSourceTitleWithType:(int64_t)a3
{
  return objc_msgSend(a1, "autocompleteClientSourceTitleWithType:contactName:", a3, 0);
}

+ (id)autocompleteClientSourceTitleWithType:(int64_t)a3 contactName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  unsigned int v14;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 1:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Recent Search");
      goto LABEL_15;
    case 2:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Recently Viewed");
      goto LABEL_15;
    case 3:
      if (objc_msgSend(v5, "length"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v11;
        v12 = CFSTR("Siri found in Mail from %@");
        goto LABEL_9;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("Siri found in Mail");
      goto LABEL_15;
    case 4:
      if (objc_msgSend(v5, "length"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v11;
        v12 = CFSTR("Siri found in Messages from %@");
LABEL_9:
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v12, CFSTR("localized string not found"), 0));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v6));

      }
      else
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = v7;
        v9 = CFSTR("Siri found in Messages");
LABEL_15:
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, CFSTR("localized string not found"), 0));
      }

LABEL_17:
      return v10;
    case 5:
      v14 = +[LibraryUIUtilities isMyPlacesEnabled](_TtC4Maps18LibraryUIUtilities, "isMyPlacesEnabled");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      if (v14)
        v9 = CFSTR("Marked Location");
      else
        v9 = CFSTR("Dropped Pin");
      goto LABEL_15;
    default:
      v10 = 0;
      goto LABEL_17;
  }
}

+ (id)autocompleteClientSourceAppIconWithType:(int64_t)a3
{
  const __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  v3 = CFSTR("com.apple.MobileSMS");
  if (a3 != 4)
    v3 = 0;
  if (a3 == 3)
    v4 = CFSTR("com.apple.mobilemail");
  else
    v4 = (__CFString *)v3;
  if (-[__CFString length](v4, "length"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "scale");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _applicationIconImageForBundleIdentifier:format:scale:](UIImage, "_applicationIconImageForBundleIdentifier:format:scale:", v4, 2));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
