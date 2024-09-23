@implementation VUIDebugMetricsEventViewController

- (VUIDebugMetricsEventViewController)initWithEvent:(id)a3
{
  id v5;
  VUIDebugMetricsEventViewController *v6;
  VUIDebugMetricsEventViewController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIDebugMetricsEventViewController;
  v6 = -[VUIDebugMetricsEventViewController initWithStyle:](&v9, sel_initWithStyle_, 1);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_event, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VUIDebugMetricsEventViewController;
  -[VUIDebugMetricsEventViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[VUIDebugMetricsEventViewController event](self, "event");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "eventType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("eventType: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIDebugMetricsEventViewController setTitle:](self, "setTitle:", v5);

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithTitle:style:target:action:", CFSTR("Validate"), 0, self, sel_performValidation);
  -[VUIDebugMetricsEventViewController navigationItem](self, "navigationItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLargeTitleDisplayMode:", 2);

  -[VUIDebugMetricsEventViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v6);

  -[VUIDebugMetricsEventViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("VUIDebugMetricsEventCellReuseIdentifier"));

}

- (void)performValidation
{
  VUIDebugMetricsEventValidatorTableViewController *v3;
  void *v4;
  void *v5;
  VUIDebugMetricsEventValidatorTableViewController *v6;

  v3 = [VUIDebugMetricsEventValidatorTableViewController alloc];
  -[VUIDebugMetricsEvent rawEvent](self->_event, "rawEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[VUIDebugMetricsEventValidatorTableViewController initWithEvent:](v3, "initWithEvent:", v4);

  -[VUIDebugMetricsEventViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pushViewController:animated:", v6, 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[VUIDebugMetricsEvent eventData](self->_event, "eventData", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  -[VUIDebugMetricsEvent eventData](self->_event, "eventData", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("keys"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  VUIDebugMetricsEvent *event;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v25;

  event = self->_event;
  v7 = a4;
  v8 = a3;
  -[VUIDebugMetricsEvent eventData](event, "eventData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "valueForKey:", CFSTR("keys"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v7, "row"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[VUIDebugMetricsEvent objectForKeyedSubscript:](self->_event, "objectForKeyedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("VUIDebugMetricsEventCellReuseIdentifier"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = (void *)objc_msgSend(v14, "initWithStyle:reuseIdentifier:", 1, CFSTR("VUIDebugMetricsEventCellReuseIdentifier"));
  objc_opt_class();
  LOBYTE(v8) = objc_opt_isKindOfClass();
  objc_msgSend(v15, "textLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setText:", v12);

  if ((v8 & 1) != 0)
  {
    objc_msgSend(v15, "detailTextLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v13);

    objc_msgSend(v15, "setAccessoryType:", 0);
    objc_msgSend(v15, "setSelectionStyle:", 0);
    goto LABEL_18;
  }
  v18 = (objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v13, "count") == 0;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(v13, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsSeparatedByCharactersInSet:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "componentsJoinedByString:", &stru_1E9FF3598);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("impressions")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu impressions"), objc_msgSend(v13, "count"));
LABEL_12:
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("location")))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu locations"), objc_msgSend(v13, "count"));
    goto LABEL_12;
  }
  objc_msgSend(v13, "valueForKey:", CFSTR("description"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "componentsJoinedByString:", CFSTR(", "));
  v22 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString length](v22, "length"))
  {
LABEL_13:
    if (!v22)
      goto LABEL_18;
    goto LABEL_14;
  }

  v22 = CFSTR("[]");
LABEL_14:
  objc_msgSend(v15, "detailTextLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setText:", v22);

  if (v18)
    objc_msgSend(v15, "setSelectionStyle:", 0);
  else
    objc_msgSend(v15, "setAccessoryType:", 1);

LABEL_18:
  return v15;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[VUIDebugMetricsEvent eventData](self->_event, "eventData", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", CFSTR("header"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  VUIDebugMetricsEvent *event;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  VUIDebugMetricsImpressionViewController *v12;
  VUIDebugMetricsDictionaryViewController *v13;
  id v14;

  event = self->_event;
  v6 = a4;
  -[VUIDebugMetricsEvent eventData](event, "eventData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("keys"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "row");

  objc_msgSend(v9, "objectAtIndex:", v10);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIDebugMetricsEvent objectForKeyedSubscript:](self->_event, "objectForKeyedSubscript:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isEqual:", CFSTR("impressions")))
  {
    v12 = objc_alloc_init(VUIDebugMetricsImpressionViewController);
    -[VUIDebugMetricsImpressionViewController setArray:](v12, "setArray:", v11);
    v13 = (VUIDebugMetricsDictionaryViewController *)v12;
LABEL_3:
    -[VUIDebugMetricsDictionaryViewController setTitle:](v13, "setTitle:", v14);
LABEL_4:
    -[VUIDebugMetricsEventViewController showViewController:sender:](self, "showViewController:sender:", v12, 0);

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
  {
    v12 = objc_alloc_init(VUIDebugMetricsArrayViewController);
    -[VUIDebugMetricsImpressionViewController setTitle:](v12, "setTitle:", v14);
    -[VUIDebugMetricsImpressionViewController setArray:](v12, "setArray:", v11);
    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "count"))
  {
    v13 = -[VUIDebugMetricsDictionaryViewController initWithDictionary:]([VUIDebugMetricsDictionaryViewController alloc], "initWithDictionary:", v11);
    v12 = (VUIDebugMetricsImpressionViewController *)v13;
    goto LABEL_3;
  }
LABEL_5:

}

- (VUIDebugMetricsEvent)event
{
  return self->_event;
}

- (void)setEvent:(id)a3
{
  objc_storeStrong((id *)&self->_event, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_event, 0);
}

@end
