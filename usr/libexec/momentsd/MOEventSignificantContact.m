@implementation MOEventSignificantContact

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *interactionContactScore;
  id v5;

  interactionContactScore = self->_interactionContactScore;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", interactionContactScore, CFSTR("interactionContactScore"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionScoredContact, CFSTR("interactionScoredContact"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionGroupName, CFSTR("interactionGroupName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionContacts, CFSTR("interactionContacts"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactionMechanisms, CFSTR("interactionMechanisms"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_interactions, CFSTR("interactions"));

}

- (MOEventSignificantContact)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventSignificantContact *v6;
  id v7;
  uint64_t v8;
  NSNumber *interactionContactScore;
  uint64_t v10;
  id v11;
  uint64_t v12;
  PPScoredContact *interactionScoredContact;
  uint64_t v14;
  id v15;
  uint64_t v16;
  NSString *interactionGroupName;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSArray *interactionContacts;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  NSSet *interactionMechanisms;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  NSArray *interactions;
  objc_super v45;

  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)MOEventSignificantContact;
  v6 = -[MOEventSignificantContact init](&v45, "init");
  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber, v5), CFSTR("interactionContactScore"));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    interactionContactScore = v6->_interactionContactScore;
    v6->_interactionContactScore = (NSNumber *)v8;

    v11 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(PPScoredContact, v10), CFSTR("interactionScoredContact"));
    v12 = objc_claimAutoreleasedReturnValue(v11);
    interactionScoredContact = v6->_interactionScoredContact;
    v6->_interactionScoredContact = (PPScoredContact *)v12;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString, v14), CFSTR("interactionGroupName"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    interactionGroupName = v6->_interactionGroupName;
    v6->_interactionGroupName = (NSString *)v16;

    v18 = objc_autoreleasePoolPush();
    v19 = objc_alloc((Class)NSSet);
    v21 = objc_opt_class(NSArray, v20);
    v23 = objc_opt_class(PPScoredContact, v22);
    v25 = objc_msgSend(v19, "initWithObjects:", v21, v23, objc_opt_class(NSString, v24), 0);
    objc_autoreleasePoolPop(v18);
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("interactionContacts")));
    interactionContacts = v6->_interactionContacts;
    v6->_interactionContacts = (NSArray *)v26;

    v28 = objc_autoreleasePoolPush();
    v29 = objc_alloc((Class)NSSet);
    v31 = objc_opt_class(NSSet, v30);
    v33 = objc_msgSend(v29, "initWithObjects:", v31, objc_opt_class(NSNumber, v32), 0);
    objc_autoreleasePoolPop(v28);
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v33, CFSTR("interactionMechanisms")));
    interactionMechanisms = v6->_interactionMechanisms;
    v6->_interactionMechanisms = (NSSet *)v34;

    v36 = objc_autoreleasePoolPush();
    v37 = objc_alloc((Class)NSSet);
    v39 = objc_opt_class(NSArray, v38);
    v41 = objc_msgSend(v37, "initWithObjects:", v39, objc_opt_class(MOInteraction, v40), 0);
    objc_autoreleasePoolPop(v36);
    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v41, CFSTR("interactions")));
    interactions = v6->_interactions;
    v6->_interactions = (NSArray *)v42;

  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOEventSignificantContact *v4;

  v4 = objc_alloc_init(MOEventSignificantContact);
  objc_storeStrong((id *)&v4->_interactions, self->_interactions);
  objc_storeStrong((id *)&v4->_interactionContacts, self->_interactionContacts);
  objc_storeStrong((id *)&v4->_interactionMechanisms, self->_interactionMechanisms);
  objc_storeStrong((id *)&v4->_interactionGroupName, self->_interactionGroupName);
  objc_storeStrong((id *)&v4->_interactionContactScore, self->_interactionContactScore);
  objc_storeStrong((id *)&v4->_interactionScoredContact, self->_interactionScoredContact);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = objc_alloc((Class)NSString);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PPScoredContact contact](self->_interactionScoredContact, "contact"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString mask](self->_interactionGroupName, "mask"));
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("interactionScoredContact identifier, %@, interactionGroupName, %@, interactionContact count, %lu, interaction count, %lu, interactionMechanisms, %@"), v5, v6, -[NSArray count](self->_interactionContacts, "count"), -[NSArray count](self->_interactions, "count"), self->_interactionMechanisms);

  return v7;
}

- (NSNumber)interactionContactScore
{
  return self->_interactionContactScore;
}

- (void)setInteractionContactScore:(id)a3
{
  objc_storeStrong((id *)&self->_interactionContactScore, a3);
}

- (PPScoredContact)interactionScoredContact
{
  return self->_interactionScoredContact;
}

- (void)setInteractionScoredContact:(id)a3
{
  objc_storeStrong((id *)&self->_interactionScoredContact, a3);
}

- (NSString)interactionGroupName
{
  return self->_interactionGroupName;
}

- (void)setInteractionGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_interactionGroupName, a3);
}

- (NSArray)interactionContacts
{
  return self->_interactionContacts;
}

- (void)setInteractionContacts:(id)a3
{
  objc_storeStrong((id *)&self->_interactionContacts, a3);
}

- (NSDictionary)contactClassificationMap
{
  return self->_contactClassificationMap;
}

- (void)setContactClassificationMap:(id)a3
{
  objc_storeStrong((id *)&self->_contactClassificationMap, a3);
}

- (NSSet)interactionMechanisms
{
  return self->_interactionMechanisms;
}

- (void)setInteractionMechanisms:(id)a3
{
  objc_storeStrong((id *)&self->_interactionMechanisms, a3);
}

- (NSArray)interactions
{
  return self->_interactions;
}

- (void)setInteractions:(id)a3
{
  objc_storeStrong((id *)&self->_interactions, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactions, 0);
  objc_storeStrong((id *)&self->_interactionMechanisms, 0);
  objc_storeStrong((id *)&self->_contactClassificationMap, 0);
  objc_storeStrong((id *)&self->_interactionContacts, 0);
  objc_storeStrong((id *)&self->_interactionGroupName, 0);
  objc_storeStrong((id *)&self->_interactionScoredContact, 0);
  objc_storeStrong((id *)&self->_interactionContactScore, 0);
}

@end
