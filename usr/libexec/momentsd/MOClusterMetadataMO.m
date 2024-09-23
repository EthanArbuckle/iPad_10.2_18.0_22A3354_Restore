@implementation MOClusterMetadataMO

+ (id)managedObjectWithObject:(id)a3 inManagedObjectContext:(id)a4
{
  id v5;
  id v6;
  MOClusterMetadataMO *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a4;
  v6 = a3;
  v7 = -[MOClusterMetadataMO initWithContext:]([MOClusterMetadataMO alloc], "initWithContext:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  -[MOClusterMetadataMO setIdentifier:](v7, "setIdentifier:", v8);

  -[MOClusterMetadataMO setIsFiltered:](v7, "setIsFiltered:", objc_msgSend(v6, "isFiltered"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "phenotype"));
  -[MOClusterMetadataMO setPhenotype:](v7, "setPhenotype:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topLevelActivityHistogram"));
  -[MOClusterMetadataMO setTopLevelActivityHistogram:](v7, "setTopLevelActivityHistogram:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondLevelActivityHistogram"));
  -[MOClusterMetadataMO setSecondLevelActivityHistogram:](v7, "setSecondLevelActivityHistogram:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activityTypeFromPhotoTraitsHistogram"));
  -[MOClusterMetadataMO setActivityTypeFromPhotoTraitsHistogram:](v7, "setActivityTypeFromPhotoTraitsHistogram:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeTagHistogram"));
  -[MOClusterMetadataMO setTimeTagHistogram:](v7, "setTimeTagHistogram:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dayOfWeekHistogram"));
  -[MOClusterMetadataMO setDayOfWeekHistogram:](v7, "setDayOfWeekHistogram:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "timeContextFromPhotoTraitsHistogram"));
  -[MOClusterMetadataMO setTimeContextFromPhotoTraitsHistogram:](v7, "setTimeContextFromPhotoTraitsHistogram:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeNameHistogram"));
  -[MOClusterMetadataMO setPlaceNameHistogram:](v7, "setPlaceNameHistogram:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "combinedPlaceTypeHistogram"));
  -[MOClusterMetadataMO setCombinedPlaceTypeHistogram:](v7, "setCombinedPlaceTypeHistogram:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "enclosingPlaceNameHistogram"));
  -[MOClusterMetadataMO setEnclosingPlaceNameHistogram:](v7, "setEnclosingPlaceNameHistogram:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placeTypeFromPhotoTraitsHistogram"));
  -[MOClusterMetadataMO setPlaceTypeFromPhotoTraitsHistogram:](v7, "setPlaceTypeFromPhotoTraitsHistogram:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contactNamesHistogram"));
  -[MOClusterMetadataMO setContactNamesHistogram:](v7, "setContactNamesHistogram:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "personRelationshipHistogram"));
  -[MOClusterMetadataMO setPersonRelationshipHistogram:](v7, "setPersonRelationshipHistogram:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "socialEventFromPhotoTraitsHistogram"));
  -[MOClusterMetadataMO setSocialEventFromPhotoTraitsHistogram:](v7, "setSocialEventFromPhotoTraitsHistogram:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "otherSubjectFromPhotoTraitsHistogram"));
  -[MOClusterMetadataMO setOtherSubjectFromPhotoTraitsHistogram:](v7, "setOtherSubjectFromPhotoTraitsHistogram:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subBundleGoodnessScores"));
  -[MOClusterMetadataMO setSubBundleGoodnessScores:](v7, "setSubBundleGoodnessScores:", v24);

  return v7;
}

+ (id)fetchRequest
{
  return +[NSFetchRequest fetchRequestWithEntityName:](NSFetchRequest, "fetchRequestWithEntityName:", CFSTR("MOClusterMetadataMO"));
}

@end
