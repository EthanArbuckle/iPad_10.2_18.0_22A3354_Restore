@implementation SXCalendarEventActionActivityProvider

- (SXCalendarEventActionActivityProvider)initWithCalendarPresenter:(id)a3 host:(id)a4
{
  id v7;
  id v8;
  SXCalendarEventActionActivityProvider *v9;
  SXCalendarEventActionActivityProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXCalendarEventActionActivityProvider;
  v9 = -[SXCalendarEventActionActivityProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_calendarPresenter, a3);
    objc_storeStrong((id *)&v10->_host, a4);
  }

  return v10;
}

- (id)activityGroupForAction:(id)a3
{
  id v4;
  SXActionActivityGroup *v5;
  void *v6;
  SXActionActivityGroup *v7;
  SXBlockActionActivity *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  SXBlockActionActivity *v13;
  SXBlockActionActivity *v14;
  void *v15;
  void *v16;
  id v17;
  SXBlockActionActivity *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t);
  void *v23;
  SXCalendarEventActionActivityProvider *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v4 = a3;
  v5 = [SXActionActivityGroup alloc];
  objc_msgSend(v4, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SXActionActivityGroup initWithTitle:](v5, "initWithTitle:", v6);

  v8 = [SXBlockActionActivity alloc];
  SXBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("Create Event"), &stru_24D68E0F8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke;
  v26[3] = &unk_24D6875A0;
  v26[4] = self;
  v12 = v4;
  v27 = v12;
  v13 = -[SXBlockActionActivity initWithLabel:type:block:](v8, "initWithLabel:type:block:", v10, 0, v26);
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v13);

  v14 = [SXBlockActionActivity alloc];
  SXBundle();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Show in Calendar"), &stru_24D68E0F8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v11;
  v21 = 3221225472;
  v22 = __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke_2;
  v23 = &unk_24D6875A0;
  v24 = self;
  v25 = v12;
  v17 = v12;
  v18 = -[SXBlockActionActivity initWithLabel:type:block:](v14, "initWithLabel:type:block:", v16, 1, &v20);
  -[SXActionActivityGroup addActivity:](v7, "addActivity:", v18, v20, v21, v22, v23, v24);

  return v7;
}

uint64_t __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createEvent:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__SXCalendarEventActionActivityProvider_activityGroupForAction___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showInCalendar:", *(_QWORD *)(a1 + 40));
}

- (void)createEvent:(id)a3
{
  id v4;
  SXPresentableCalendarEvent *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SXPresentableCalendarEvent *v14;

  v4 = a3;
  v5 = [SXPresentableCalendarEvent alloc];
  objc_msgSend(v4, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[SXPresentableCalendarEvent initWithStartDate:](v5, "initWithStartDate:", v6);

  objc_msgSend(v4, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXPresentableCalendarEvent setEndDate:](v14, "setEndDate:", v7);

  objc_msgSend(v4, "timeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXPresentableCalendarEvent setTimeZone:](v14, "setTimeZone:", v8);

  -[SXPresentableCalendarEvent setAllDay:](v14, "setAllDay:", objc_msgSend(v4, "allDay"));
  objc_msgSend(v4, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXPresentableCalendarEvent setTitle:](v14, "setTitle:", v9);

  objc_msgSend(v4, "URL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXPresentableCalendarEvent setURL:](v14, "setURL:", v10);

  objc_msgSend(v4, "notes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXPresentableCalendarEvent setNotes:](v14, "setNotes:", v11);

  objc_msgSend(v4, "location");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SXPresentableCalendarEvent setLocation:](v14, "setLocation:", v12);
  -[SXCalendarEventActionActivityProvider calendarPresenter](self, "calendarPresenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentCalendarEvent:", v14);

}

- (void)showInCalendar:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (void *)MEMORY[0x24BDBCF48];
  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a3, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  objc_msgSend(v5, "stringWithFormat:", CFSTR("calshow:%d"), (int)v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLWithString:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[SXCalendarEventActionActivityProvider host](self, "host");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "openURL:completion:", v10, 0);

}

- (SXCalendarPresenter)calendarPresenter
{
  return self->_calendarPresenter;
}

- (SXHost)host
{
  return self->_host;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_calendarPresenter, 0);
}

@end
