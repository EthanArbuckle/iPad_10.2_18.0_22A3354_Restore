@implementation TVPChapterCollection

- (TVPChapterCollection)init
{
  TVPChapterCollection *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TVPChapterCollection;
  result = -[TVPChapterCollection init](&v3, sel_init);
  if (result)
    result->_shouldDisplayChapterMarkers = 1;
  return result;
}

- (id)chapterForTime:(double)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[TVPChapterCollection chapters](self, "chapters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "timeRange");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsTime:", a3);

        if (v10)
        {
          v5 = v8;
          goto LABEL_11;
        }
      }
      v5 = (id)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)nearestChapterForTime:(double)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  double v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  id v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  id v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[TVPChapterCollection chapters](self, "chapters", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v25;
    v9 = *(double *)"";
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "timeRange");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "containsTime:", a3) & 1) != 0)
        {
          v22 = v11;

          v7 = v22;
          goto LABEL_24;
        }
        objc_msgSend(v12, "startTime");
        v14 = v13 - a3;
        if (v14 >= 0.0)
          v15 = v14;
        else
          v15 = -v14;
        if (v15 >= v9)
        {
          v15 = v9;
        }
        else
        {
          v16 = v11;

          v7 = v16;
        }
        objc_msgSend(v12, "startTime");
        v18 = v17;
        objc_msgSend(v12, "duration");
        v20 = v18 + v19 - a3;
        if (v20 >= 0.0)
          v9 = v20;
        else
          v9 = -v20;
        if (v9 >= v15)
        {
          v9 = v15;
        }
        else
        {
          v21 = v11;

          v7 = v21;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v7 = 0;
  }
LABEL_24:

  return v7;
}

- (id)chapterForDate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[TVPChapterCollection chapters](self, "chapters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "dateRange");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "containsDate:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)nearestChapterForDate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  double v20;
  double v21;
  id v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[TVPChapterCollection chapters](self, "chapters", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v26;
    v10 = *(double *)"";
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "dateRange");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v13, "containsDate:", v4) & 1) != 0)
        {
          v23 = v12;

          v8 = v23;
          goto LABEL_25;
        }
        if (v13)
        {
          objc_msgSend(v13, "startDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceDate:", v4);
          v16 = v15;

          if (v16 >= 0.0)
            v17 = v16;
          else
            v17 = -v16;
          if (v17 >= v10)
          {
            v17 = v10;
          }
          else
          {
            v18 = v12;

            v8 = v18;
          }
          objc_msgSend(v13, "endDate");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "timeIntervalSinceDate:", v4);
          v21 = v20;

          if (v21 >= 0.0)
            v10 = v21;
          else
            v10 = -v21;
          if (v10 >= v17)
          {
            v10 = v17;
          }
          else
          {
            v22 = v12;

            v8 = v22;
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v8 = 0;
  }
LABEL_25:

  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)chapters
{
  return self->_chapters;
}

- (void)setChapters:(id)a3
{
  objc_storeStrong((id *)&self->_chapters, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (id)backingData
{
  return self->_backingData;
}

- (void)setBackingData:(id)a3
{
  objc_storeStrong(&self->_backingData, a3);
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (BOOL)shouldStartPlaybackFromStartDate
{
  return self->_shouldStartPlaybackFromStartDate;
}

- (void)setShouldStartPlaybackFromStartDate:(BOOL)a3
{
  self->_shouldStartPlaybackFromStartDate = a3;
}

- (BOOL)shouldDisplayChapterMarkers
{
  return self->_shouldDisplayChapterMarkers;
}

- (void)setShouldDisplayChapterMarkers:(BOOL)a3
{
  self->_shouldDisplayChapterMarkers = a3;
}

- (BOOL)shouldShowDescriptionOnChapterSkip
{
  return self->_shouldShowDescriptionOnChapterSkip;
}

- (void)setShouldShowDescriptionOnChapterSkip:(BOOL)a3
{
  self->_shouldShowDescriptionOnChapterSkip = a3;
}

- (double)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(double)a3
{
  self->_refreshInterval = a3;
}

- (NSURL)refreshURL
{
  return self->_refreshURL;
}

- (void)setRefreshURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshURL, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong(&self->_backingData, 0);
  objc_storeStrong((id *)&self->_chapters, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
