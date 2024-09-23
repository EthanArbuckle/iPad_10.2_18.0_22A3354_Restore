@implementation SXCalendarEventActionSerializer

- (id)URLForAction:(id)a3 type:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v6, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
    if (a4 != 1 && v7)
    {
      v9 = objc_alloc_init(MEMORY[0x24BDD1808]);
      objc_msgSend(v9, "setScheme:", CFSTR("action"));
      objc_msgSend(v9, "setHost:", CFSTR("calendar-event"));
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_alloc_init(MEMORY[0x24BDD15D0]);
      objc_msgSend(v6, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringFromDate:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SXCalendarEventActionSerializer queryItemForName:value:](self, "queryItemForName:value:", CFSTR("startDate"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v14);

      objc_msgSend(v6, "endDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        objc_msgSend(v6, "endDate");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringFromDate:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXCalendarEventActionSerializer queryItemForName:value:](self, "queryItemForName:value:", CFSTR("endDate"), v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v18);

      }
      objc_msgSend(v6, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v6, "title");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXCalendarEventActionSerializer queryItemForName:value:](self, "queryItemForName:value:", CFSTR("title"), v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v21);

      }
      objc_msgSend(v6, "location");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v6, "location");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXCalendarEventActionSerializer queryItemForName:value:](self, "queryItemForName:value:", CFSTR("location"), v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v24);

      }
      objc_msgSend(v6, "notes");
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend(v6, "notes");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "text");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXCalendarEventActionSerializer queryItemForName:value:](self, "queryItemForName:value:", CFSTR("notes"), v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v28);

      }
      objc_msgSend(v6, "URL");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (v29)
      {
        objc_msgSend(v6, "URL");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "absoluteString");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[SXCalendarEventActionSerializer queryItemForName:value:](self, "queryItemForName:value:", CFSTR("URL"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v32);

      }
      objc_msgSend(v9, "setQueryItems:", v10);
      objc_msgSend(v9, "URL");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)queryItemForName:(id)a3 value:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x24BDD1838];
  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "URLQueryAllowedCharacterSet");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAddingPercentEncodingWithAllowedCharacters:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "queryItemWithName:value:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
