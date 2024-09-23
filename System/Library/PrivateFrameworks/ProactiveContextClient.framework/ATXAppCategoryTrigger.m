@implementation ATXAppCategoryTrigger

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)type
{
  return 0;
}

- (ATXAppCategoryTrigger)initWithiTunesCategoryId:(unint64_t)a3
{
  ATXAppCategoryTrigger *v4;
  ATXAppCategoryTrigger *v5;
  ATXAppCategoryTrigger *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ATXAppCategoryTrigger;
  v4 = -[ATXAppCategoryTrigger init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_iTunesCategoryId = a3;
    v6 = v4;
  }

  return v5;
}

- (ATXAppCategoryTrigger)initWithCoder:(id)a3
{
  return -[ATXAppCategoryTrigger initWithiTunesCategoryId:](self, "initWithiTunesCategoryId:", objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("iTunesCategory")));
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeInteger:forKey:", self->_iTunesCategoryId, CFSTR("iTunesCategory"));
}

- (int64_t)iTunesCategoryId
{
  return self->_iTunesCategoryId;
}

@end
