@implementation NRBabelSimulator

- (NRBabelSimulator)init
{
  NRBabelSimulator *v2;
  NRBabelSimulator *v3;
  NSMutableArray *v4;
  NSMutableArray *fakeInstances;
  NSMutableArray *v6;
  NSMutableArray *fakeLinks;
  NRBabelLinkFake *v8;
  NRBabelLinkFake *v9;
  NRBabelInstanceFake *v10;
  NRBabelInstanceFake *v11;
  NRBabelInstanceFake *v12;
  id v14;
  int IsLevelEnabled;
  id v16;
  uint64_t v17;
  char *v18;
  int *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)NRBabelSimulator;
  v2 = -[NRBabelSimulator init](&v23, "init");
  if (!v2)
  {
    v14 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v14, 16);

    if (IsLevelEnabled)
    {
      v16 = sub_1000B093C();
      _NRLogWithArgs(v16, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelSimulator init]", 4010);

    }
    v17 = _os_log_pack_size(12);
    v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
    v19 = __error();
    v20 = _os_log_pack_fill(v18, v17, *v19, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v20 = 136446210;
    *(_QWORD *)(v20 + 4) = "-[NRBabelSimulator init]";
    v21 = sub_1000B093C();
    _NRLogAbortWithPack(v21, v18);
  }
  v3 = v2;
  v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fakeInstances = v3->_fakeInstances;
  v3->_fakeInstances = v4;

  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fakeLinks = v3->_fakeLinks;
  v3->_fakeLinks = v6;

  v8 = -[NRBabelLinkFake initWithName:]([NRBabelLinkFake alloc], "initWithName:", CFSTR("fake1"));
  v9 = -[NRBabelLinkFake initWithName:]([NRBabelLinkFake alloc], "initWithName:", CFSTR("fake2"));
  -[NSMutableArray addObject:](v3->_fakeLinks, "addObject:", v8);
  -[NSMutableArray addObject:](v3->_fakeLinks, "addObject:", v9);
  v10 = -[NRBabelInstanceFake initWithName:]([NRBabelInstanceFake alloc], "initWithName:", CFSTR("A"));
  v11 = -[NRBabelInstanceFake initWithName:]([NRBabelInstanceFake alloc], "initWithName:", CFSTR("B"));
  v12 = -[NRBabelInstanceFake initWithName:]([NRBabelInstanceFake alloc], "initWithName:", CFSTR("C"));
  -[NSMutableArray addObject:](v3->_fakeInstances, "addObject:", v10);
  -[NSMutableArray addObject:](v3->_fakeInstances, "addObject:", v11);
  -[NSMutableArray addObject:](v3->_fakeInstances, "addObject:", v12);

  return v3;
}

- (NSMutableArray)fakeInstances
{
  return self->_fakeInstances;
}

- (void)setFakeInstances:(id)a3
{
  objc_storeStrong((id *)&self->_fakeInstances, a3);
}

- (NSMutableArray)fakeLinks
{
  return self->_fakeLinks;
}

- (void)setFakeLinks:(id)a3
{
  objc_storeStrong((id *)&self->_fakeLinks, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fakeLinks, 0);
  objc_storeStrong((id *)&self->_fakeInstances, 0);
}

@end
