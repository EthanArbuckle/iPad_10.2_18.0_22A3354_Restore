@implementation MPMediaItemCollection

- (id)bk_cloudRepresentativeItem
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection items](self, "items", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = MPMediaItemPropertyPurchaseHistoryID;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", v6));
        if (objc_msgSend(v8, "mediaType") == &dword_4 && objc_msgSend(v9, "longLongValue"))
        {
          v10 = v8;

          goto LABEL_12;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)bk_localRepresentativeItem
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection items](self, "items", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    v6 = MPMediaItemPropertyPurchaseHistoryID;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForProperty:", v6));
        if (objc_msgSend(v8, "mediaType") == &dword_4 && !objc_msgSend(v9, "longLongValue"))
        {
          v10 = v8;

          goto LABEL_12;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_12:

  return v10;
}

- (id)bk_representativeItem
{
  void *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection items](self, "items", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v6, "mediaType") == &dword_4)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (id)bk_items
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_opt_new(NSMutableArray);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection items](self, "items", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "mediaType") == &dword_4)
          -[NSMutableArray addObject:](v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v10 = -[NSMutableArray copy](v3, "copy");
  return v10;
}

- (id)bk_localItems
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_opt_new(NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection items](self, "items", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    v8 = MPMediaItemPropertyPurchaseHistoryID;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v8));
        if (objc_msgSend(v10, "mediaType") == &dword_4 && !objc_msgSend(v11, "longLongValue"))
          -[NSMutableArray addObject:](v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = -[NSMutableArray copy](v3, "copy");
  return v12;
}

- (id)bk_cloudItems
{
  NSMutableArray *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_opt_new(NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection items](self, "items", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MPMediaItemPropertyPurchaseHistoryID;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "valueForProperty:", v8));
        if (objc_msgSend(v10, "mediaType") == &dword_4 && objc_msgSend(v11, "longLongValue"))
          -[NSMutableArray addObject:](v3, "addObject:", v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  if ((unint64_t)-[NSMutableArray count](v3, "count") >= 2)
  {
    v12 = BKAudiobooksLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_21CC0(v3, v13);

  }
  v14 = -[NSMutableArray copy](v3, "copy");

  return v14;
}

- (id)bk_mostRecentListeningProgress
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  id v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  BOOL v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v21;
  id v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_localItems](self, "bk_localItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_cloudItems](self, "bk_cloudItems"));
  v22 = 0;
  -[MPMediaItemCollection _bookmarkTime:timestamp:](self, "_bookmarkTime:timestamp:", v3, &v22);
  v6 = v5;
  v7 = v22;
  v21 = 0;
  -[MPMediaItemCollection _bookmarkTime:timestamp:](self, "_bookmarkTime:timestamp:", v4, &v21);
  v9 = v8;
  v10 = v21;
  v11 = v10;
  if (v7)
    v12 = v10 == 0;
  else
    v12 = 1;
  if (!v12)
  {
    if (objc_msgSend(v7, "compare:", v10) != (id)-1)
      goto LABEL_18;
    goto LABEL_12;
  }
  if (!v7 && v10)
  {
LABEL_12:
    -[MPMediaItemCollection _duration:](self, "_duration:", v4);
    if (v15 > 0.0)
    {
      v14 = v9 / v15;
      goto LABEL_14;
    }
LABEL_18:
    v19 = 0;
    goto LABEL_19;
  }
  if (!v7)
    goto LABEL_18;
  -[MPMediaItemCollection _duration:](self, "_duration:", v3);
  if (v13 <= 0.0)
    goto LABEL_18;
  v14 = v6 / v13;
LABEL_14:
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v14));
  v17 = v16;
  if (!v16)
    goto LABEL_18;
  objc_msgSend(v16, "doubleValue");
  if (v18 > 1.0)
    v18 = 1.0;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", fmax(v18, 0.0)));

LABEL_19:
  return v19;
}

