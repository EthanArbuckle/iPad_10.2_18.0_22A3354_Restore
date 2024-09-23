@implementation NRBabelLinkFake

- (NRBabelLinkFake)initWithName:(id)a3
{
  NSString *v4;
  NRBabelLinkFake *v5;
  NRBabelLinkFake *v6;
  NSString *name;
  NSString *v8;
  NSMutableArray *v9;
  NSMutableArray *fakeInterfaces;
  unsigned __int16 v11;
  id v13;
  int IsLevelEnabled;
  id v15;
  uint64_t v16;
  char *v17;
  int *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  objc_super v22;

  v4 = (NSString *)a3;
  v22.receiver = self;
  v22.super_class = (Class)NRBabelLinkFake;
  v5 = -[NRBabelLinkFake init](&v22, "init");
  if (!v5)
  {
    v13 = sub_1000B093C();
    IsLevelEnabled = _NRLogIsLevelEnabled(v13, 16);

    if (IsLevelEnabled)
    {
      v15 = sub_1000B093C();
      _NRLogWithArgs(v15, 16, "%s%.30s:%-4d ABORTING: [super init] failed", ", "-[NRBabelLinkFake initWithName:]", 3879);

    }
    v16 = _os_log_pack_size(12);
    v17 = (char *)&v21 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
    v18 = __error();
    v19 = _os_log_pack_fill(v17, v16, *v18, &_mh_execute_header, "%{public}s [super init] failed");
    *(_DWORD *)v19 = 136446210;
    *(_QWORD *)(v19 + 4) = "-[NRBabelLinkFake initWithName:]";
    v20 = sub_1000B093C();
    _NRLogAbortWithPack(v20, v17);
  }
  v6 = v5;
  name = v5->_name;
  v5->_name = v4;
  v8 = v4;

  v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  fakeInterfaces = v6->_fakeInterfaces;
  v6->_fakeInterfaces = v9;

  do
    v11 = __ldxr(word_1001E3BC8);
  while (__stxr(v11 + 1, word_1001E3BC8));
  v6->_fakeLinkIndex = v11;
  return v6;
}

- (NSMutableArray)fakeInterfaces
{
  return self->_fakeInterfaces;
}

- (void)setFakeInterfaces:(id)a3
{
  objc_storeStrong((id *)&self->_fakeInterfaces, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (unsigned)fakeLinkIndex
{
  return self->_fakeLinkIndex;
}

- (void)setFakeLinkIndex:(unsigned __int16)a3
{
  self->_fakeLinkIndex = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fakeInterfaces, 0);
}

@end
