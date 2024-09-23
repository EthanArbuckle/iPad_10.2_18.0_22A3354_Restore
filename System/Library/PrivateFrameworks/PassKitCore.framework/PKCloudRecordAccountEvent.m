@implementation PKCloudRecordAccountEvent

- (id)item
{
  return self->_event;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKCloudRecordAccountEvent)initWithCoder:(id)a3
{
  id v4;
  PKCloudRecordAccountEvent *v5;
  uint64_t v6;
  PKAccountEvent *event;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKCloudRecordAccountEvent;
  v5 = -[PKCloudRecordObject initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("event"));
    v6 = objc_claimAutoreleasedReturnValue();
    event = v5->_event;
    v5->_event = (PKAccountEvent *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKCloudRecordAccountEvent;
  v4 = a3;
  -[PKCloudRecordObject encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_event, CFSTR("event"), v5.receiver, v5.super_class);

}

- (int64_t)compare:(id)a3
{
  PKAccountEvent *event;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  event = self->_event;
  v4 = a3;
  -[PKAccountEvent identifier](event, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "event");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "compare:", v7);

  return v8;
}

- (id)descriptionWithItem:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = a3;
  -[PKCloudRecordAccountEvent _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PKCloudRecordAccountEvent;
  -[PKCloudRecordObject descriptionWithItem:](&v8, sel_descriptionWithItem_, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n%@"), v6);

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  -[PKCloudRecordAccountEvent _descriptionWithIncludeItem:](self, "_descriptionWithIncludeItem:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)PKCloudRecordAccountEvent;
  -[PKCloudRecordObject description](&v6, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("\n%@"), v4);

  return v3;
}

- (id)_descriptionWithIncludeItem:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  PKAccountEvent *event;
  void *v7;
  objc_class *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  event = self->_event;
  if (event)
  {
    if (v3)
    {
      -[PKAccountEvent identifier](event, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("event: id: %@, class: %@\n"), v7, v9);

    }
  }
  else
  {
    objc_msgSend(v5, "appendFormat:", CFSTR("No associated event in database\n"));
  }
  return v5;
}

- (void)applyCloudRecordObject:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  PKAccountEvent *v8;
  PKAccountEvent *event;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10.receiver = self;
    v10.super_class = (Class)PKCloudRecordAccountEvent;
    -[PKCloudRecordObject applyCloudRecordObject:](&v10, sel_applyCloudRecordObject_, v4);
    v5 = v4;
    v6 = v5;
    if (!self->_event)
    {
      objc_msgSend(v5, "event");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v6, "event");
        v8 = (PKAccountEvent *)objc_claimAutoreleasedReturnValue();
        event = self->_event;
        self->_event = v8;

      }
    }

  }
}

- (PKAccountEvent)event
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
