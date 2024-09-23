@implementation MOOutlierMetadataMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOOutlierMetadataMO *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;

  v5 = a4;
  v6 = a3;
  v7 = -[MOOutlierMetadataMO initWithContext:]([MOOutlierMetadataMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[MOOutlierMetadataMO setIdentifier:](v7, "setIdentifier:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "updatedDate"));
  -[MOOutlierMetadataMO setUpdatedDate:](v7, "setUpdatedDate:", v9);

  -[MOOutlierMetadataMO setIsSignificant:](v7, "setIsSignificant:", objc_msgSend(v6, "isSignificant"));
  objc_msgSend(v6, "outlierScore");
  -[MOOutlierMetadataMO setOutlierScore:](v7, "setOutlierScore:");
  objc_msgSend(v6, "outlierScoreThreshold");
  -[MOOutlierMetadataMO setOutlierScoreThreshold:](v7, "setOutlierScoreThreshold:");
  objc_msgSend(v6, "bundleGoodnessScore");
  -[MOOutlierMetadataMO setBundleGoodnessScore:](v7, "setBundleGoodnessScore:");
  objc_msgSend(v6, "bundleGoodnessScoreThreshold");
  v11 = v10;

  -[MOOutlierMetadataMO setBundleGoodnessScoreThreshold:](v7, "setBundleGoodnessScoreThreshold:", v11);
  return v7;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOOutlierMetadataMO"));
}

@end
