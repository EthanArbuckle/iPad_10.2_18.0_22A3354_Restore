@implementation BKTextIndexQueryResult

- (BKTextIndexQueryResult)initWithOrdinals:(id)a3 allOrdinals:(id)a4
{
  id v7;
  id v8;
  BKTextIndexQueryResult *v9;
  BKTextIndexQueryResult *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)BKTextIndexQueryResult;
  v9 = -[BKTextIndexQueryResult init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ordinals, a3);
    objc_storeStrong((id *)&v10->_allOrdinals, a4);
  }

  return v10;
}

- (BOOL)isCandidateOrdinal:(unint64_t)a3 isMissing:(BOOL *)a4
{
  void *v6;
  unsigned __int8 v7;
  NSSet *allOrdinals;
  unsigned int v9;
  char v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a3));
  v7 = -[NSSet containsObject:](self->_ordinals, "containsObject:", v6);
  allOrdinals = self->_allOrdinals;
  if (allOrdinals)
    v9 = !-[NSSet containsObject:](allOrdinals, "containsObject:", v6);
  else
    LOBYTE(v9) = 0;
  *a4 = v9;
  v10 = v7 | v9;

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOrdinals, 0);
  objc_storeStrong((id *)&self->_ordinals, 0);
}

@end
