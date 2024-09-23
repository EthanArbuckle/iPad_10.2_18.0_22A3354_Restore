@implementation REElementComplicationAction

- (REElementComplicationAction)initWithSlotIdentifier:(id)a3
{
  id v5;
  REElementComplicationAction *v6;
  REElementComplicationAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REElementComplicationAction;
  v6 = -[REElementComplicationAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_slotIdentifier, a3);

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REElementComplicationAction;
  v4 = (id *)-[REElementComplicationAction copy](&v6, sel_copy, a3);
  objc_storeStrong(v4 + 3, self->_slotIdentifier);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REElementComplicationAction;
  -[REElementComplicationAction description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" slot=%@"), self->_slotIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_performWithContext:(id)a3
{
  void *v4;
  char v5;
  id v6;

  -[REElementAction delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[REElementAction delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "elementAction:wantsToPerformTapActionForComplicationSlot:", self, self->_slotIdentifier);

  }
}

- (unint64_t)hash
{
  return -[NSString hash](self->_slotIdentifier, "hash");
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSString isEqual:](self->_slotIdentifier, "isEqual:", v4[3]);
  else
    v5 = 0;

  return v5;
}

- (NSString)slotIdentifier
{
  return self->_slotIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slotIdentifier, 0);
}

@end
