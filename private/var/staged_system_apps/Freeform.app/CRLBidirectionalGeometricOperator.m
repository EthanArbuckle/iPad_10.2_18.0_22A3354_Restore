@implementation CRLBidirectionalGeometricOperator

- (CRLBidirectionalGeometricOperator)init
{
  CRLBidirectionalGeometricOperator *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mStandardValues;
  NSMutableDictionary *v5;
  void *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *mSwappedValues;
  NSMutableDictionary *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CRLBidirectionalGeometricOperator;
  v2 = -[CRLBidirectionalGeometricOperator init](&v12, "init");
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mStandardValues = v2->mStandardValues;
    v2->mStandardValues = v3;

    v5 = v2->mStandardValues;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 0));
    -[NSMutableDictionary setValue:forKey:](v5, "setValue:forKey:", v6, CFSTR("kCRLBidirectionalGeometricOperatorValuesAreSwapped"));

    v7 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    mSwappedValues = v2->mSwappedValues;
    v2->mSwappedValues = v7;

    v9 = v2->mSwappedValues;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
    -[NSMutableDictionary setValue:forKey:](v9, "setValue:forKey:", v10, CFSTR("kCRLBidirectionalGeometricOperatorValuesAreSwapped"));

  }
  return v2;
}

- (void)setOrientationDependentValueForKey:(id)a3 withStandardValue:(id)a4 andSwappedValue:(id)a5
{
  NSMutableDictionary *mStandardValues;
  id v9;
  id v10;

  mStandardValues = self->mStandardValues;
  v9 = a5;
  v10 = a3;
  -[NSMutableDictionary setValue:forKey:](mStandardValues, "setValue:forKey:", a4, v10);
  -[NSMutableDictionary setValue:forKey:](self->mSwappedValues, "setValue:forKey:", v9, v10);

}

- (void)executeBidirectionalOperation:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  v5 = dispatch_group_create();
  global_queue = dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10036DB1C;
  block[3] = &unk_10122C360;
  v8 = v4;
  block[4] = self;
  v13 = v8;
  dispatch_group_async(v5, v7, block);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10036DB74;
  v10[3] = &unk_10122C360;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  dispatch_group_async(v5, v7, v10);
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

}

- (id)valueForKey:(id)a3 swapped:(BOOL)a4
{
  uint64_t v4;

  v4 = 8;
  if (a4)
    v4 = 16;
  return objc_autoreleaseReturnValue((id)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa
                                                                                              + v4), "valueForKey:", a3)));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSwappedValues, 0);
  objc_storeStrong((id *)&self->mStandardValues, 0);
}

@end
