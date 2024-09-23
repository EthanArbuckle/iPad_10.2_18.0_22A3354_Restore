@implementation VideosExtrasVideoTimeline

- (VideosExtrasVideoTimeline)initWithTimelineElements:(id)a3
{
  id v5;
  void *v6;
  VideosExtrasVideoTimeline *v7;
  VideosExtrasVideoTimeline *v8;
  NSArray *v9;
  void *v10;
  void *v11;
  void *v12;
  NSArray *events;
  VideosExtrasVideoTimeline *v14;
  _QWORD v16[4];
  NSArray *v17;
  objc_super v18;

  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v18.receiver = self;
    v18.super_class = (Class)VideosExtrasVideoTimeline;
    v7 = -[VideosExtrasVideoTimeline init](&v18, sel_init);
    v8 = v7;
    if (v7)
    {
      objc_storeStrong((id *)&v7->_timelineElements, a3);
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
      -[NSArray firstObject](v8->_timelineElements, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "events");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __54__VideosExtrasVideoTimeline_initWithTimelineElements___block_invoke;
          v16[3] = &unk_1E9FA2FD8;
          v17 = v9;
          objc_msgSend(v12, "enumerateObjectsUsingBlock:", v16);

        }
      }
      events = v8->_events;
      v8->_events = v9;

    }
    self = v8;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __54__VideosExtrasVideoTimeline_initWithTimelineElements___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  VideosExtrasVideoTimelineEvent *v6;
  id v7;

  v7 = a2;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  v6 = -[VideosExtrasVideoTimelineEvent initWithElement:prev:]([VideosExtrasVideoTimelineEvent alloc], "initWithElement:prev:", v7, v5);
  -[VideosExtrasVideoTimelineEvent setIsFirstEvent:](v6, "setIsFirstEvent:", a3 == 0);
  objc_msgSend(v5, "setNext:", v6);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

- (id)eventForTime:(double)a3
{
  NSArray *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_events;
  v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v8, "offset", (_QWORD)v14);
        if (v9 <= a3)
        {
          objc_msgSend(v8, "offset");
          v11 = v10;
          objc_msgSend(v8, "duration");
          if (v11 + v12 > a3)
          {
            v5 = v8;
            goto LABEL_12;
          }
        }
      }
      v5 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return v5;
}

- (id)description
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<VideoTimeline numEvents:%ld>\n"), -[NSArray count](self->_events, "count"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_events;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "description");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@\n"), v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "appendString:", CFSTR("<VideoTimeline>"));
  return v3;
}

- (NSArray)events
{
  return self->_events;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_timelineElements, 0);
}

@end
