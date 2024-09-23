@implementation WBProfileDifference

- (WBProfileDifference)init
{
  void *v3;
  WBProfileDifference *v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[WBProfileDifference initWithResult:settingsKeys:](self, "initWithResult:settingsKeys:", 0, v3);

  return v4;
}

- (WBProfileDifference)initWithResult:(unint64_t)a3 settingsKeys:(id)a4
{
  id v6;
  WBProfileDifference *v7;
  WBProfileDifference *v8;
  uint64_t v9;
  NSSet *settingsKeys;
  WBProfileDifference *v11;
  objc_super v13;

  v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WBProfileDifference;
  v7 = -[WBProfileDifference init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_result = a3;
    v9 = objc_msgSend(v6, "copy");
    settingsKeys = v8->_settingsKeys;
    v8->_settingsKeys = (NSSet *)v9;

    v11 = v8;
  }

  return v8;
}

- (unint64_t)result
{
  return self->_result;
}

- (NSSet)settingsKeys
{
  return self->_settingsKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsKeys, 0);
}

@end
