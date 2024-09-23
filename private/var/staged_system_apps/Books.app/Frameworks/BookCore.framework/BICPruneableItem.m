@implementation BICPruneableItem

+ (void)_setTimeBuckets:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v4, "doubleValue");
  qword_309CD0 = v5;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 1));
  objc_msgSend(v6, "doubleValue");
  qword_309CD8 = v7;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 2));
  objc_msgSend(v8, "doubleValue");
  qword_309CE0 = v9;

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 3));
  objc_msgSend(v11, "doubleValue");
  qword_309CE8 = v10;

}

+ (unint64_t)pruneScoreFrom:(CGSize)a3 lastUsedDate:(id)a4 oldVersion:(BOOL)a5 expired:(BOOL)a6 processed:(BOOL)a7
{
  _BOOL4 v7;
  double height;
  double width;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t result;

  v7 = a7;
  height = a3.height;
  width = a3.width;
  objc_msgSend(a4, "timeIntervalSinceNow");
  v13 = -v12;
  v14 = 16000000;
  if (v7)
    v14 = 0;
  if (*(double *)&qword_309CD0 >= v13)
    v15 = 0;
  else
    v15 = 32000000;
  if (*(double *)&qword_309CD8 < v13)
    v15 += 32000000;
  if (*(double *)&qword_309CE0 < v13)
    v15 += 32000000;
  v16 = v15 + 32000000;
  if (*(double *)&qword_309CE8 >= v13)
    v16 = v15;
  result = 0xFFFFFFFFLL;
  if (!a5 && !a6)
  {
    if (v12 <= 0.0)
      return v14 + (unint64_t)(width * height) + v16;
    else
      return -1;
  }
  return result;
}

+ (id)pruneableItemFromEntryLocation:(id)a3 cost:(unint64_t)a4 pruneScore:(unint64_t)a5
{
  id v7;
  BICPruneableItem *v8;

  v7 = a3;
  v8 = objc_alloc_init(BICPruneableItem);
  -[BICPruneableItem setEntryLocation:](v8, "setEntryLocation:", v7);

  -[BICPruneableItem setCost:](v8, "setCost:", a4);
  -[BICPruneableItem setPruneScore:](v8, "setPruneScore:", a5);
  return v8;
}

- (id)description
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  void *v6;

  v3 = -[BICPruneableItem cost](self, "cost");
  v4 = -[BICPruneableItem pruneScore](self, "pruneScore");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICPruneableItem entryLocation](self, "entryLocation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cost: %-10ld pruneScore: %-10ld Loc: %@"), v3, v4, v5));

  return v6;
}

- (int64_t)compare:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "pruneScore")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BICPruneableItem pruneScore](self, "pruneScore")));
  v6 = objc_msgSend(v4, "compare:", v5);

  return (int64_t)v6;
}

- (NSString)entryLocation
{
  return self->_entryLocation;
}

- (void)setEntryLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (unint64_t)cost
{
  return self->_cost;
}

- (void)setCost:(unint64_t)a3
{
  self->_cost = a3;
}

- (unint64_t)pruneScore
{
  return self->_pruneScore;
}

- (void)setPruneScore:(unint64_t)a3
{
  self->_pruneScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entryLocation, 0);
}

@end
