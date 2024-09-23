@implementation CalendarMessageAttendeeReplyCell

+ (int64_t)numberOfLinesForTitleLabels
{
  return 2;
}

+ (int64_t)numberOfLinesForBodyLabels
{
  return 4;
}

- (id)titleStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void **v7;
  NSBundle *v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
    v12 = v6;
    v7 = &v12;
  }
  else
  {
    v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("(No Title)"), &stru_1001B67C0, 0));
    v11 = v6;
    v7 = &v11;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 1));

  return v9;
}

- (void)updateAuthor
{
  CalendarMessageAttendeeReplyCell *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  CalendarMessageAttendeeReplyCell *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageAttendeeReplyCell bodyStringDict](self, "bodyStringDict"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyImportantAttendee));
  v5 = objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorView](v2, "authorView"));
  v6 = (void *)v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorCacheKeyForIdentity:](v2, "authorCacheKeyForIdentity:", v4));
    v8 = objc_msgSend((id)objc_opt_class(v2), "authorCacheObjectForKey:", v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = (void *)v9;
    if (v9)
    {
      v48 = v9;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v48, 1));
      objc_msgSend(v6, "updateWithContacts:", v11);

    }
    else
    {
      if (objc_msgSend(v6, "loadContactsAsynchronously"))
        objc_msgSend(v6, "updateWithContacts:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorAddressForIdentity:](v2, "authorAddressForIdentity:", v4));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstName"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastName"));
      objc_msgSend(v6, "updateWithAddress:fullName:firstName:lastName:", v32, v33, v34, v35);

      if ((objc_msgSend(v6, "loadContactsAsynchronously") & 1) == 0)
      {
        v36 = (void *)objc_opt_class(v2);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contact"));
        objc_msgSend(v36, "authorCacheSetObject:forKey:", v37, v7);

      }
    }

  }
  else
  {
    v38 = (void *)v5;
    v39 = v3;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](v2, "notification"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "attendees"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v13, "count")));

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](v2, "notification"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "attendees"));

    obj = v16;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v44;
      v40 = v14;
      do
      {
        v20 = 0;
        v41 = v18;
        do
        {
          if (*(_QWORD *)v44 != v19)
            objc_enumerationMutation(obj);
          v21 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorCacheKeyForIdentity:](v2, "authorCacheKeyForIdentity:", v21));
          v23 = objc_msgSend((id)objc_opt_class(v2), "authorCacheObjectForKey:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
          if (!v24)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell authorAddressForIdentity:](v2, "authorAddressForIdentity:", v21));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "name"));
            v27 = v2;
            v28 = v19;
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstName"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "lastName"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(+[EKUILabeledAvatarView contactKeysToFetch](EKUILabeledAvatarView, "contactKeysToFetch"));
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[ContactsUtils contactForAddress:fullName:firstName:lastName:keysToFetch:](ContactsUtils, "contactForAddress:fullName:firstName:lastName:keysToFetch:", v25, v26, v29, v30, v31));

            v19 = v28;
            v2 = v27;

            v18 = v41;
            v14 = v40;
            objc_msgSend((id)objc_opt_class(v27), "authorCacheSetObject:forKey:", v24, v22);
          }
          objc_msgSend(v14, "addObject:", v24);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v18);
    }

    v6 = v38;
    objc_msgSend(v38, "updateWithContacts:", v14);
    v7 = v14;
    v4 = 0;
    v3 = v39;
  }

}

- (id)bodyStringDict
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_bodyStringDict:", v4));

  return v5;
}

+ (id)_bodyStringDict:(id)a3
{
  return objc_msgSend(a3, "descriptionStrings:", CUIKCalendarNoboDescriptionProfile);
}

