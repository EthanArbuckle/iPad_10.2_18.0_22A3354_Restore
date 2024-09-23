@implementation _FavoritesTwoLinesContentViewModel

- (void)setObservedQuery:(id)a3
{
  MSPQuery *v5;
  MSPQuery *observedQuery;
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v5 = (MSPQuery *)a3;
  if (self->_observedQuery != v5)
  {
    objc_storeStrong((id *)&self->_observedQuery, a3);
    objc_initWeak(&location, self);
    observedQuery = self->_observedQuery;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1008CB53C;
    v8[3] = &unk_1011DAF18;
    objc_copyWeak(&v9, &location);
    v7 = &_dispatch_main_q;
    -[MSPQuery setChangeHandler:queue:](observedQuery, "setChangeHandler:queue:", v8, &_dispatch_main_q);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_updateSubtitleWithContents:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  uint64_t v12;
  __CFString *v13;
  __CFString *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (!v5)
  {
    v7 = 0;
LABEL_15:
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_FavoritesTwoLinesContentViewModel _secondaryTitlePlacesOnly:](self, "_secondaryTitlePlacesOnly:", v7));
    goto LABEL_16;
  }
  v6 = v5;
  v7 = 0;
  v8 = 0;
  v9 = *(_QWORD *)v16;
  do
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(_QWORD *)v16 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
      v12 = objc_opt_class(SearchResult);
      if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
        ++v7;
      else
        v8 += objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___GEOTransitLine);
    }
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  }
  while (v6);
  if (!v8)
    goto LABEL_15;
  if (v7)
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_FavoritesTwoLinesContentViewModel _secondaryTitleForPlaceCount:transitLineCount:](self, "_secondaryTitleForPlaceCount:transitLineCount:", v7, v8));
  else
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(-[_FavoritesTwoLinesContentViewModel _secondaryTitleTransitLineOnly:](self, "_secondaryTitleTransitLineOnly:", v8));
LABEL_16:
  v14 = v13;
  if (!-[__CFString length](v13, "length"))
  {

    v14 = CFSTR(" ");
  }
  -[_BasicTwoLinesContentViewModel setSubtitleText:](self, "setSubtitleText:", v14);

}

- (id)_secondaryTitlePlacesOnly:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("count_of_places"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3));
  return v6;
}

- (id)_secondaryTitleTransitLineOnly:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("count_of_transit_lines"), CFSTR("localized string not found"), 0));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, a3));
  return v6;
}

- (id)_secondaryTitleForPlaceCount:(unint64_t)a3 transitLineCount:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("count_of_places"), CFSTR("localized string not found"), 0));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("count_of_transit_lines"), CFSTR("localized string not found"), 0));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v10, a4));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("count_of_places_and_transit_lines"), CFSTR("localized string not found"), 0));

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8, v11));
  return v14;
}

- (MSPQuery)observedQuery
{
  return self->_observedQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedQuery, 0);
}

@end
