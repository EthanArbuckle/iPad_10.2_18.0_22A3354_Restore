@implementation PGGraphCalendarUnitNodeCollection

- (PGGraphDateNodeCollection)dateNodes
{
  void *v3;
  void *v4;

  objc_msgSend((id)objc_opt_class(), "dateOfCalendarUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphDateNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphDateNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)calendarUnit
{
  id v2;

  PGAbstractMethodException(a1, a2);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)filter
{
  uint64_t v2;
  __CFString *v3;
  void *v4;

  v2 = objc_msgSend(a1, "calendarUnit");
  if ((unint64_t)(v2 - 1) > 5)
    v3 = 0;
  else
    v3 = *off_1E8431DC0[v2 - 1];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A50]), "initWithLabel:domain:", v3, 400);

  return v4;
}

+ (MARelation)dateOfCalendarUnit
{
  uint64_t v2;
  __CFString *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "calendarUnit");
  if ((unint64_t)(v2 - 1) > 5)
    v3 = 0;
  else
    v3 = *off_1E8431DF0[v2 - 1];
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A00]), "initWithLabel:domain:", v3, 400);
  objc_msgSend(v4, "inRelation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (MARelation *)v5;
}

+ (id)calendarUnitNodesForUnitValue:(int64_t)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a1, "filter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("name");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)calendarUnitNodesForUnitValues:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("name");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
