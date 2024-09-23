@implementation MFConversationViewCellExpansionTracker

- (MFConversationViewCellExpansionTracker)initWithDelegate:(id)a3
{
  id v4;
  MFConversationViewCellExpansionTracker *v5;
  MFConversationViewCellExpansionTracker *v6;
  void *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *expansionRecord;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFConversationViewCellExpansionTracker;
  v5 = -[MFConversationViewCellExpansionTracker init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[MFConversationViewCellExpansionTracker setDelegate:](v5, "setDelegate:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, "_updateCollapsingAllowed", MailApplicationDidChangeConversationViewCollapseReadMessagesNotification, 0);

    v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    expansionRecord = v6->_expansionRecord;
    v6->_expansionRecord = v8;

  }
  return v6;
}

- (void)_updateCollapsingAllowed
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationViewCellExpansionTracker delegate](self, "delegate"));
  objc_msgSend(v3, "expansionTracker:didChangeCollapsingAllowed:", self, objc_msgSend((id)objc_opt_class(self), "allowsCollapsing"));

}

+ (BOOL)allowsCollapsing
{
  return sub_1001D6C4C(0);
}

- (int64_t)expansionStatusForCellWithItemID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v4 = a3;
  if (objc_msgSend((id)objc_opt_class(self), "allowsCollapsing"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCellExpansionTracker expansionRecord](self, "expansionRecord"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v4));

    if (v6)
      v7 = (int64_t)objc_msgSend(v6, "integerValue");
    else
      v7 = 0;

  }
  else
  {
    v7 = 3;
  }

  return v7;
}

- (void)setMessageWithItemID:(id)a3 expansionStatus:(int64_t)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCellExpansionTracker expansionRecord](self, "expansionRecord"));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

- (void)resetRecord
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[MFConversationViewCellExpansionTracker expansionRecord](self, "expansionRecord"));
  objc_msgSend(v2, "removeAllObjects");

}

- (NSDictionary)dictionaryRepresentation
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCellExpansionTracker expansionRecord](self, "expansionRecord"));
  v3 = objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (void)restoreDictionaryRepresentation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[MFConversationViewCellExpansionTracker resetRecord](self, "resetRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFConversationViewCellExpansionTracker expansionRecord](self, "expansionRecord"));
  objc_msgSend(v4, "addEntriesFromDictionary:", v5);

}

- (MFConversationViewCellExpansionTrackerDelegate)delegate
{
  return (MFConversationViewCellExpansionTrackerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)expansionRecord
{
  return self->_expansionRecord;
}

- (void)setExpansionRecord:(id)a3
{
  objc_storeStrong((id *)&self->_expansionRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expansionRecord, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
