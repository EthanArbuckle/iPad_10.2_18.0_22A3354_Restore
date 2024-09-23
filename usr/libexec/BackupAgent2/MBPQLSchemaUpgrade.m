@implementation MBPQLSchemaUpgrade

+ (id)upgradeWithVersion:(unsigned int)a3 shouldVacuum:(BOOL)a4 statements:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006A80C;
  v10[3] = &unk_1000D9C68;
  v11 = a5;
  v7 = v11;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MBPQLSchemaUpgrade upgradeWithVersion:shouldVacuum:upgradeBlock:](MBPQLSchemaUpgrade, "upgradeWithVersion:shouldVacuum:upgradeBlock:", v6, v5, v10));

  return v8;
}

+ (id)upgradeWithVersion:(unsigned int)a3 shouldVacuum:(BOOL)a4 upgradeBlock:(id)a5
{
  _BOOL8 v5;
  uint64_t v6;
  id v7;
  MBPQLSchemaUpgrade *v8;
  id v9;

  v5 = a4;
  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = objc_opt_new(MBPQLSchemaUpgrade);
  -[MBPQLSchemaUpgrade setVersion:](v8, "setVersion:", v6);
  -[MBPQLSchemaUpgrade setShouldVacuum:](v8, "setShouldVacuum:", v5);
  v9 = objc_msgSend(v7, "copy");

  -[MBPQLSchemaUpgrade setUpgradeBlock:](v8, "setUpgradeBlock:", v9);
  return v8;
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
}

- (BOOL)shouldVacuum
{
  return self->_shouldVacuum;
}

- (void)setShouldVacuum:(BOOL)a3
{
  self->_shouldVacuum = a3;
}

- (id)upgradeBlock
{
  return self->_upgradeBlock;
}

- (void)setUpgradeBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_upgradeBlock, 0);
}

@end
