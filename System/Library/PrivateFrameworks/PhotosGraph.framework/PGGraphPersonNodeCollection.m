@implementation PGGraphPersonNodeCollection

- (PGGraphMomentNodeCollection)momentNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode momentOfPerson](PGGraphPersonNode, "momentOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphSocialGroupNodeCollection)socialGroupNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode socialGroupOfPerson](PGGraphPersonNode, "socialGroupOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSocialGroupNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSocialGroupNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeOrWorkNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode homeOrWorkOfPerson](PGGraphPersonNode, "homeOrWorkOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHomeWorkNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)homeNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode homeOfPerson](PGGraphPersonNode, "homeOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHomeWorkNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphHomeWorkNodeCollection)workNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode workOfPerson](PGGraphPersonNode, "workOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHomeWorkNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHomeWorkNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)partnerPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode partnerOfPerson](PGGraphPersonNode, "partnerOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredPartnerPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredPartnerOfPerson](PGGraphPersonNode, "inferredPartnerOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)motherPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode motherOfPerson](PGGraphPersonNode, "motherOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredMotherPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredMotherOfPerson](PGGraphPersonNode, "inferredMotherOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)fatherPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode fatherOfPerson](PGGraphPersonNode, "fatherOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredFatherPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredFatherOfPerson](PGGraphPersonNode, "inferredFatherOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)relatedPersonNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphRelationshipEdge filter](PGGraphRelationshipEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "anyDirectionRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v5;
}

- (PGGraphSocialGroupMemberNodeCollection)asSocialGroupMemberNodeCollection
{
  PGGraphSocialGroupMemberNodeCollection *v3;
  void *v4;
  void *v5;
  PGGraphSocialGroupMemberNodeCollection *v6;

  v3 = [PGGraphSocialGroupMemberNodeCollection alloc];
  -[MAElementCollection graph](self, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MAElementCollection elementIdentifiers](self, "elementIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MAElementCollection initWithGraph:elementIdentifiers:](v3, "initWithGraph:elementIdentifiers:", v4, v5);

  return v6;
}

- (PGGraphPersonNodeCollection)friendPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode friendOfPerson](PGGraphPersonNode, "friendOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredFriendPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredFriendOfPerson](PGGraphPersonNode, "inferredFriendOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)familyPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode familyOfPerson](PGGraphPersonNode, "familyOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredFamilyPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredFamilyOfPerson](PGGraphPersonNode, "inferredFamilyOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)parentPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode parentOfPerson](PGGraphPersonNode, "parentOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredParentPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredParentOfPerson](PGGraphPersonNode, "inferredParentOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)sisterPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode sisterOfPerson](PGGraphPersonNode, "sisterOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredSisterPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredSisterOfPerson](PGGraphPersonNode, "inferredSisterOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)brotherPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode brotherOfPerson](PGGraphPersonNode, "brotherOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredBrotherPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredBrotherOfPerson](PGGraphPersonNode, "inferredBrotherOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)childPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode childOfPerson](PGGraphPersonNode, "childOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredChildPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredChildOfPerson](PGGraphPersonNode, "inferredChildOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)sonPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode sonOfPerson](PGGraphPersonNode, "sonOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredSonPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredSonOfPerson](PGGraphPersonNode, "inferredSonOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)daughterPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode daughterOfPerson](PGGraphPersonNode, "daughterOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredDaughterPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredDaughterOfPerson](PGGraphPersonNode, "inferredDaughterOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)coworkerPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode coworkerOfPerson](PGGraphPersonNode, "coworkerOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredCoworkerPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredCoworkerOfPerson](PGGraphPersonNode, "inferredCoworkerOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)acquaintancePersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode acquaintanceOfPerson](PGGraphPersonNode, "acquaintanceOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)inferredAcquaintancePersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode inferredAcquaintanceOfPerson](PGGraphPersonNode, "inferredAcquaintanceOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)authoredMomentNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode momentAuthoredByPerson](PGGraphPersonNode, "momentAuthoredByPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)momentNodesWithPresence
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode momentWithPhysicallyPresentPerson](PGGraphPersonNode, "momentWithPhysicallyPresentPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)birthdayMomentNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode birthdayMomentOfPerson](PGGraphPersonNode, "birthdayMomentOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)anniversaryMomentNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode anniversaryMomentOfPerson](PGGraphPersonNode, "anniversaryMomentOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)subsetExcludingMe
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v5;
}

