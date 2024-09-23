@implementation VenueCardDealer

- (id)newHandFromExistingHand:(id)a3 nextTopCard:(id)a4 source:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  char *v11;
  id v12;
  void *v13;
  unsigned int v14;
  unint64_t v15;
  id *v16;
  id v17;
  uint64_t v18;
  void *v20;
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a4;
  if ((objc_msgSend(v9, "isVenueItem") & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[VenueCardDealer existingCardForHand:cardItem:](self, "existingCardForHand:cardItem:", v8, v9));
    if (v10 && (v11 = (char *)objc_msgSend(v8, "indexOfObject:", v10), v11 != (char *)0x7FFFFFFFFFFFFFFFLL))
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, v11 + 1));
    }
    else
    {
      if (objc_msgSend(v8, "count"))
      {
        v12 = -[VenueCardDealer _venueIdForHand:](self, "_venueIdForHand:", v8);
        if (v12 == objc_msgSend(v9, "venueID"))
        {
          if (a5 != 1
            || !objc_msgSend(v9, "conformsToProtocol:", &OBJC_PROTOCOL___VenuePlaceCardItem)
            || (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastObject")),
                v14 = objc_msgSend(v13, "conformsToProtocol:", &OBJC_PROTOCOL___VenuePlaceCardItem),
                v13,
                !v14))
          {
            v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "arrayByAddingObject:", v9));
            goto LABEL_17;
          }
          v15 = -[VenueCardDealer _indexOfFirstNonPlaceCardInHand:](self, "_indexOfFirstNonPlaceCardInHand:", v8);
          if (v15 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, v15 + 1));
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "arrayByAddingObject:", v9));

            goto LABEL_18;
          }
          v21 = v9;
          v16 = &v21;
        }
        else
        {
          v22 = v9;
          v16 = &v22;
        }
      }
      else
      {
        v23 = v9;
        v16 = &v23;
      }
      v18 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 1, v21, v22, v23));
    }
LABEL_17:
    v17 = (id)v18;
LABEL_18:

    goto LABEL_19;
  }
  v17 = v8;
LABEL_19:

  return v17;
}

- (id)existingCardForHand:(id)a3 cardItem:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v5 = a4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reverseObjectEnumerator", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v6);
        v10 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        v11 = v5;
        v12 = v11;
        if (v10 == v11)
        {

          v10 = v12;
LABEL_16:
          v7 = v10;
          goto LABEL_17;
        }
        v13 = objc_opt_class(v11);
        if ((objc_opt_isKindOfClass(v10, v13) & 1) != 0
          && (v14 = objc_msgSend(v10, "venueCardID"), v14 == objc_msgSend(v12, "venueCardID")))
        {
          v15 = objc_msgSend(v10, "venueCardID");

          if (v15)
            goto LABEL_16;
        }
        else
        {

        }
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_17:

  return v7;
}

- (unint64_t)_venueIdForHand:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "firstObject"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "venueID");
  else
    v5 = 0;

  return (unint64_t)v5;
}

- (unint64_t)_indexOfFirstNonPlaceCardInHand:(id)a3
{
  id v3;
  unint64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10026950C;
  v6[3] = &unk_1011AE1F0;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);

  return v4;
}

@end