- (double)_bookmarkTime:(id)a3 timestamp:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  char v16;
  double v17;
  double v18;
  void *i;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  id v31;
  id *v32;
  id obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];

  v5 = a3;
  if (objc_msgSend(v5, "count") == (char *)&dword_0 + 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", MPMediaItemPropertyBookmarkTime));
    objc_msgSend(v7, "doubleValue");
    v9 = v8;

    if (!objc_msgSend(v6, "hasBeenPlayed")
      || (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dateAccessed"))) == 0)
    {
      v11 = objc_opt_class(NSDate);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "valueForProperty:", MPMediaItemPropertyLastPlayedDate));
      v13 = BUDynamicCast(v11, v12);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v13);

    }
    if (!a4)
      goto LABEL_31;
    goto LABEL_30;
  }
  if ((unint64_t)objc_msgSend(v5, "count") < 2)
  {
    v10 = 0;
    v9 = 0.0;
    if (!a4)
      goto LABEL_31;
    goto LABEL_30;
  }
  v31 = v5;
  v32 = a4;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v5;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v10 = 0;
    v34 = *(_QWORD *)v36;
    v17 = 0.0;
    v18 = 0.0;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v36 != v34)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dateAccessed", v31, v32));
        v22 = objc_msgSend(v20, "hasBeenPlayed");
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
        objc_msgSend(v23, "doubleValue");
        v25 = v24;

        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "valueForProperty:", MPMediaItemPropertyBookmarkTime));
        objc_msgSend(v26, "doubleValue");
        v28 = v27;

        if (v28 > v25)
          v28 = 0.0;
        if (v22)
        {
          if (!v10 || objc_msgSend(v21, "compare:", v10) == (char *)&dword_0 + 1)
          {
            v29 = v21;

            v10 = v29;
          }
          v17 = v18 + v28;
        }
        v16 |= v22;
        v18 = v18 + v25;

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
    v10 = 0;
    v17 = 0.0;
  }

  if ((v10 != 0) | v16 & 1)
  {
    v9 = v17;
  }
  else
  {
    v10 = 0;
    v9 = 0.0;
  }
  v5 = v31;
  a4 = v32;
  if (v32)
LABEL_30:
    *a4 = objc_retainAutorelease(v10);
LABEL_31:

  return v9;
}

- (double)bk_localBookmarkTime
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_localItems](self, "bk_localItems"));
  -[MPMediaItemCollection _bookmarkTime:timestamp:](self, "_bookmarkTime:timestamp:", v3, 0);
  v5 = v4;

  return v5;
}

- (double)bk_cloudBookmarkTime
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_cloudItems](self, "bk_cloudItems"));
  -[MPMediaItemCollection _bookmarkTime:timestamp:](self, "_bookmarkTime:timestamp:", v3, 0);
  v5 = v4;

  return v5;
}

- (id)bk_localBookmarkTimestamp
{
  void *v3;
  id v4;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_localItems](self, "bk_localItems"));
  v6 = 0;
  -[MPMediaItemCollection _bookmarkTime:timestamp:](self, "_bookmarkTime:timestamp:", v3, &v6);
  v4 = v6;

  return v4;
}

- (id)bk_cloudBookmarkTimestamp
{
  void *v3;
  id v4;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_cloudItems](self, "bk_cloudItems"));
  v6 = 0;
  -[MPMediaItemCollection _bookmarkTime:timestamp:](self, "_bookmarkTime:timestamp:", v3, &v6);
  v4 = v6;

  return v4;
}

- (double)_duration:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  double v7;
  void *i;
  void *v9;
  double v10;
  double v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    v7 = 0.0;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "valueForProperty:", MPMediaItemPropertyPlaybackDuration));
        objc_msgSend(v9, "doubleValue");
        v11 = v10;

        v7 = v7 + v11;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v7 = 0.0;
  }

  return v7;
}

- (double)bk_localDuration
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_localItems](self, "bk_localItems"));
  -[MPMediaItemCollection _duration:](self, "_duration:", v3);
  v5 = v4;

  return v5;
}

- (double)bk_cloudDuration
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_cloudItems](self, "bk_cloudItems"));
  -[MPMediaItemCollection _duration:](self, "_duration:", v3);
  v5 = v4;

  return v5;
}

- (double)_timeRemaining:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[MPMediaItemCollection _duration:](self, "_duration:", v4);
  v6 = v5;
  -[MPMediaItemCollection _bookmarkTime:timestamp:](self, "_bookmarkTime:timestamp:", v4, 0);
  v8 = v7;

  return v6 - v8;
}

- (double)bk_localTimeRemaining
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_localItems](self, "bk_localItems"));
  -[MPMediaItemCollection _timeRemaining:](self, "_timeRemaining:", v3);
  v5 = v4;

  return v5;
}

- (double)bk_cloudTimeRemaining
{
  void *v3;
  double v4;
  double v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_cloudItems](self, "bk_cloudItems"));
  -[MPMediaItemCollection _timeRemaining:](self, "_timeRemaining:", v3);
  v5 = v4;

  return v5;
}

- (BOOL)_hasBeenPlayed:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "hasBeenPlayed", (_QWORD)v8) & 1) != 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v4;
}

- (BOOL)bk_localHasBeenPlayed
{
  MPMediaItemCollection *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_localItems](self, "bk_localItems"));
  LOBYTE(v2) = -[MPMediaItemCollection _hasBeenPlayed:](v2, "_hasBeenPlayed:", v3);

  return (char)v2;
}

- (BOOL)bk_cloudHasBeenPlayed
{
  MPMediaItemCollection *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaItemCollection bk_cloudItems](self, "bk_cloudItems"));
  LOBYTE(v2) = -[MPMediaItemCollection _hasBeenPlayed:](v2, "_hasBeenPlayed:", v3);

  return (char)v2;
}

@end
