@implementation CLMeCardEntry

- (CLMeCardEntry)init
{
  CLMeCardEntry *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLMeCardEntry;
  result = -[CLMeCardEntry init](&v3, "init");
  result->meCardString = 0;
  result->meCardMapItem = 0;
  return result;
}

- (NSString)meCardString
{
  return self->meCardString;
}

- (void)setMeCardString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CLLocation)meCardMapItem
{
  return self->meCardMapItem;
}

- (void)setMeCardMapItem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

@end