- (id)actions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v10;

  -[CalendarMessageAttendeeReplyCell layoutIfNeeded](self, "layoutIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "eventStoreForCell:", self));

  v5 = (void *)objc_opt_class(self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CalendarMessageCell notification](self, "notification"));
  v10 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "actionsForNotification:proposedTimeAttendee:eventStore:", v6, &v10, v4));
  v8 = v10;

  -[CalendarMessageAttendeeReplyCell setProposedTimeAttendee:](self, "setProposedTimeAttendee:", v8);
  return v7;
}

+ (id)actionsForNotification:(id)a3 proposedTimeAttendee:(id *)a4 eventStore:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UNKNOWN **v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v33;
  id v34;
  id v35;
  NSMutableArray *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];

  v8 = a3;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "_bodyStringDict:", v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyImportantAttendee));
  v12 = v11;
  if (v11
    && objc_msgSend(v11, "proposedStartDateChanged")
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "proposedStartDate")), v13, v13))
  {
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    if ((objc_msgSend(v12, "proposedStartDateDeclined") & 1) != 0)
    {
      v14 = &off_1001BC760;
    }
    else
    {
      v33 = v10;
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectID"));
      v35 = v8;
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "startDate"));
      v34 = v9;
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "eventForObjectID:occurrenceDate:checkValid:", v18, v19, 0));

      v36 = objc_opt_new(NSMutableArray);
      v37 = 0u;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "attendees"));
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v38;
        while (2)
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(_QWORD *)v38 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
            v27 = objc_opt_class(EKAttendee);
            if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
            {
              v28 = v26;
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "emailAddress"));
              v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "emailAddress"));
              v31 = objc_msgSend(v29, "isEqual:", v30);

              if (v31)
              {
                -[NSMutableArray addObject:](v36, "addObject:", v28);

                goto LABEL_29;
              }

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
          if (v23)
            continue;
          break;
        }
      }
LABEL_29:

      if (+[EKUIEmailCompositionManager canShowViewControllerForEvent:withParticipantRecipients:](EKUIEmailCompositionManager, "canShowViewControllerForEvent:withParticipantRecipients:", v20, v36))v14 = &off_1001BC778;
      else
        v14 = &off_1001BC790;

      v9 = v34;
      v8 = v35;
      v10 = v33;
    }
  }
  else
  {
    if (a4)
      *a4 = 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyTimeProposals));

    if (v15)
    {
      v14 = &off_1001BC7A8;
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyComment));

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CUIKNotificationDescriptionKeyMultipleComments));

        if (v17)
          v14 = &off_1001BC7D8;
        else
          v14 = &off_1001BC7F0;
      }
      else
      {
        v14 = &off_1001BC7C0;
      }
    }
  }

  return v14;
}

- (unint64_t)options
{
  return 4;
}

- (void)setNotification:(id)a3
{
  id v4;
  uint64_t v5;
  NSString *dateString;
  objc_super v7;

  v4 = a3;
  -[CalendarMessageCell setHasDisclosure:](self, "setHasDisclosure:", EKUICurrentWidthSizeClassIsCompactInViewHierarchy(self, v5));
  dateString = self->_dateString;
  self->_dateString = 0;

  v7.receiver = self;
  v7.super_class = (Class)CalendarMessageAttendeeReplyCell;
  -[CalendarMessageCell setNotification:](&v7, "setNotification:", v4);

}

- (EKCalendarEventInvitationNotificationAttendee)proposedTimeAttendee
{
  return self->_proposedTimeAttendee;
}

- (void)setProposedTimeAttendee:(id)a3
{
  objc_storeStrong((id *)&self->_proposedTimeAttendee, a3);
}

- (CUIKMessageStrings)messageStrings
{
  return self->_messageStrings;
}

- (void)setMessageStrings:(id)a3
{
  objc_storeStrong((id *)&self->_messageStrings, a3);
}

- (NSString)dateString
{
  return self->_dateString;
}

- (void)setDateString:(id)a3
{
  objc_storeStrong((id *)&self->_dateString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateString, 0);
  objc_storeStrong((id *)&self->_messageStrings, 0);
  objc_storeStrong((id *)&self->_proposedTimeAttendee, 0);
}

@end
