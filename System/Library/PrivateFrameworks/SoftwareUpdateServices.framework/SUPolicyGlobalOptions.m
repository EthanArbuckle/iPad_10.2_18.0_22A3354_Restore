@implementation SUPolicyGlobalOptions

- (SUPolicyGlobalOptions)init
{
  SUPolicyGlobalOptions *v2;
  uint64_t v3;
  uint64_t v4;
  NSDictionary *updateMetricEventFields;
  objc_super v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v7.receiver = self;
  v7.super_class = (Class)SUPolicyGlobalOptions;
  v2 = -[SUPolicyGlobalOptions init](&v7, sel_init);
  if (v2)
  {
    v3 = *MEMORY[0x24BEAEB70];
    v8[0] = *MEMORY[0x24BEAEAC8];
    v8[1] = v3;
    v9[0] = CFSTR("SUS-2.0");
    v9[1] = CFSTR("SUS-2.0");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
    v4 = objc_claimAutoreleasedReturnValue();
    updateMetricEventFields = v2->_updateMetricEventFields;
    v2->_updateMetricEventFields = (NSDictionary *)v4;

  }
  return v2;
}

- (void)appendUpdateMetricEventFields:(id)a3
{
  NSDictionary *updateMetricEventFields;
  objc_class *v5;
  id v6;
  NSDictionary *v7;
  NSDictionary *v8;
  NSDictionary *v9;

  updateMetricEventFields = self->_updateMetricEventFields;
  v5 = (objc_class *)MEMORY[0x24BDBCED8];
  v6 = a3;
  if (updateMetricEventFields)
    v7 = (NSDictionary *)objc_msgSend([v5 alloc], "initWithDictionary:", self->_updateMetricEventFields);
  else
    v7 = (NSDictionary *)objc_alloc_init(v5);
  v8 = v7;
  -[NSDictionary addEntriesFromDictionary:](v7, "addEntriesFromDictionary:", v6);

  v9 = self->_updateMetricEventFields;
  self->_updateMetricEventFields = v8;

}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n            updateMetricEventFields: %@\n"), self->_updateMetricEventFields);
}

- (NSDictionary)updateMetricEventFields
{
  return self->_updateMetricEventFields;
}

- (void)setUpdateMetricEventFields:(id)a3
{
  objc_storeStrong((id *)&self->_updateMetricEventFields, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateMetricEventFields, 0);
}

@end
