@implementation SXCalendarPresenter

- (SXCalendarPresenter)initWithViewControllerPresenting:(id)a3 eventStoreProvider:(id)a4
{
  id v7;
  id v8;
  SXCalendarPresenter *v9;
  SXCalendarPresenter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXCalendarPresenter;
  v9 = -[SXCalendarPresenter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewControllerPresenting, a3);
    objc_storeStrong((id *)&v10->_eventStoreProvider, a4);
  }

  return v10;
}

- (void)presentCalendarEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_initWeak(&location, self);
      dispatch_get_global_queue(25, 0);
      v7 = objc_claimAutoreleasedReturnValue();
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __44__SXCalendarPresenter_presentCalendarEvent___block_invoke;
      v8[3] = &unk_24D687730;
      v8[4] = self;
      objc_copyWeak(&v10, &location);
      v9 = v5;
      dispatch_async(v7, v8);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }

}

void __44__SXCalendarPresenter_presentCalendarEvent___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1[4], "eventStoreProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "eventStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_2;
  v7[3] = &unk_24D687708;
  objc_copyWeak(&v11, a1 + 6);
  v4 = v3;
  v8 = v4;
  v5 = a1[5];
  v6 = a1[4];
  v9 = v5;
  v10 = v6;
  objc_msgSend(v4, "requestWriteOnlyAccessToEventsWithCompletion:", v7);

  objc_destroyWeak(&v11);
}

void __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_2(uint64_t a1, char a2)
{
  id v3;
  uint64_t v4;
  _QWORD block[4];
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  char v10;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_3;
  block[3] = &unk_24D6876E0;
  v10 = a2;
  objc_copyWeak(&v9, (id *)(a1 + 56));
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7 = v3;
  v8 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __44__SXCalendarPresenter_presentCalendarEvent___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id WeakRetained;

  if (*(_BYTE *)(a1 + 64) && (v2 = objc_loadWeakRetained((id *)(a1 + 56)), v2, v2))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    objc_msgSend(MEMORY[0x24BDC74E0], "eventWithEventStore:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setStartDate:", v4);

    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEndDate:", v5);

    objc_msgSend(*(id *)(a1 + 40), "timeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTimeZone:", v6);

    objc_msgSend(v3, "setAllDay:", objc_msgSend(*(id *)(a1 + 40), "allDay"));
    objc_msgSend(*(id *)(a1 + 40), "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setTitle:", v7);

    objc_msgSend(*(id *)(a1 + 40), "URL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setURL:", v8);

    objc_msgSend(*(id *)(a1 + 40), "notes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setNotes:", v10);

    objc_msgSend(*(id *)(a1 + 40), "location");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setLocation:", v11);

    v12 = objc_alloc_init(MEMORY[0x24BDC7620]);
    objc_msgSend(v12, "setEventStore:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v12, "setEvent:", v3);
    objc_msgSend(v12, "setEditViewDelegate:", WeakRetained);
    objc_msgSend(WeakRetained, "viewControllerPresenting");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "presentViewController:animated:", v12, 1);

  }
  else
  {
    v14 = (void *)MEMORY[0x24BDF67F0];
    SXBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Can’t Access Calendar"), &stru_24D68E0F8, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SXBundle();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SXRequirePermissionToAccessCalendar"), &stru_24D68E0F8, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "alertControllerWithTitle:message:preferredStyle:", v16, v18, 1);
    WeakRetained = (id)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x24BDF67E8];
    SXBundle();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24D68E0F8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "addAction:", v22);

    objc_msgSend(*(id *)(a1 + 48), "viewControllerPresenting");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "presentViewController:animated:", WeakRetained, 1);
  }

}

- (void)eventEditViewController:(id)a3 didCompleteWithAction:(int64_t)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (SXViewControllerPresenting)viewControllerPresenting
{
  return self->_viewControllerPresenting;
}

- (SXEventStoreProvider)eventStoreProvider
{
  return self->_eventStoreProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreProvider, 0);
  objc_storeStrong((id *)&self->_viewControllerPresenting, 0);
}

@end
