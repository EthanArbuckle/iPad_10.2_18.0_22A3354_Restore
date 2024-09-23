@implementation TUReplyWithMessageStore

- (TUReplyWithMessageStore)init
{
  TUReplyWithMessageStore *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUReplyWithMessageStore;
  v2 = -[TUReplyWithMessageStore init](&v5, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_TUReplyWithMessageStore_HandleMessageStoreChanged, CFSTR("com.apple.TelephonyUtilities.TUReplyWithMessageStoreChanged"), v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    CFPreferencesAppSynchronize(TUMobilePhoneDomain);
  }
  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)TUReplyWithMessageStore;
  -[TUReplyWithMessageStore dealloc](&v4, sel_dealloc);
}

- (int)count
{
  return 3;
}

- (id)_defaultRepliesForSending:(BOOL)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = CFSTR("CANNED_REPLY_%d");
  if (a3)
    v4 = CFSTR("CANNED_REPLY_SENDING_%d");
  v5 = v4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TUReplyWithMessageStore count](self, "count") >= 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v5, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      TUBundle();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", v8, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObject:", v10);

      v7 = (v7 + 1);
    }
    while ((int)v7 < -[TUReplyWithMessageStore count](self, "count"));
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)defaultReplies
{
  return -[TUReplyWithMessageStore _defaultRepliesForSending:](self, "_defaultRepliesForSending:", 0);
}

- (id)customReplies
{
  CFPropertyListRef v3;
  const void *v4;
  CFTypeID v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v3 = CFPreferencesCopyAppValue(CFSTR("TUReplyWithMessageStoreReplyArray"), TUMobilePhoneDomain);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == CFArrayGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v4);
      if (v6)
        goto LABEL_7;
    }
    else
    {
      CFRelease(v4);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
  v7 = objc_msgSend(v6, "count");
  if (v7 < -[TUReplyWithMessageStore count](self, "count"))
  {
    do
    {
      objc_msgSend(v6, "addObject:", &stru_1E38A53C8);
      v8 = objc_msgSend(v6, "count");
    }
    while (v8 < -[TUReplyWithMessageStore count](self, "count"));
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_cannedRepliesForSending:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99DE8];
  -[TUReplyWithMessageStore _defaultRepliesForSending:](self, "_defaultRepliesForSending:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "arrayWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[TUReplyWithMessageStore customReplies](self, "customReplies");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      v13 = v10;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v7);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v12);
        if ((objc_msgSend(v14, "isEqualToString:", &stru_1E38A53C8) & 1) == 0)
          objc_msgSend(v6, "replaceObjectAtIndex:withObject:", v13 + v12, v14);
        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v10 = v13 + v12;
    }
    while (v9);
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)cannedReplies
{
  return -[TUReplyWithMessageStore _cannedRepliesForSending:](self, "_cannedRepliesForSending:", 0);
}

- (id)cannedReplyActionSheetOptions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0C99DE8];
  -[TUReplyWithMessageStore cannedReplies](self, "cannedReplies");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[TUReplyWithMessageStore count](self, "count") >= 1)
  {
    v6 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndex:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _TUFormatReplyForOptions(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "replaceObjectAtIndex:withObject:", v6, v8);

      ++v6;
    }
    while (v6 < -[TUReplyWithMessageStore count](self, "count"));
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)cannedRepliesForSending
{
  return -[TUReplyWithMessageStore _cannedRepliesForSending:](self, "_cannedRepliesForSending:", 1);
}

- (void)setCustomReply:(id)a3 atIndex:(unint64_t)a4
{
  const __CFString *v6;
  CFPropertyListRef v7;
  const void *v8;
  CFTypeID v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFString *v14;

  v6 = (const __CFString *)a3;
  v7 = CFPreferencesCopyAppValue(CFSTR("TUReplyWithMessageStoreReplyArray"), TUMobilePhoneDomain);
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    if (v9 == CFArrayGetTypeID())
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CFRelease(v8);
      if (v10)
        goto LABEL_9;
    }
    else
    {
      CFRelease(v8);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[TUReplyWithMessageStore count](self, "count"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TUReplyWithMessageStore count](self, "count") >= 1)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v10, "addObject:", &stru_1E38A53C8);
      ++v11;
    }
    while (v11 < -[TUReplyWithMessageStore count](self, "count"));
  }
LABEL_9:
  if (v6)
    v12 = v6;
  else
    v12 = &stru_1E38A53C8;
  v14 = (__CFString *)v12;
  objc_msgSend(v10, "replaceObjectAtIndex:withObject:", a4);
  CFPreferencesSetAppValue(CFSTR("TUReplyWithMessageStoreReplyArray"), v10, TUMobilePhoneDomain);
  CFPreferencesAppSynchronize(TUMobilePhoneDomain);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.TelephonyUtilities.TUReplyWithMessageStoreChanged"), 0, 0, 1u);

}

- (void)_handleMessagesStoreChanged
{
  CFPreferencesAppSynchronize(TUMobilePhoneDomain);
}

@end
