@implementation SPCBPeripheralKeyResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPCBPeripheralKeyResponse)initWithPeripherals:(id)a3
{
  id v5;
  SPCBPeripheralKeyResponse *v6;
  SPCBPeripheralKeyResponse *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SPCBPeripheralKeyResponse;
  v6 = -[SPCBPeripheralKeyResponse init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_peripherals, a3);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SPCBPeripheralKeyResponse peripherals](self, "peripherals");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("peripherals"));

}

- (SPCBPeripheralKeyResponse)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  NSArray *peripherals;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("peripherals"));
  v8 = (NSArray *)objc_claimAutoreleasedReturnValue();

  peripherals = self->_peripherals;
  self->_peripherals = v8;

  return self;
}

- (NSArray)peripherals
{
  return self->_peripherals;
}

- (void)setPeripherals:(id)a3
{
  objc_storeStrong((id *)&self->_peripherals, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peripherals, 0);
}

@end
