@implementation SVXLEDStatusFactory

- (SVXLEDStatusFactory)init
{
  SVXLEDStatusFactory *v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary *statusLEDCommands;
  SVXTargetLEDSupplier *v6;
  SVXTargetLEDSupplier *targetLEDSupplier;
  objc_super v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v9.receiver = self;
  v9.super_class = (Class)SVXLEDStatusFactory;
  v2 = -[SVXLEDStatusFactory init](&v9, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x24BE82820];
    v10[0] = *MEMORY[0x24BE82818];
    v10[1] = v3;
    v11[0] = CFSTR("0 190 0");
    v11[1] = CFSTR("190 0 0");
    v10[2] = *MEMORY[0x24BE82828];
    v11[2] = CFSTR("190 190 0");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
    v4 = objc_claimAutoreleasedReturnValue();
    statusLEDCommands = v2->_statusLEDCommands;
    v2->_statusLEDCommands = (NSDictionary *)v4;

    v6 = objc_alloc_init(SVXTargetLEDSupplier);
    targetLEDSupplier = v2->_targetLEDSupplier;
    v2->_targetLEDSupplier = v6;

  }
  return v2;
}

- (id)createCommandForStatus:(id)a3
{
  void *v4;
  void *v5;

  if (a3)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_statusLEDCommands, "objectForKeyedSubscript:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      -[SVXLEDStatusFactory createStatusForColor:](self, "createStatusForColor:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)createClearLEDStatus
{
  return -[SVXLEDStatusFactory createStatusForColor:](self, "createStatusForColor:", CFSTR("0 0 0"));
}

- (id)createStatusForColor:(id)a3
{
  SVXTargetLEDSupplier *targetLEDSupplier;
  id v4;
  unsigned int v5;
  void *v6;

  targetLEDSupplier = self->_targetLEDSupplier;
  v4 = a3;
  v5 = -[SVXTargetLEDSupplier get](targetLEDSupplier, "get");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("individual %d %@"), v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLEDSupplier, 0);
  objc_storeStrong((id *)&self->_statusLEDCommands, 0);
}

@end
