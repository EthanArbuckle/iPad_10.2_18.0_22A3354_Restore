@implementation InboxRepliedSectionItem

- (InboxRepliedSectionItem)initWithOccurrenceInfo:(id)a3
{
  id v5;
  InboxRepliedSectionItem *v6;
  InboxRepliedSectionItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)InboxRepliedSectionItem;
  v6 = -[InboxRepliedSectionItem init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_occurrenceInfo, a3);

  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)InboxRepliedSectionItem;
  v3 = -[InboxRepliedSectionItem description](&v11, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionItem cellFrameDictionary](self, "cellFrameDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionItem event](self, "event"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionItem occurrenceInfo](self, "occurrenceInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[InboxRepliedSectionItem notification](self, "notification"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("[%@] cellFrameDictionary: [%@] event: [%@] occurrenceInfo: [%@] notification: [%@]"), v4, v5, v6, v7, v8));

  return v9;
}

- (EKEventOccurrenceInfo)occurrenceInfo
{
  return self->_occurrenceInfo;
}

- (void)setOccurrenceInfo:(id)a3
{
  objc_storeStrong((id *)&self->_occurrenceInfo, a3);
}

- (EKEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (EKCalendarEventInvitationNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (NSDictionary)cellFrameDictionary
{
  return self->_cellFrameDictionary;
}

- (void)setCellFrameDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_cellFrameDictionary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellFrameDictionary, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_event, 0);
  objc_storeStrong((id *)&self->_occurrenceInfo, 0);
}

@end
