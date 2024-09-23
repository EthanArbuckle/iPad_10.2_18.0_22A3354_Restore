@implementation UIAccessibilityBridgeAXActionMessage

- (UIAccessibilityBridgeAXActionMessage)initWithAxAction:(int)a3 withValue:(id)a4 forElementRefData:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  UIAccessibilityBridgeAXActionMessage *v10;
  UIAccessibilityBridgeAXActionMessage *v11;
  objc_super v13;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)UIAccessibilityBridgeAXActionMessage;
  v10 = -[UIAccessibilityBridgeAXActionMessage init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    -[UIAccessibilityBridgeAXActionMessage setAxAction:](v10, "setAxAction:", v6);
    -[UIAccessibilityBridgeAXActionMessage setValue:](v11, "setValue:", v8);
    -[UIAccessibilityBridgeAXActionMessage setElementRefData:](v11, "setElementRefData:", v9);
  }

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIAccessibilityBridgeAXActionMessage)initWithCoder:(id)a3
{
  id v4;
  UIAccessibilityBridgeAXActionMessage *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIAccessibilityBridgeAXActionMessage;
  v5 = -[UIAccessibilityBridgeAXActionMessage init](&v10, sel_init);
  if (v5)
  {
    -[UIAccessibilityBridgeAXActionMessage setAxAction:](v5, "setAxAction:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("axAction")));
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", objc_opt_class(), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v6, CFSTR("value"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeAXActionMessage setValue:](v5, "setValue:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("elementRefData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityBridgeAXActionMessage setElementRefData:](v5, "setElementRefData:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", -[UIAccessibilityBridgeAXActionMessage axAction](self, "axAction"), CFSTR("axAction"));
  -[UIAccessibilityBridgeAXActionMessage value](self, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("value"));

  -[UIAccessibilityBridgeAXActionMessage elementRefData](self, "elementRefData");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("elementRefData"));

}

- (int)axAction
{
  return self->_axAction;
}

- (void)setAxAction:(int)a3
{
  self->_axAction = a3;
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
}

- (NSData)elementRefData
{
  return self->_elementRefData;
}

- (void)setElementRefData:(id)a3
{
  objc_storeStrong((id *)&self->_elementRefData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementRefData, 0);
  objc_storeStrong(&self->_value, 0);
}

@end
