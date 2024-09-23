@implementation HKHealthStore

- (void)ch_calculateBMRForDate:(id)a3 useEndOfDay:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  if (v6)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "dateByAddingUnit:value:toDate:options:", 16, 1, v8, 0));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "startOfDayForDate:", v11));

    v8 = (id)v13;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005CE38;
  v15[3] = &unk_100777F90;
  v16 = v9;
  v14 = v9;
  -[HKHealthStore ch_fetchBodyMassBeforeDate:completion:](self, "ch_fetchBodyMassBeforeDate:completion:", v8, v15);

}

- (void)ch_fetchBodyMassBeforeDate:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[HKQuantityType quantityTypeForIdentifier:](HKQuantityType, "quantityTypeForIdentifier:", HKQuantityTypeIdentifierBodyMass));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005D064;
  v10[3] = &unk_100777FB8;
  v10[4] = self;
  v11 = v6;
  v9 = v6;
  -[HKHealthStore ch_mostRecentQuantityOfType:beforeDate:completion:](self, "ch_mostRecentQuantityOfType:beforeDate:completion:", v8, v7, v10);

}

- (void)ch_mostRecentQuantityOfType:(id)a3 beforeDate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  void *v18;

  v8 = a5;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K <= %@"), HKPredicateKeyPathStartDate, a4));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", HKSampleSortIdentifierEndDate, 0));
  v12 = objc_alloc((Class)HKSampleQuery);
  v18 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v18, 1));
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10005D270;
  v16[3] = &unk_100777FE0;
  v17 = v8;
  v14 = v8;
  v15 = objc_msgSend(v12, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v9, v10, 1, v13, v16);

  -[HKHealthStore executeQuery:](self, "executeQuery:", v15);
}

@end
