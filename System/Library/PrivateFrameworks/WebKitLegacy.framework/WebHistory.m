@implementation WebHistory

+ (WebHistory)optionalSharedHistory
{
  WebHistory *result;

  if (byte_1ECEC9899 == 1)
    return (WebHistory *)qword_1ECEC98A8;
  result = 0;
  qword_1ECEC98A8 = 0;
  byte_1ECEC9899 = 1;
  return result;
}

+ (void)setOptionalSharedHistory:(WebHistory *)history
{
  void *v4;

  if (byte_1ECEC9899 == 1)
  {
    v4 = (void *)qword_1ECEC98A8;
    if ((WebHistory *)qword_1ECEC98A8 == history)
      return;
  }
  else
  {
    v4 = 0;
    qword_1ECEC98A8 = 0;
    byte_1ECEC9899 = 1;
    if (!history)
      return;
  }
  if (history)
  {
    CFRetain(history);
    v4 = (void *)qword_1ECEC98A8;
  }
  qword_1ECEC98A8 = (uint64_t)history;
  if (v4)
    CFRelease(v4);
  if (s_shouldTrackVisitedLinks != (history != 0))
  {
    s_shouldTrackVisitedLinks = history != 0;
    if (!history)
      v4 = (void *)WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)v4, (void *)a2);
  }
  WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)v4, (void *)a2);
}

- (void)timeZoneChanged:(id)a3
{
  -[WebHistoryPrivate rebuildHistoryByDayIfNeeded:](self->_historyPrivate, "rebuildHistoryByDayIfNeeded:", self);
}

- (WebHistory)init
{
  WebHistory *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WebHistory;
  v2 = -[WebHistory init](&v5, sel_init);
  if (v2)
  {
    v2->_historyPrivate = objc_alloc_init(WebHistoryPrivate);
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_timeZoneChanged_, *MEMORY[0x1E0C998A0], 0);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0C998A0], 0);

  v4.receiver = self;
  v4.super_class = (Class)WebHistory;
  -[WebHistory dealloc](&v4, sel_dealloc);
}

- (void)_sendNotification:(id)a3 entries:(id)a4
{
  NSString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = WebHistoryItemsKey;
  v5[0] = a4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  WebThreadPostNotification();
}

- (void)removeItems:(NSArray *)items
{
  if (-[WebHistoryPrivate removeItems:](self->_historyPrivate, "removeItems:"))
    -[WebHistory _sendNotification:entries:](self, "_sendNotification:entries:", WebHistoryItemsRemovedNotification, items);
}

- (void)removeAllItems
{
  id v3;

  v3 = -[WebHistoryPrivate allItems](self->_historyPrivate, "allItems");
  if (-[WebHistoryPrivate removeAllItems](self->_historyPrivate, "removeAllItems"))
    -[WebHistory _sendNotification:entries:](self, "_sendNotification:entries:", WebHistoryAllItemsRemovedNotification, v3);
}

- (void)addItems:(NSArray *)newItems
{
  -[WebHistoryPrivate addItems:](self->_historyPrivate, "addItems:");
  -[WebHistory _sendNotification:entries:](self, "_sendNotification:entries:", WebHistoryItemsAddedNotification, newItems);
}

- (NSArray)orderedLastVisitedDays
{
  return (NSArray *)-[WebHistoryPrivate orderedLastVisitedDays](self->_historyPrivate, "orderedLastVisitedDays");
}

- (NSArray)orderedItemsLastVisitedOnDay:(NSCalendarDate *)calendarDate
{
  return (NSArray *)-[WebHistoryPrivate orderedItemsLastVisitedOnDay:](self->_historyPrivate, "orderedItemsLastVisitedOnDay:", calendarDate);
}

- (BOOL)containsURL:(id)a3
{
  return -[WebHistoryPrivate containsURL:](self->_historyPrivate, "containsURL:", a3);
}

- (WebHistoryItem)itemForURL:(NSURL *)URL
{
  return (WebHistoryItem *)-[WebHistoryPrivate itemForURL:](self->_historyPrivate, "itemForURL:", URL);
}

