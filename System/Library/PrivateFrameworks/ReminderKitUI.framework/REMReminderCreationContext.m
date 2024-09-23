@implementation REMReminderCreationContext

- (REMReminderCreationContext)initWithDelegate:(id)a3
{
  id v4;
  REMReminderCreationContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  objc_super v24;

  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)REMReminderCreationContext;
  v5 = -[REMReminderCreationContext init](&v24, sel_init);
  if (v5)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "reminderID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderCreationContext setReminderID:](v5, "setReminderID:", v6);

    }
    objc_msgSend(v4, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "notes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setNotes:](v5, "setNotes:", v8);

    if ((objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v4, "dueDateComponents"), v9 = (void *)objc_claimAutoreleasedReturnValue(), v9, v9))
    {
      objc_msgSend(v4, "dueDateComponents");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "rem_isAllDayDateComponents");
      objc_msgSend(v10, "timeZone");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        objc_msgSend(MEMORY[0x24BDBCF38], "localTimeZone");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(MEMORY[0x24BDBCE68], "rem_dateWithDateComponents:timeZone:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        objc_msgSend(MEMORY[0x24BDBCE68], "rem_dateComponentsWithDate:timeZone:isAllDay:", v13, v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderCreationContext setDueDateComponents:](v5, "setDueDateComponents:", v14);

      }
      else
      {
        -[REMReminderCreationContext setDueDateComponents:](v5, "setDueDateComponents:", 0);
      }

    }
    else
    {
      -[REMReminderCreationContext setDueDateComponents:](v5, "setDueDateComponents:", 0);
    }
    objc_msgSend(v4, "location");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setLocation:](v5, "setLocation:", v15);

    objc_msgSend(v4, "locationString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setLocationString:](v5, "setLocationString:", v16);

    objc_msgSend(v4, "url");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setUrl:](v5, "setUrl:", v17);

    objc_msgSend(v4, "userActivity");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setUserActivity:](v5, "setUserActivity:", v18);

    if ((objc_opt_respondsToSelector() & 1) != 0)
      v19 = objc_msgSend(v4, "wantsExtendedDetailOnlyView");
    else
      v19 = 0;
    -[REMReminderCreationContext setWantsExtendedDetailOnlyView:](v5, "setWantsExtendedDetailOnlyView:", v19);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v20 = objc_msgSend(v4, "titleIsGeneratedSuggestion");
    else
      v20 = 0;
    -[REMReminderCreationContext setTitleIsGeneratedSuggestion:](v5, "setTitleIsGeneratedSuggestion:", v20);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "siriFoundInAppsData");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderCreationContext setSiriFoundInAppsData:](v5, "setSiriFoundInAppsData:", v21);

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v22 = objc_msgSend(v4, "locationProximity");
    else
      v22 = 0;
    -[REMReminderCreationContext setLocationProximity:](v5, "setLocationProximity:", v22);
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  -[REMReminderCreationContext reminderID](self, "reminderID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v4, CFSTR("reminderID"));

  -[REMReminderCreationContext title](self, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v5, CFSTR("title"));

  -[REMReminderCreationContext notes](self, "notes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v6, CFSTR("notes"));

  -[REMReminderCreationContext dueDateComponents](self, "dueDateComponents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v7, CFSTR("dueDateComponents"));

  -[REMReminderCreationContext location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v8, CFSTR("location"));

  -[REMReminderCreationContext locationString](self, "locationString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v9, CFSTR("locationString"));

  -[REMReminderCreationContext url](self, "url");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v10, CFSTR("url"));

  -[REMReminderCreationContext siriFoundInAppsData](self, "siriFoundInAppsData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "encodeObject:forKey:", v11, CFSTR("siriFoundInAppsData"));

  objc_msgSend(v16, "encodeBool:forKey:", -[REMReminderCreationContext wantsExtendedDetailOnlyView](self, "wantsExtendedDetailOnlyView"), CFSTR("wantsExtendedDetailOnlyView"));
  objc_msgSend(v16, "encodeBool:forKey:", -[REMReminderCreationContext titleIsGeneratedSuggestion](self, "titleIsGeneratedSuggestion"), CFSTR("titleIsGeneratedSuggestion"));
  objc_msgSend(v16, "encodeInteger:forKey:", -[REMReminderCreationContext locationProximity](self, "locationProximity"), CFSTR("locationProximity"));
  -[REMReminderCreationContext userActivity](self, "userActivity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[REMReminderCreationContext userActivity](self, "userActivity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7D2B8]), "initWithUserActivity:", v13);
    objc_msgSend(v14, "archivedDictionaryData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v16, "encodeObject:forKey:", v15, CFSTR("userActivity"));

}

- (REMReminderCreationContext)initWithCoder:(id)a3
{
  id v4;
  REMReminderCreationContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = -[REMReminderCreationContext initWithDelegate:](self, "initWithDelegate:", 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reminderID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setReminderID:](v5, "setReminderID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setTitle:](v5, "setTitle:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("notes"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setNotes:](v5, "setNotes:", v8);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dueDateComponents"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setDueDateComponents:](v5, "setDueDateComponents:", v9);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setLocation:](v5, "setLocation:", v10);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locationString"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setLocationString:](v5, "setLocationString:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setUrl:](v5, "setUrl:", v12);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("siriFoundInAppsData"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderCreationContext setSiriFoundInAppsData:](v5, "setSiriFoundInAppsData:", v13);

    -[REMReminderCreationContext setWantsExtendedDetailOnlyView:](v5, "setWantsExtendedDetailOnlyView:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsExtendedDetailOnlyView")));
    -[REMReminderCreationContext setTitleIsGeneratedSuggestion:](v5, "setTitleIsGeneratedSuggestion:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("titleIsGeneratedSuggestion")));
    -[REMReminderCreationContext setLocationProximity:](v5, "setLocationProximity:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("locationProximity")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userActivity"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(MEMORY[0x24BE7D2B8], "userActivityWithDictionaryData:error:", v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "userActivity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderCreationContext setUserActivity:](v5, "setUserActivity:", v16);

    }
  }

  return v5;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (void)setReminderID:(id)a3
{
  objc_storeStrong((id *)&self->_reminderID, a3);
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSAttributedString)notes
{
  return self->_notes;
}

- (void)setNotes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDateComponents)dueDateComponents
{
  return self->_dueDateComponents;
}

- (void)setDueDateComponents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (CLLocation)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)locationString
{
  return self->_locationString;
}

- (void)setLocationString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)locationProximity
{
  return self->_locationProximity;
}

- (void)setLocationProximity:(int64_t)a3
{
  self->_locationProximity = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSData)siriFoundInAppsData
{
  return self->_siriFoundInAppsData;
}

- (void)setSiriFoundInAppsData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (void)setUserActivity:(id)a3
{
  objc_storeStrong((id *)&self->_userActivity, a3);
}

- (BOOL)wantsExtendedDetailOnlyView
{
  return self->_wantsExtendedDetailOnlyView;
}

- (void)setWantsExtendedDetailOnlyView:(BOOL)a3
{
  self->_wantsExtendedDetailOnlyView = a3;
}

- (BOOL)titleIsGeneratedSuggestion
{
  return self->_titleIsGeneratedSuggestion;
}

- (void)setTitleIsGeneratedSuggestion:(BOOL)a3
{
  self->_titleIsGeneratedSuggestion = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_siriFoundInAppsData, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_locationString, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_dueDateComponents, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_reminderID, 0);
}

@end
