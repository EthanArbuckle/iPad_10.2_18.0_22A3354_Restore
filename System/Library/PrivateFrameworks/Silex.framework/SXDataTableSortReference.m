@implementation SXDataTableSortReference

- (unint64_t)directionWithValue:(id)a3 withType:(int)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 3)
    return objc_msgSend(a3, "isEqualToString:", CFSTR("descending"), v4, v5);
  else
    return 0;
}

@end