- (NSSet)localIdentifiers
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47__PGGraphPersonNodeCollection_localIdentifiers__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("id"), v6);

  return (NSSet *)v4;
}

- (NSSet)contactIdentifiers
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PGGraphPersonNodeCollection_contactIdentifiers__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("cnid"), v6);

  return (NSSet *)v4;
}

- (NSSet)uuids
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[MAElementCollection count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__PGGraphPersonNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("id"), v6);

  return (NSSet *)v4;
}

- (NSSet)birthdays
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __40__PGGraphPersonNodeCollection_birthdays__block_invoke;
  v6[3] = &unk_1E842D750;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("bday"), v6);

  return (NSSet *)v4;
}

- (NSSet)potentialBirthdays
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__PGGraphPersonNodeCollection_potentialBirthdays__block_invoke;
  v6[3] = &unk_1E842D750;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("pbday"), v6);

  return (NSSet *)v4;
}

- (NSSet)anniversaries
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __44__PGGraphPersonNodeCollection_anniversaries__block_invoke;
  v6[3] = &unk_1E842D750;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("anniv"), v6);

  return (NSSet *)v4;
}

- (PGGraphStorytellingRelationshipEdgeCollection)storytellingRelationshipEdges
{
  return (PGGraphStorytellingRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesOfType:onNodes:](PGGraphStorytellingRelationshipEdgeCollection, "edgesOfType:onNodes:", 1, self);
}

- (PGGraphRelationshipEdgeCollection)relationshipEdges
{
  return (PGGraphRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesOfType:onNodes:](PGGraphRelationshipEdgeCollection, "edgesOfType:onNodes:", 3, self);
}

- (PGGraphRelationshipEdgeCollection)relationshipOutEdges
{
  return (PGGraphRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesFromNodes:](PGGraphRelationshipEdgeCollection, "edgesFromNodes:", self);
}

- (PGGraphRelationshipEdgeCollection)relationshipInEdges
{
  return (PGGraphRelationshipEdgeCollection *)+[PGGraphEdgeCollection edgesToNodes:](PGGraphRelationshipEdgeCollection, "edgesToNodes:", self);
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (id)personNodeByLocalIdentifier
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PGGraphPersonNodeCollection_personNodeByLocalIdentifier__block_invoke;
  v6[3] = &unk_1E8434020;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return v4;
}

- (BOOL)containsMeNode
{
  void *v2;
  char v3;

  +[PGGraphNodeCollection subsetInCollection:](PGGraphMeNodeCollection, "subsetInCollection:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty") ^ 1;

  return v3;
}

- (void)enumerateBiologicalSexUsingBlock:(id)a3
{
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("sex"), a3);
}

- (void)enumerateUUIDsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__PGGraphPersonNodeCollection_enumerateUUIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("id"), v6);

}

- (void)enumerateLocalIdentifiersUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PGGraphPersonNodeCollection_enumerateLocalIdentifiersUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("id"), v6);

}

- (id)ownedPetNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphIsOwnerOfPetEdge filter](PGGraphIsOwnerOfPetEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPetNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PGGraphPersonRelationshipTagNodeCollection)relationshipTagNodes
{
  void *v3;
  void *v4;

  +[PGGraphPersonNode relationshipTagOfPerson](PGGraphPersonNode, "relationshipTagOfPerson");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonRelationshipTagNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonRelationshipTagNodeCollection *)v4;
}

