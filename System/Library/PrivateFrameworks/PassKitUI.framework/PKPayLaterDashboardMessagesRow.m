@implementation PKPayLaterDashboardMessagesRow

- (PKPayLaterDashboardMessagesRow)initWithMessages:(id)a3 currentMessageIndex:(int64_t)a4 messagesViewDelegate:(id)a5
{
  id v9;
  id v10;
  PKPayLaterDashboardMessagesRow *v11;
  PKPayLaterDashboardMessagesRow *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPayLaterDashboardMessagesRow;
  v11 = -[PKPayLaterDashboardMessagesRow init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_messages, a3);
    v12->_currentMessageIndex = a4;
    objc_storeWeak((id *)&v12->_messagesViewDelegate, v10);
  }

  return v12;
}

- (NSCopying)identifier
{
  id v3;
  objc_class *v4;
  void *v5;
  NSOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = self->_messages;
  v7 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "identifier", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendString:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_currentMessageIndex);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v13);

  v14 = (void *)objc_msgSend(v3, "copy");
  return (NSCopying *)v14;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  PKDashboardMessagesView *v4;
  id WeakRetained;
  void *v6;
  id v7;

  v7 = a3;
  -[PKPayLaterDashboardMessagesRow cellClass](self, "cellClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(PKDashboardMessagesView);
    WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewDelegate);
    -[PKDashboardMessagesView setDelegate:](v4, "setDelegate:", WeakRetained);

    -[PKDashboardMessagesView updateWithMessages:currentIndex:](v4, "updateWithMessages:currentIndex:", self->_messages, self->_currentMessageIndex);
    objc_msgSend(v7, "setHostedContentView:", v4);
    objc_msgSend(v7, "backgroundConfiguration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundInsets:", *MEMORY[0x1E0DC3298], *(double *)(MEMORY[0x1E0DC3298] + 8), *(double *)(MEMORY[0x1E0DC3298] + 16), *(double *)(MEMORY[0x1E0DC3298] + 24));
    objc_msgSend(v7, "setBackgroundConfiguration:", v6);

  }
}

- (unint64_t)hash
{
  id v3;
  id WeakRetained;
  unint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewDelegate);
  objc_msgSend(v3, "safelyAddObject:", WeakRetained);

  objc_msgSend(v3, "safelyAddObject:", self->_messages);
  PKCombinedHash();
  v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKPayLaterDashboardMessagesRow *v4;
  PKPayLaterDashboardMessagesRow *v5;
  id *v6;
  id WeakRetained;
  id v8;
  BOOL v9;

  v4 = (PKPayLaterDashboardMessagesRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    WeakRetained = objc_loadWeakRetained((id *)&self->_messagesViewDelegate);
    v8 = objc_loadWeakRetained(v6 + 3);
    v9 = PKEqualObjects() && PKEqualObjects() && self->_currentMessageIndex == (_QWORD)v6[2];

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messagesViewDelegate);
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
