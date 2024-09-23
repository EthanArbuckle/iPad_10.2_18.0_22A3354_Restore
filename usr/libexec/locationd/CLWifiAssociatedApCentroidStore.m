@implementation CLWifiAssociatedApCentroidStore

- (BOOL)addRecord:(id)a3
{
  _QWORD v5[6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100CE7488;
  v5[3] = &unk_10212BB30;
  v5[4] = self;
  v5[5] = a3;
  -[NSManagedObjectContext performBlockAndWait:](-[CLStore managedObjectContext](self, "managedObjectContext"), "performBlockAndWait:", v5);
  return -[CLStore commitChangesToStore](self, "commitChangesToStore");
}

- (BOOL)deleteAllRecords
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(CLWifiAssociatedApCentroidMO, a2);
  return -[CLStore deleteRecordsWithEntityName:byAndPredicates:](self, "deleteRecordsWithEntityName:byAndPredicates:", NSStringFromClass(v3), &__NSArray0__struct);
}

- (BOOL)deleteRecordsByMac:(id)a3
{
  NSPredicate *v4;
  uint64_t v5;
  objc_class *v6;
  NSPredicate *v8;

  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("mac = %@"), a3);
  v6 = (objc_class *)objc_opt_class(CLWifiAssociatedApCentroidMO, v5);
  v8 = v4;
  return -[CLStore deleteRecordsWithEntityName:byAndPredicates:](self, "deleteRecordsWithEntityName:byAndPredicates:", NSStringFromClass(v6), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
}

- (BOOL)deleteRecordsLastUpdatedEarlierThan:(double)a3
{
  NSPredicate *v4;
  uint64_t v5;
  objc_class *v6;
  NSPredicate *v8;

  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("lastUpdated < %f"), *(_QWORD *)&a3);
  v6 = (objc_class *)objc_opt_class(CLWifiAssociatedApCentroidMO, v5);
  v8 = v4;
  return -[CLStore deleteRecordsWithEntityName:byAndPredicates:](self, "deleteRecordsWithEntityName:byAndPredicates:", NSStringFromClass(v6), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
}

- (id)fetchAllRecords
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(CLWifiAssociatedApCentroidMO, a2);
  return -[CLStore fetchRecordsWithEntityName:byAndPredicates:](self, "fetchRecordsWithEntityName:byAndPredicates:", NSStringFromClass(v3), &__NSArray0__struct);
}

- (id)fetchAllRecordsForMac:(id)a3
{
  NSPredicate *v4;
  uint64_t v5;
  objc_class *v6;
  NSPredicate *v8;

  v4 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("mac = %@"), a3);
  v6 = (objc_class *)objc_opt_class(CLWifiAssociatedApCentroidMO, v5);
  v8 = v4;
  return -[CLStore fetchRecordsWithEntityName:byAndPredicates:](self, "fetchRecordsWithEntityName:byAndPredicates:", NSStringFromClass(v6), +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
}

- (id)fetchRecord:(id)a3
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v3 = -[CLWifiAssociatedApCentroidStore fetchAllRecordsForMac:](self, "fetchAllRecordsForMac:", a3);
  if (!v3)
    return 0;
  v4 = v3;
  if (!objc_msgSend(v3, "count"))
    return 0;
  v5 = objc_msgSend(v4, "count");
  v6 = (v5 - 1);
  if (v5 >= 2)
  {
    v7 = 0;
    do

    while (v6 != v7);
  }
  return objc_msgSend(v4, "objectAtIndex:", (int)v6);
}

- (int)count
{
  objc_class *v3;
  NSString *v4;

  v3 = (objc_class *)objc_opt_class(CLWifiAssociatedApCentroidMO, a2);
  v4 = NSStringFromClass(v3);
  return -[CLStore countRecordsWithEntityName:predicates:](self, "countRecordsWithEntityName:predicates:", v4, &__NSArray0__struct);
}

- (BOOL)isEmpty
{
  return -[CLWifiAssociatedApCentroidStore count](self, "count") == 0;
}

- (id)getSampleMacs:(int)a3
{
  id v4;
  void *v5;
  int v6;
  uint64_t v7;
  id v9;
  uint64_t i;

  if (a3 < 1)
    return &stru_1021D8FB8;
  v4 = -[CLWifiAssociatedApCentroidStore fetchAllRecords](self, "fetchAllRecords");
  if (!v4)
    return &stru_1021D8FB8;
  v5 = v4;
  if (!objc_msgSend(v4, "count"))
    return &stru_1021D8FB8;
  v6 = objc_msgSend(v5, "count");
  if (v6 <= a3)
    LODWORD(v7) = 0;
  else
    LODWORD(v7) = arc4random_uniform(v6 - a3);
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  if ((int)v7 < v6)
  {
    v7 = (int)v7;
    do
    {
      if ((unint64_t)objc_msgSend(v9, "count") >= a3)
        break;
      objc_msgSend(v9, "addObject:", objc_msgSend(objc_msgSend(v5, "objectAtIndex:", v7++), "mac"));
    }
    while (v6 != v7);
  }
  if (v6 >= 1)
  {
    for (i = 0; i != v6; objc_msgSend(v5, "objectAtIndex:", i++))
      ;
  }
  return objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
}

@end
