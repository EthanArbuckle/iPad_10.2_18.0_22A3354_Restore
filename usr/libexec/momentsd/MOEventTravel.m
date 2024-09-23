@implementation MOEventTravel

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *tripTitle;
  id v5;

  tripTitle = self->_tripTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", tripTitle, CFSTR("tripTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_tripParts, CFSTR("tripParts"));

}

- (MOEventTravel)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventTravel *v6;
  id v7;
  uint64_t v8;
  NSString *tripTitle;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  NSArray *tripParts;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)MOEventTravel;
  v6 = -[MOEventTravel init](&v23, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v5), CFSTR("tripTitle"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    tripTitle = v6->_tripTitle;
    v6->_tripTitle = (NSString *)v8;

    v10 = objc_autoreleasePoolPush();
    v11 = objc_alloc((Class)NSSet);
    v13 = objc_opt_class(NSArray, v12);
    v15 = objc_opt_class(PPTripPart, v14);
    v17 = objc_opt_class(CLPlacemark, v16);
    v19 = objc_msgSend(v11, "initWithObjects:", v13, v15, v17, objc_opt_class(NSString, v18), 0);
    objc_autoreleasePoolPop(v10);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v19, CFSTR("tripParts")));
    tripParts = v6->_tripParts;
    v6->_tripParts = (NSArray *)v20;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventTravel *v4;

  v4 = objc_alloc_init(MOEventTravel);
  objc_storeStrong((id *)&v4->_tripParts, self->_tripParts);
  objc_storeStrong((id *)&v4->_tripTitle, self->_tripTitle);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MOEventTravel tripTitle](self, "tripTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mask"));
  v6 = objc_msgSend(v3, "initWithFormat:", CFSTR("tripTitle, %@"), v5);

  return v6;
}

- (NSString)tripTitle
{
  return self->_tripTitle;
}

- (void)setTripTitle:(id)a3
{
  objc_storeStrong((id *)&self->_tripTitle, a3);
}

- (NSArray)tripParts
{
  return self->_tripParts;
}

- (void)setTripParts:(id)a3
{
  objc_storeStrong((id *)&self->_tripParts, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripParts, 0);
  objc_storeStrong((id *)&self->_tripTitle, 0);
}

@end
