@implementation WFContextualActionCalendarEventDescriptor

- (WFContextualActionCalendarEventDescriptor)initWithEventIdentifier:(id)a3 uniqueIdentifier:(id)a4 title:(id)a5
{
  id v9;
  id v10;
  id v11;
  WFContextualActionCalendarEventDescriptor *v12;
  uint64_t v13;
  NSString *eventIdentifier;
  uint64_t v15;
  NSString *uniqueIdentifier;
  uint64_t v17;
  NSString *title;
  WFContextualActionCalendarEventDescriptor *v19;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionCalendarEventDescriptor.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("uniqueIdentifier"));

    if (v11)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionCalendarEventDescriptor.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eventIdentifier"));

  if (!v10)
    goto LABEL_8;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFContextualActionCalendarEventDescriptor.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("title"));

LABEL_4:
  v24.receiver = self;
  v24.super_class = (Class)WFContextualActionCalendarEventDescriptor;
  v12 = -[WFContextualActionCalendarEventDescriptor init](&v24, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v9, "copy");
    eventIdentifier = v12->_eventIdentifier;
    v12->_eventIdentifier = (NSString *)v13;

    v15 = objc_msgSend(v10, "copy");
    uniqueIdentifier = v12->_uniqueIdentifier;
    v12->_uniqueIdentifier = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    title = v12->_title;
    v12->_title = (NSString *)v17;

    v19 = v12;
  }

  return v12;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;

  v3 = (void *)objc_opt_new();
  -[WFContextualActionCalendarEventDescriptor eventIdentifier](self, "eventIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v4);

  -[WFContextualActionCalendarEventDescriptor uniqueIdentifier](self, "uniqueIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v6);

  -[WFContextualActionCalendarEventDescriptor title](self, "title");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "combineContentsOfPropertyListObject:", v8);

  v10 = objc_msgSend(v3, "finalize");
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  WFContextualActionCalendarEventDescriptor *v4;
  WFContextualActionCalendarEventDescriptor *v5;
  WFContextualActionCalendarEventDescriptor *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;

  v4 = (WFContextualActionCalendarEventDescriptor *)a3;
  v5 = v4;
  if (v4 != self)
  {
    v6 = v4;
    if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      LOBYTE(v12) = 0;
LABEL_27:

      goto LABEL_28;
    }
    -[WFContextualActionCalendarEventDescriptor eventIdentifier](v6, "eventIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionCalendarEventDescriptor eventIdentifier](self, "eventIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v7;
    v10 = v8;
    v11 = v10;
    if (v9 == v10)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v13 = v10;
      v14 = v9;
      if (!v9 || !v10)
        goto LABEL_25;
      v15 = objc_msgSend(v9, "isEqualToString:", v10);

      if (!v15)
      {
        LOBYTE(v12) = 0;
LABEL_26:

        goto LABEL_27;
      }
    }
    -[WFContextualActionCalendarEventDescriptor uniqueIdentifier](v6, "uniqueIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionCalendarEventDescriptor uniqueIdentifier](self, "uniqueIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v16;
    v18 = v17;
    v13 = v18;
    if (v14 == v18)
    {

    }
    else
    {
      LOBYTE(v12) = 0;
      v19 = v18;
      v20 = v14;
      if (!v14 || !v18)
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      v12 = objc_msgSend(v14, "isEqualToString:", v18);

      if (!v12)
        goto LABEL_25;
    }
    -[WFContextualActionCalendarEventDescriptor title](v6, "title");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFContextualActionCalendarEventDescriptor title](self, "title");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v21;
    v23 = v22;
    v19 = v23;
    if (v20 == v23)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      LOBYTE(v12) = 0;
      if (v20 && v23)
        LOBYTE(v12) = objc_msgSend(v20, "isEqualToString:", v23);
    }

    goto LABEL_24;
  }
  LOBYTE(v12) = 1;
LABEL_28:

  return v12;
}

- (WFContextualActionCalendarEventDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  WFContextualActionCalendarEventDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("eventIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8 || v7 == 0)
  {
    v10 = 0;
  }
  else
  {
    self = -[WFContextualActionCalendarEventDescriptor initWithEventIdentifier:uniqueIdentifier:title:](self, "initWithEventIdentifier:uniqueIdentifier:title:", v5, v6, v7);
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *eventIdentifier;
  id v5;

  eventIdentifier = self->_eventIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", eventIdentifier, CFSTR("eventIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_uniqueIdentifier, CFSTR("uniqueIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));

}

- (NSString)eventIdentifier
{
  return self->_eventIdentifier;
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_eventIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
