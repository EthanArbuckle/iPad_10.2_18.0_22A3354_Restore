@implementation REBluetoothDeviceRelevanceProvider

+ (id)relevanceSimulatorID
{
  return CFSTR("bluetooth");
}

- (REBluetoothDeviceRelevanceProvider)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  REBluetoothDeviceRelevanceProvider *v7;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("car"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speaker"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[REBluetoothDeviceRelevanceProvider initWithConnectionToCar:connectionToSpeaker:](self, "initWithConnectionToCar:connectionToSpeaker:", objc_msgSend(v5, "BOOLValue"), objc_msgSend(v6, "BOOLValue"));
  return v7;
}

- (id)dictionaryEncoding
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_connectedToCar);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("car"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_connectedToSpeaker);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("speaker"));

  v6 = (void *)objc_msgSend(v3, "copy");
  return v6;
}

- (REBluetoothDeviceRelevanceProvider)initWithConnectionToCar:(BOOL)a3 connectionToSpeaker:(BOOL)a4
{
  REBluetoothDeviceRelevanceProvider *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REBluetoothDeviceRelevanceProvider;
  result = -[RERelevanceProvider init](&v7, sel_init);
  if (result)
  {
    result->_connectedToCar = a3;
    result->_connectedToSpeaker = a4;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithConnectionToCar:connectionToSpeaker:", self->_connectedToCar, self->_connectedToSpeaker);
}

- (BOOL)isEqual:(id)a3
{
  REBluetoothDeviceRelevanceProvider *v4;
  BOOL v5;
  objc_super v7;

  v4 = (REBluetoothDeviceRelevanceProvider *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)REBluetoothDeviceRelevanceProvider;
    v5 = -[RERelevanceProvider isEqual:](&v7, sel_isEqual_, v4)
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && self->_connectedToSpeaker == v4->_connectedToSpeaker
      && self->_connectedToCar == v4->_connectedToCar;
  }

  return v5;
}

- (unint64_t)_hash
{
  return self->_connectedToSpeaker | ((unint64_t)self->_connectedToCar << 8);
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REBluetoothDeviceRelevanceProvider;
  -[REBluetoothDeviceRelevanceProvider description](&v8, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_connectedToSpeaker);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_connectedToCar);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" speaker=%@, car=%@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)connectedToCar
{
  return self->_connectedToCar;
}

- (BOOL)connectedToSpeaker
{
  return self->_connectedToSpeaker;
}

@end
