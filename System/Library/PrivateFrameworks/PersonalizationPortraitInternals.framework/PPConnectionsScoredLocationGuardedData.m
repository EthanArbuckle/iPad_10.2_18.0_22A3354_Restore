@implementation PPConnectionsScoredLocationGuardedData

- (PPConnectionsScoredLocationGuardedData)init
{
  PPConnectionsScoredLocationGuardedData *v2;
  uint64_t v3;
  NSMutableArray *locations;
  uint64_t v5;
  NSMutableSet *seenValues;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PPConnectionsScoredLocationGuardedData;
  v2 = -[PPConnectionsScoredLocationGuardedData init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    locations = v2->_locations;
    v2->_locations = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    seenValues = v2->_seenValues;
    v2->_seenValues = (NSMutableSet *)v5;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seenValues, 0);
  objc_storeStrong((id *)&self->_locations, 0);
}

@end
