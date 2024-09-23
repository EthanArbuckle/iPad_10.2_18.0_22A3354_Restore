@implementation PKDashboardMessageRowItem

- (PKDashboardMessageRowItem)initWithMessages:(id)a3 currentMessageIndex:(int64_t)a4 messagesViewDelegate:(id)a5
{
  id v9;
  id v10;
  PKDashboardMessageRowItem *v11;
  PKDashboardMessageRowItem *v12;
  objc_super v14;

  v9 = a3;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKDashboardMessageRowItem;
  v11 = -[PKDashboardMessageRowItem init](&v14, sel_init);
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
  return (NSCopying *)CFSTR("dashboardMessageRowItem");
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
  PKDashboardMessageRowItem *v4;
  PKDashboardMessageRowItem *v5;
  id *v6;
  id WeakRetained;
  id v8;
  BOOL v9;

  v4 = (PKDashboardMessageRowItem *)a3;
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

- (NSOrderedSet)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (int64_t)currentMessageIndex
{
  return self->_currentMessageIndex;
}

- (void)setCurrentMessageIndex:(int64_t)a3
{
  self->_currentMessageIndex = a3;
}

- (PKDashboardMessagesViewDelegate)messagesViewDelegate
{
  return (PKDashboardMessagesViewDelegate *)objc_loadWeakRetained((id *)&self->_messagesViewDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_messagesViewDelegate);
  objc_storeStrong((id *)&self->_messages, 0);
}

@end
