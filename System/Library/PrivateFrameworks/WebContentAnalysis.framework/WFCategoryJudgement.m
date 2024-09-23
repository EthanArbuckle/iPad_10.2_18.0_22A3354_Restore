@implementation WFCategoryJudgement

+ (id)categoryJudgementWithCategory:(int64_t)a3 score:(float)a4
{
  id v6;
  double v7;

  v6 = objc_alloc_init((Class)objc_opt_class());
  *(float *)&v7 = a4;
  objc_msgSend(v6, "setScore:", v7);
  objc_msgSend(v6, "setCategory:", a3);
  return v6;
}

- (float)score
{
  return self->score;
}

- (void)setScore:(float)a3
{
  self->score = a3;
}

- (int64_t)category
{
  return self->category;
}

- (void)setCategory:(int64_t)a3
{
  self->category = a3;
}

- (int64_t)compareByCategory:(id)a3
{
  int64_t v4;
  uint64_t v5;

  v4 = -[WFCategoryJudgement category](self, "category");
  v5 = objc_msgSend(a3, "category");
  if (v4 < v5)
    return -1;
  else
    return v4 > v5;
}

- (int64_t)compareByScore:(id)a3
{
  float v4;
  float v5;
  float v6;

  -[WFCategoryJudgement score](self, "score");
  v5 = v4;
  objc_msgSend(a3, "score");
  if (v5 > v6)
    return -1;
  else
    return v5 < v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld:%f"), self->category, self->score);
}

@end
