@implementation SCMLPeopleDetection

- (SCMLPeopleDetection)init
{
  SCMLPeopleDetection *v2;
  SCMLPeopleDetection *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCMLPeopleDetection;
  v2 = -[SCMLPeopleDetection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    -[SCMLPeopleDetection setHasGenericPeople:](v2, "setHasGenericPeople:", 0);
    -[SCMLPeopleDetection setHasMultiplePeople:](v3, "setHasMultiplePeople:", 0);
    -[SCMLPeopleDetection setHasGender:](v3, "setHasGender:", 0);
    -[SCMLPeopleDetection setHasEthnicity:](v3, "setHasEthnicity:", 0);
    -[SCMLPeopleDetection setHasAge:](v3, "setHasAge:", 0);
    -[SCMLPeopleDetection setSpans:](v3, "setSpans:", MEMORY[0x24BDBD1A8]);
    v4 = objc_alloc_init(MEMORY[0x24BDD1458]);
    -[SCMLPeopleDetection setRewrittenText:](v3, "setRewrittenText:", v4);

  }
  return v3;
}

- (BOOL)hasGenericPeople
{
  return self->_hasGenericPeople;
}

- (void)setHasGenericPeople:(BOOL)a3
{
  self->_hasGenericPeople = a3;
}

- (BOOL)hasMultiplePeople
{
  return self->_hasMultiplePeople;
}

- (void)setHasMultiplePeople:(BOOL)a3
{
  self->_hasMultiplePeople = a3;
}

- (BOOL)hasGender
{
  return self->_hasGender;
}

- (void)setHasGender:(BOOL)a3
{
  self->_hasGender = a3;
}

- (BOOL)hasEthnicity
{
  return self->_hasEthnicity;
}

- (void)setHasEthnicity:(BOOL)a3
{
  self->_hasEthnicity = a3;
}

- (BOOL)hasAge
{
  return self->_hasAge;
}

- (void)setHasAge:(BOOL)a3
{
  self->_hasAge = a3;
}

- (NSArray)spans
{
  return self->_spans;
}

- (void)setSpans:(id)a3
{
  objc_storeStrong((id *)&self->_spans, a3);
}

- (NSAttributedString)rewrittenText
{
  return self->_rewrittenText;
}

- (void)setRewrittenText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rewrittenText, 0);
  objc_storeStrong((id *)&self->_spans, 0);
}

@end
