@implementation GKFamiliarPlayerInternal

- (void)updateWithCacheObject:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKFamiliarPlayerInternal;
  v4 = a3;
  -[GKFamiliarPlayerInternal updateWithCacheObject:](&v10, "updateWithCacheObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstName", v10.receiver, v10.super_class));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastName"));

  -[GKFamiliarPlayerInternal setFirstName:](self, "setFirstName:", v5);
  -[GKFamiliarPlayerInternal setLastName:](self, "setLastName:", v6);
  v8 = objc_msgSend((id)objc_opt_class(self, v7), "compositeNameForFirstName:lastName:", v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[GKFamiliarPlayerInternal setCompositeName:](self, "setCompositeName:", v9);

}

+ (int)familiarity
{
  return 3;
}

@end
