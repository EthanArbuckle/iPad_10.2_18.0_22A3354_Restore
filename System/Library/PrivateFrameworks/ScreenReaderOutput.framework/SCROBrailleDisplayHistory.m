@implementation SCROBrailleDisplayHistory

+ (void)initialize
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = objc_alloc(MEMORY[0x24BDBCE70]);
    v12 = (id)objc_msgSend(v4, "initWithObjectsAndKeys:", MEMORY[0x24BDBD1C8], kSCROHistoryAttribute, MEMORY[0x24BDBD1C0], kSCROUnreadAttribute, 0);
    v5 = objc_alloc(MEMORY[0x24BDD1458]);
    v6 = (void *)MEMORY[0x24BDD1488];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleForClass:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("noAnnouncements"), &stru_24CC1DB88, CFSTR("Server"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v5, "initWithString:attributes:", v9, v12);
    v11 = (void *)_NoAnnouncementString;
    _NoAnnouncementString = v10;

  }
}

- (SCROBrailleDisplayHistory)init
{
  SCROBrailleDisplayHistory *v2;
  const __CFAllocator *v3;
  const CFArrayCallBacks *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCROBrailleDisplayHistory;
  v2 = -[SCROBrailleDisplayHistory init](&v6, sel_init);
  if (v2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v4 = (const CFArrayCallBacks *)MEMORY[0x24BDBD690];
    v2->_announcements = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    v2->_unreadSnapshot = CFArrayCreateMutable(v3, 0, v4);
    v2->_currentIndex = -1;
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_announcements);
  self->_announcements = 0;
  CFRelease(self->_unreadSnapshot);
  self->_unreadSnapshot = 0;
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleDisplayHistory;
  -[SCROBrailleDisplayHistory dealloc](&v3, sel_dealloc);
}

- (void)addString:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t currentIndex;
  BOOL v8;
  int64_t v9;
  void *value;

  value = (void *)objc_msgSend(a3, "mutableCopy");
  if (objc_msgSend(value, "length"))
  {
    objc_msgSend(value, "removeAttribute:range:", kSCROAlertAttribute[0], 0, 1);
  }
  else
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", CFSTR(" "));
    objc_msgSend(value, "appendAttributedString:", v4);

  }
  v5 = MEMORY[0x24BDBD1C8];
  objc_msgSend(value, "addAttribute:value:range:", kSCROHistoryAttribute, MEMORY[0x24BDBD1C8], 0, 1);
  objc_msgSend(value, "addAttribute:value:range:", kSCROUnreadAttribute, v5, 0, 1);
  CFArrayAppendValue(self->_announcements, value);
  if (self->_currentIndex < 0)
    self->_currentIndex = 0;
  ++self->_unreadCount;
  if (CFArrayGetCount(self->_announcements) >= 11)
  {
    do
    {
      CFArrayGetValueAtIndex(self->_announcements, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (SCROBrailleDisplayHistoryIsStringUnread(v6))
        --self->_unreadCount;
      CFArrayRemoveValueAtIndex(self->_announcements, 0);
      currentIndex = self->_currentIndex;
      v8 = currentIndex < 1;
      v9 = currentIndex - 1;
      if (!v8)
        self->_currentIndex = v9;

    }
    while (CFArrayGetCount(self->_announcements) > 10);
  }

}

- (void)snapshotUnread
{
  CFIndex Count;
  CFIndex v4;
  void *value;

  CFArrayRemoveAllValues(self->_unreadSnapshot);
  Count = CFArrayGetCount(self->_announcements);
  if (Count >= 1)
  {
    v4 = Count + 1;
    while (1)
    {
      CFArrayGetValueAtIndex(self->_announcements, v4 - 2);
      value = (void *)objc_claimAutoreleasedReturnValue();
      if (!SCROBrailleDisplayHistoryIsStringUnread(value))
        break;
      CFArrayAppendValue(self->_unreadSnapshot, value);

      if ((unint64_t)--v4 <= 1)
        return;
    }

  }
}

- (void)markSnapshotAsRead
{
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  void *v6;

  Count = CFArrayGetCount(self->_unreadSnapshot);
  if (Count >= 1)
  {
    v4 = Count;
    for (i = 0; i != v4; ++i)
    {
      CFArrayGetValueAtIndex(self->_unreadSnapshot, i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (SCROBrailleDisplayHistoryIsStringUnread(v6))
      {
        objc_msgSend(v6, "removeAttribute:range:", kSCROUnreadAttribute, 0, 1);
        --self->_unreadCount;
      }

    }
  }
  CFArrayRemoveAllValues(self->_unreadSnapshot);
}

- (BOOL)hasUnread
{
  return self->_unreadCount > 0;
}

- (id)currentString
{
  CFIndex currentIndex;
  uint64_t v4;
  void *v5;
  CFIndex Count;
  void *v7;
  void *v8;
  id v9;

  currentIndex = self->_currentIndex;
  if (currentIndex < 0
    || (CFArrayGetValueAtIndex(self->_announcements, currentIndex), (v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v9 = (id)_NoAnnouncementString;
  }
  else
  {
    v5 = (void *)v4;
    Count = CFArrayGetCount(self->_announcements);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithAttributedString:", v5);
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%ld "), Count - self->_currentIndex);
    objc_msgSend(v7, "replaceCharactersInRange:withString:", 0, 0, v8);
    v9 = (id)objc_msgSend(v7, "copy");

  }
  return v9;
}

- (BOOL)moveToNext
{
  return -[SCROBrailleDisplayHistory _moveIndexBy:](self, "_moveIndexBy:", 1);
}

- (BOOL)moveToPrevious
{
  return -[SCROBrailleDisplayHistory _moveIndexBy:](self, "_moveIndexBy:", -1);
}

- (BOOL)_moveIndexBy:(int64_t)a3
{
  CFIndex currentIndex;
  CFIndex Count;
  int64_t v7;
  int64_t v8;
  void *v10;

  currentIndex = self->_currentIndex;
  Count = CFArrayGetCount(self->_announcements);
  v7 = Count - 1;
  if (Count < 1)
    return 0;
  v8 = self->_currentIndex;
  if (v8 + a3 < Count)
    v7 = v8 + a3;
  if (v8 + a3 < 0)
    v7 = 0;
  if (v7 == v8)
    return 0;
  self->_currentIndex = v7;
  CFArrayGetValueAtIndex(self->_announcements, currentIndex);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (SCROBrailleDisplayHistoryIsStringUnread(v10))
  {
    objc_msgSend(v10, "removeAttribute:range:", kSCROUnreadAttribute, 0, 1);
    --self->_unreadCount;
  }

  return 1;
}

- (BOOL)isOnMostRecent
{
  int64_t currentIndex;

  currentIndex = self->_currentIndex;
  return currentIndex == CFArrayGetCount(self->_announcements) - 1;
}

- (void)moveToMostRecent
{
  self->_currentIndex = CFArrayGetCount(self->_announcements) - 1;
}

@end
