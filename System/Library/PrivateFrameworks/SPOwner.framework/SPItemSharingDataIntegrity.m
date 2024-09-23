@implementation SPItemSharingDataIntegrity

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SPItemSharingDataIntegrity)initWithOwnedCircles:(id)a3 memberCircles:(id)a4
{
  id v7;
  id v8;
  SPItemSharingDataIntegrity *v9;
  SPItemSharingDataIntegrity *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SPItemSharingDataIntegrity;
  v9 = -[SPItemSharingDataIntegrity init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_ownedCircles, a3);
    objc_storeStrong((id *)&v10->_memberCircles, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SPItemSharingDataIntegrity *v4;
  void *v5;
  void *v6;
  SPItemSharingDataIntegrity *v7;

  v4 = [SPItemSharingDataIntegrity alloc];
  -[SPItemSharingDataIntegrity ownedCircles](self, "ownedCircles");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPItemSharingDataIntegrity memberCircles](self, "memberCircles");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SPItemSharingDataIntegrity initWithOwnedCircles:memberCircles:](v4, "initWithOwnedCircles:memberCircles:", v5, v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *ownedCircles;
  id v5;

  ownedCircles = self->_ownedCircles;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", ownedCircles, CFSTR("ownedCircles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_memberCircles, CFSTR("memberCircles"));

}

- (SPItemSharingDataIntegrity)initWithCoder:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *ownedCircles;
  NSArray *v7;
  NSArray *memberCircles;

  v4 = a3;
  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("ownedCircles"));
  v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
  ownedCircles = self->_ownedCircles;
  self->_ownedCircles = v5;

  objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("memberCircles"));
  v7 = (NSArray *)objc_claimAutoreleasedReturnValue();

  memberCircles = self->_memberCircles;
  self->_memberCircles = v7;

  return self;
}

- (NSArray)ownedCircles
{
  return self->_ownedCircles;
}

- (void)setOwnedCircles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)memberCircles
{
  return self->_memberCircles;
}

- (void)setMemberCircles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memberCircles, 0);
  objc_storeStrong((id *)&self->_ownedCircles, 0);
}

@end
