@implementation TBQualityScore

+ (id)qualityScoreWithValue:(unint64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithValue:", a3);
}

- (TBQualityScore)initWithValue:(unint64_t)a3
{
  TBQualityScore *v4;
  NSString *typeDescription;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TBQualityScore;
  v4 = -[TBQualityScore init](&v7, sel_init);
  typeDescription = v4->_typeDescription;
  v4->_score = a3;
  v4->_typeDescription = (NSString *)CFSTR("quality");

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *typeDescription;
  id v5;

  typeDescription = self->_typeDescription;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", typeDescription, CFSTR("_typeDescription"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_score, CFSTR("_score"));

}

- (TBQualityScore)initWithCoder:(id)a3
{
  id v3;
  TBQualityScore *v4;
  uint64_t v5;
  NSString *typeDescription;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TBQualityScore;
  v3 = a3;
  v4 = -[TBQualityScore init](&v9, sel_init);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_typeDescription"), v9.receiver, v9.super_class);
  v5 = objc_claimAutoreleasedReturnValue();
  typeDescription = v4->_typeDescription;
  v4->_typeDescription = (NSString *)v5;

  v7 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("_score"));
  v4->_score = v7;
  return v4;
}

- (unint64_t)score
{
  return self->_score;
}

- (void)setScore:(unint64_t)a3
{
  self->_score = a3;
}

- (NSString)typeDescription
{
  return self->_typeDescription;
}

- (void)setTypeDescription:(id)a3
{
  objc_storeStrong((id *)&self->_typeDescription, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeDescription, 0);
}

@end
