@implementation SCROBrailleEvent

+ (id)eventWithType:(int)a3 data:(id)a4
{
  return (id)objc_msgSend(a1, "eventWithType:data:data2:data3:", *(_QWORD *)&a3, a4, 0, 0);
}

+ (id)eventWithType:(int)a3 data:(id)a4 data2:(id)a5 data3:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  void *v12;

  v8 = *(_QWORD *)&a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:data:data2:data3:", v8, v11, v10, v9);

  return v12;
}

- (SCROBrailleEvent)initWithType:(int)a3 data:(id)a4 data2:(id)a5 data3:(id)a6
{
  id v11;
  id v12;
  id v13;
  SCROBrailleEvent *v14;
  SCROBrailleEvent *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)SCROBrailleEvent;
  v14 = -[SCROBrailleEvent init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    objc_storeStrong(&v14->_data, a4);
    objc_storeStrong(&v15->_data2, a5);
    objc_storeStrong(&v15->_data3, a6);
    v15->_shouldDisplay = 1;
  }

  return v15;
}

- (int)type
{
  return self->_type;
}

- (id)data
{
  return self->_data;
}

- (id)data2
{
  return self->_data2;
}

- (id)data3
{
  return self->_data3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)SCROBrailleEvent;
  -[SCROBrailleEvent description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ : [%ld], %@, %@, %@"), v4, self->_type, self->_data, self->_data2, self->_data3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)shouldDisplay
{
  return self->_shouldDisplay;
}

- (void)setShouldDisplay:(BOOL)a3
{
  self->_shouldDisplay = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_data3, 0);
  objc_storeStrong(&self->_data2, 0);
  objc_storeStrong(&self->_data, 0);
}

@end
