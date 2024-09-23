@implementation PCNewsSegmentation

+ (NSNumber)gender
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_updateGenderAndAgeGroupValues");
  objc_msgSend(a1, "_classProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gender"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

+ (NSNumber)ageGroup
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_updateGenderAndAgeGroupValues");
  objc_msgSend(a1, "_classProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ageGroup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v4;
}

+ (void)_updateGenderAndAgeGroupValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PCSupportRequester *v7;

  v7 = objc_alloc_init(PCSupportRequester);
  -[PCSupportRequester fetchGenderAndAgeGroupData](v7, "fetchGenderAndAgeGroupData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("gender"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("ageGroup"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_classProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValue:forKey:", v4, CFSTR("gender"));
  objc_msgSend(v6, "setValue:forKey:", v5, CFSTR("ageGroup"));

}

+ (id)_classProperties
{
  if (qword_253DA4CC8 != -1)
    dispatch_once(&qword_253DA4CC8, &unk_24D33AA60);
  return (id)qword_253DA4CC0;
}

+ (void)addClientToSegments:(id)a3 replaceExisting:(BOOL)a4 privateSegment:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v7;
  PCSupportRequester *v8;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(PCSupportRequester);
  -[PCSupportRequester addClientToSegments:replaceExisting:privateSegment:](v8, "addClientToSegments:replaceExisting:privateSegment:", v7, v6, v5);

}

+ (id)segmentData
{
  return 0;
}

@end
