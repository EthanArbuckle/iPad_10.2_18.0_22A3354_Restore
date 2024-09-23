@implementation SXLayoutParametersManager

- (SXLayoutParametersManager)init
{
  SXLayoutParametersManager *v2;
  uint64_t v3;
  NSMutableDictionary *durations;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXLayoutParametersManager;
  v2 = -[SXLayoutParametersManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    durations = v2->_durations;
    v2->_durations = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)layoutFinishedForTask:(id)a3 result:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  objc_msgSend(v6, "duration");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v13, "elapsedDuration");
  objc_msgSend(v6, "blueprint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isComplete");

  if (v8)
  {
    -[SXLayoutParametersManager durations](self, "durations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v6, "duration");
    objc_msgSend(v10, "numberWithDouble:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v13, "type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, v12);

  }
}

- (id)layoutParametersForTask:(id)a3 previousLayoutOptions:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  SXLayoutParameters *v17;
  void *v18;
  SXLayoutParameters *v19;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "type") == 1)
  {
    v8 = 2;
  }
  else if (v7)
  {
    objc_msgSend(v6, "options");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "diffWithLayoutOptions:", v9);

    v11 = 2;
    if (((1 << v10) & 0x10110) == 0)
      v11 = 1;
    if (v10 <= 0x10)
      v8 = v11;
    else
      v8 = 1;
  }
  else
  {
    v8 = 1;
  }
  -[SXLayoutParametersManager durations](self, "durations");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "type"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "doubleValue");
    v16 = v15;
  }
  else
  {
    v16 = -1.0;
  }
  v17 = [SXLayoutParameters alloc];
  objc_msgSend(v6, "options");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[SXLayoutParameters initWithLayoutOptions:layoutType:expectedDuration:](v17, "initWithLayoutOptions:layoutType:expectedDuration:", v18, v8, v16);

  return v19;
}

- (NSMutableDictionary)durations
{
  return self->_durations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durations, 0);
}

@end