- (id)relationshipTagNodesWithConfidence:(double)a3
{
  void *v4;
  void *v5;

  +[PGGraphPersonNode relationshipTagOfPersonWithConfidence:](PGGraphPersonNode, "relationshipTagOfPersonWithConfidence:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonRelationshipTagNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PGGraphRelationshipTagEdgeCollection)relationshipTagEdges
{
  return (PGGraphRelationshipTagEdgeCollection *)+[PGGraphEdgeCollection edgesOfType:onNodes:](PGGraphRelationshipTagEdgeCollection, "edgesOfType:onNodes:", 2, self);
}

void __67__PGGraphPersonNodeCollection_enumerateLocalIdentifiersUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __56__PGGraphPersonNodeCollection_enumerateUUIDsUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __58__PGGraphPersonNodeCollection_personNodeByLocalIdentifier__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "localIdentifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __44__PGGraphPersonNodeCollection_anniversaries__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __49__PGGraphPersonNodeCollection_potentialBirthdays__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __40__PGGraphPersonNodeCollection_birthdays__block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addObject:", v2);

}

void __36__PGGraphPersonNodeCollection_uuids__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __49__PGGraphPersonNodeCollection_contactIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __47__PGGraphPersonNodeCollection_localIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)personNodesExcludingMeInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)personNodesIncludingMeInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)personNodesForLocalIdentifier:(id)a3 inGraph:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v14;
  const __CFString *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "length"))
  {
    +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("id");
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filterBySettingProperties:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (id)v11;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@ called with 'empty' personLocalIdentifier", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraph:", v8);
  }

  return v12;
}

+ (id)personNodesForLocalIdentifiers:(id)a3 inGraph:(id)a4
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
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("id");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)personNodesForArrayOfLocalIdentifiers:(id)a3 inGraph:(id)a4
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
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("id");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)personNodesWithName:(id)a3 inGraph:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  const __CFString *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("name");
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filterBySettingProperties:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v14;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "%@ called with 'nil' name", buf, 0xCu);

    }
    v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithGraph:", v8);
  }

  return v12;
}

+ (id)personNodesWithNames:(id)a3 inGraph:(id)a4
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
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
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

+ (id)personNodesForContactIdentifiers:(id)a3 inGraph:(id)a4
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
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("cnid");
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)personNodesInAgeCategories:(id)a3 includingMe:(BOOL)a4 inGraph:(id)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v8 = a5;
  +[PGGraphPersonNode filterForAgeCategories:includingMe:](PGGraphPersonNode, "filterForAgeCategories:includingMe:", a3, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)namedPersonNodesInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PGGraphPersonNode filterNameNotEmpty](PGGraphPersonNode, "filterNameNotEmpty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPersonNodeCollection, "nodesMatchingFilter:inGraph:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)unnamedPersonNodesInGraph:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[PGGraphPersonNode filterNameEmpty](PGGraphPersonNode, "filterNameEmpty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesMatchingFilter:inGraph:](PGGraphPersonNodeCollection, "nodesMatchingFilter:inGraph:", v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)personNodesForShareParticipantIdentifiers:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphPersonNode filterWithShareParticipantIdentifiers:](PGGraphPersonNode, "filterWithShareParticipantIdentifiers:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)personNodesForSharedLibraryParticipantsInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphPersonNode filterShareParticipantIdentifierNotEmpty](PGGraphPersonNode, "filterShareParticipantIdentifierNotEmpty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)favoritedPersonNodesExcludingMeInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphPersonNode filterExcludingMe](PGGraphPersonNode, "filterExcludingMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("fav");
  v11[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)favoritedPersonNodesIncludingMeInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphPersonNode filterIncludingMe](PGGraphPersonNode, "filterIncludingMe");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = CFSTR("fav");
  v11[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterBySettingProperties:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