- (BOOL)loadFromURL:(NSURL *)URL error:(NSError *)error
{
  id v7;
  BOOL v8;

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = -[WebHistoryPrivate loadFromURL:collectDiscardedItemsInto:error:](self->_historyPrivate, "loadFromURL:collectDiscardedItemsInto:error:", URL, v7, error);
  if (v8)
  {
    WebThreadPostNotification();
    if (objc_msgSend(v7, "count"))
      -[WebHistory _sendNotification:entries:](self, "_sendNotification:entries:", WebHistoryItemsDiscardedWhileLoadingNotification, v7);
  }
  if (v7)
    CFRelease(v7);
  return v8;
}

- (BOOL)saveToURL:(NSURL *)URL error:(NSError *)error
{
  _BOOL4 v4;

  v4 = -[WebHistoryPrivate saveToURL:error:](self->_historyPrivate, "saveToURL:error:", URL, error);
  if (v4)
    WebThreadPostNotification();
  return v4;
}

- (void)setHistoryItemLimit:(int)historyItemLimit
{
  -[WebHistoryPrivate setHistoryItemLimit:](self->_historyPrivate, "setHistoryItemLimit:", *(_QWORD *)&historyItemLimit);
}

- (int)historyItemLimit
{
  return -[WebHistoryPrivate historyItemLimit](self->_historyPrivate, "historyItemLimit");
}

- (void)setHistoryAgeInDaysLimit:(int)historyAgeInDaysLimit
{
  -[WebHistoryPrivate setHistoryAgeInDaysLimit:](self->_historyPrivate, "setHistoryAgeInDaysLimit:", *(_QWORD *)&historyAgeInDaysLimit);
}

- (int)historyAgeInDaysLimit
{
  return -[WebHistoryPrivate historyAgeInDaysLimit](self->_historyPrivate, "historyAgeInDaysLimit");
}

- (id)_itemForURLString:(id)a3
{
  return -[WebHistoryPrivate itemForURLString:](self->_historyPrivate, "itemForURLString:", a3);
}

- (id)allItems
{
  return -[WebHistoryPrivate allItems](self->_historyPrivate, "allItems");
}

- (id)_data
{
  return -[WebHistoryPrivate data](self->_historyPrivate, "data");
}

+ (void)_setVisitedLinkTrackingEnabled:(BOOL)a3
{
  if (s_shouldTrackVisitedLinks != a3)
  {
    s_shouldTrackVisitedLinks = a3;
    if (!a3)
      WebVisitedLinkStore::removeAllVisitedLinks((WebVisitedLinkStore *)a1, (void *)a2);
  }
}

- (void)_visitedURL:(id)a3 withTitle:(id)a4 method:(id)a5 wasFailure:(BOOL)a6
{
  StringImpl *v8;
  _QWORD *v9;
  uint64_t v10;
  WTF *v11;
  uint64_t v12;
  WTF::StringImpl **v13;
  uint64_t v14;
  WTF::StringImpl *v15;
  WTF *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v9 = -[WebHistoryPrivate visitedURL:withTitle:](self->_historyPrivate, "visitedURL:withTitle:", a3, a4, a5);
  *(_BYTE *)(*(_QWORD *)(v9[1] + 8) + 144) = a6;
  v10 = v9[1];
  v11 = *(WTF **)(v10 + 24);
  *(_QWORD *)(v10 + 24) = 0;
  if (v11)
  {
    v12 = *((unsigned int *)v11 + 3);
    if ((_DWORD)v12)
    {
      v13 = *(WTF::StringImpl ***)v11;
      v14 = 8 * v12;
      do
      {
        v15 = *v13;
        *v13 = 0;
        if (v15)
        {
          if (*(_DWORD *)v15 == 2)
            WTF::StringImpl::destroy(v15, v8);
          else
            *(_DWORD *)v15 -= 2;
        }
        ++v13;
        v14 -= 8;
      }
      while (v14);
    }
    v16 = *(WTF **)v11;
    if (*(_QWORD *)v11)
    {
      *(_QWORD *)v11 = 0;
      *((_DWORD *)v11 + 2) = 0;
      WTF::fastFree(v16, v8);
    }
    WTF::fastFree(v11, v8);
  }
  v17[0] = v9;
  -[WebHistory _sendNotification:entries:](self, "_sendNotification:entries:", WebHistoryItemsAddedNotification, objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1));
}

- (void)_addVisitedLinksToVisitedLinkStore:(void *)a3
{
  -[WebHistoryPrivate addVisitedLinksToVisitedLinkStore:](self->_historyPrivate, "addVisitedLinksToVisitedLinkStore:", a3);
}

@end
