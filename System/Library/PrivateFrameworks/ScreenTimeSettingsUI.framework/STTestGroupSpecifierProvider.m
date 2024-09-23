@implementation STTestGroupSpecifierProvider

- (void)dealloc
{
  objc_super v3;

  -[NSTimer invalidate](self->_timer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STTestGroupSpecifierProvider;
  -[STGroupSpecifierProvider dealloc](&v3, sel_dealloc);
}

- (STTestGroupSpecifierProvider)init
{
  STTestGroupSpecifierProvider *v2;
  STTestGroupSpecifierProvider *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STTestGroupSpecifierProvider;
  v2 = -[STGroupSpecifierProvider init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STTestGroupSpecifierProvider setIsHidden:](v2, "setIsHidden:", 1);
  return v3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsHidden:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, void *);
  void *v12;
  id v13;
  id location;

  v3 = a3;
  -[STTestGroupSpecifierProvider timer](self, "timer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(v5, "invalidate");

    -[STTestGroupSpecifierProvider setTimer:](self, "setTimer:", 0);
  }
  else
  {

    if (!v6)
    {
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x24BDBCF40];
      v9 = MEMORY[0x24BDAC760];
      v10 = 3221225472;
      v11 = __44__STTestGroupSpecifierProvider_setIsHidden___block_invoke;
      v12 = &unk_24DB86750;
      objc_copyWeak(&v13, &location);
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v9, 2.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[STTestGroupSpecifierProvider setTimer:](self, "setTimer:", v8, v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  self->_isHidden = v3;
}

void __44__STTestGroupSpecifierProvider_setIsHidden___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "timerFired:", v3);

}

- (void)timerFired:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[STGroupSpecifierProvider mutableSpecifiers](self, "mutableSpecifiers", a3);
  v25 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v25, "count") & 1) != 0)
  {
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v25, "count");
    if (v5)
    {
      v6 = v5;
      v7 = v5 - 1;
      objc_msgSend(v4, "addIndex:", v5 - 1);
      if (v7)
        objc_msgSend(v4, "addIndex:", v6 - 2);
    }
    objc_msgSend(v25, "removeObjectsAtIndexes:", v4);
  }
  else if ((unint64_t)objc_msgSend(v25, "count") < 5)
  {
    v4 = (void *)objc_opt_new();
    v8 = (void *)MEMORY[0x24BE75590];
    v9 = (void *)MEMORY[0x24BDD17C8];
    v10 = (void *)MEMORY[0x24BDD16E0];
    -[STGroupSpecifierProvider specifiers](self, "specifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v13, 0, 0, 0, 0, -1, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v14);
    v15 = (void *)MEMORY[0x24BE75590];
    v16 = (void *)MEMORY[0x24BDD17C8];
    v17 = (void *)MEMORY[0x24BDD16E0];
    -[STGroupSpecifierProvider specifiers](self, "specifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v18, "count") + 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v20, 0, 0, 0, 0, -1, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "addObject:", v21);
    v22 = (void *)MEMORY[0x24BDD15E0];
    -[STGroupSpecifierProvider specifiers](self, "specifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "indexSetWithIndexesInRange:", objc_msgSend(v23, "count"), objc_msgSend(v4, "count"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "insertObjects:atIndexes:", v4, v24);

  }
  else
  {
    objc_msgSend(v25, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "removeObject:", v4);
  }

}

- (NSTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

@end
