@implementation CLHarvestFloorTransitionRequestArchive

- (CLHarvestFloorTransitionRequestArchive)initWithArchive:(id)a3 index:(unsigned int)a4 score:(float)a5 apHarvestCount:(unsigned int)a6 macsNotInALSDatabase:(id)a7
{
  uint64_t v8;
  CLHarvestFloorTransitionRequestArchive *v10;
  double v11;
  CLHarvestFloorTransitionRequestArchive *v12;
  objc_super v14;

  v8 = *(_QWORD *)&a6;
  v14.receiver = self;
  v14.super_class = (Class)CLHarvestFloorTransitionRequestArchive;
  v10 = -[CLHarvestScoredRequestArchive initWithArchive:index:](&v14, "initWithArchive:index:", a3, *(_QWORD *)&a4);
  v12 = v10;
  if (v10)
  {
    *(float *)&v11 = a5;
    -[CLHarvestScoredRequestArchive setScore:](v10, "setScore:", v11);
    -[CLHarvestFloorTransitionRequestArchive setApHarvestCount:](v12, "setApHarvestCount:", v8);
    -[CLHarvestFloorTransitionRequestArchive setMacsNotInALSDatabase:](v12, "setMacsNotInALSDatabase:", a7);
  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLHarvestFloorTransitionRequestArchive;
  -[CLHarvestScoredRequestArchive dealloc](&v3, "dealloc");
}

- (id)description
{
  uint64_t v3;
  float v4;

  v3 = -[CLHarvestScoredRequestArchive index](self, "index");
  -[CLHarvestScoredRequestArchive score](self, "score");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("CLHarvestFloorTransitionRequestArchive: index %u, score %.1f, apHarvestCount %d"), v3, v4, self->_apHarvestCount);
}

- (id)debugDescription
{
  id v3;
  NSMutableSet *macsNotInALSDatabase;
  id v5;
  const __CFString *v6;
  uint64_t v7;
  void *i;
  std::string *p_p;
  CLHarvestFloorTransitionRequestArchive *v11;
  std::string __p;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v11 = self;
  macsNotInALSDatabase = self->_macsNotInALSDatabase;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](macsNotInALSDatabase, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = &stru_1021D8FB8;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(macsNotInALSDatabase);
        v13 = nullsub_34(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i), "unsignedLongLongValue"));
        sub_1000C2254(&v13, &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        objc_msgSend(v3, "appendFormat:", CFSTR("%@%@"), v6, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", p_p));
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        v6 = CFSTR(", ");
      }
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](macsNotInALSDatabase, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      v6 = CFSTR(", ");
    }
    while (v5);
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, APs not in ALS database: [%@]"), -[CLHarvestFloorTransitionRequestArchive description](v11, "description"), v3);
}

- (unsigned)apHarvestCount
{
  return self->_apHarvestCount;
}

- (void)setApHarvestCount:(unsigned int)a3
{
  self->_apHarvestCount = a3;
}

- (NSMutableSet)macsNotInALSDatabase
{
  return self->_macsNotInALSDatabase;
}

- (void)setMacsNotInALSDatabase:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
