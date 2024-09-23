@implementation KTSTHFailure

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("KTSTHFailure"));
}

- (BOOL)setUnsigned:(SEL)a3 value:(unint64_t)a4
{
  sub_1001A7B0C(self, a3, a4);
  return 1;
}

- (unint64_t)getUnsigned:(SEL)a3
{
  return sub_1001A7A14(self, a3);
}

@end
