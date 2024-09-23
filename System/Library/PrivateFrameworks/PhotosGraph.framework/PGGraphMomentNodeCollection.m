@implementation PGGraphMomentNodeCollection

- (PGGraphSocialGroupNodeCollection)socialGroupNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode socialGroupInMoment](PGGraphMomentNode, "socialGroupInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSocialGroupNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSocialGroupNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)previousMomentNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode previousMomentOfMoment](PGGraphMomentNode, "previousMomentOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)nextMomentNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode nextMomentOfMoment](PGGraphMomentNode, "nextMomentOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphDateNodeCollection)dateNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode dateOfMoment](PGGraphMomentNode, "dateOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphDateNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphDateNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)addressNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode addressOfMoment](PGGraphMomentNode, "addressOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)preciseAddressNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode preciseAddressOfMoment](PGGraphMomentNode, "preciseAddressOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphAddressNodeCollection)remoteAddressNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode remoteAddressOfMoment](PGGraphMomentNode, "remoteAddressOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphAddressNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphAddressNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)personNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode personInMoment](PGGraphMomentNode, "personInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)consolidatedPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode consolidatedPersonInMoment](PGGraphMomentNode, "consolidatedPersonInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)consolidatedPersonNodesPresentInAssets
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode consolidatedPersonPresentInAssets](PGGraphMomentNode, "consolidatedPersonPresentInAssets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)personNodesInProximity
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode personInProximityInMoment](PGGraphMomentNode, "personInProximityInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)birthdayPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode birthdayPersonInMoment](PGGraphMomentNode, "birthdayPersonInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)anniversaryPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode anniversaryPersonInMoment](PGGraphMomentNode, "anniversaryPersonInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphLocationCityNodeCollection)cityNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode cityOfMoment](PGGraphMomentNode, "cityOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphLocationCityNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphLocationCityNodeCollection *)v4;
}

- (PGGraphHighlightNodeCollection)highlightNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode highlightOfMoment](PGGraphMomentNode, "highlightOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHighlightNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHighlightNodeCollection *)v4;
}

- (PGGraphPetNodeCollection)petNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode petPresentInMoment](PGGraphMomentNode, "petPresentInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPetNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPetNodeCollection *)v4;
}

- (PGGraphPartOfWeekNodeCollection)partOfWeekNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphPartOfWeekEdge filter](PGGraphPartOfWeekEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPartOfWeekNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPartOfWeekNodeCollection *)v5;
}

- (PGGraphPersonNodeCollection)authorNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode authorOfMoment](PGGraphMomentNode, "authorOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphPersonNodeCollection)presentPersonNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode personPhysicallyPresentInMoment](PGGraphMomentNode, "personPhysicallyPresentInMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPersonNodeCollection *)v4;
}

- (PGGraphMemoryNodeCollection)memoryNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode memoryOfMoment](PGGraphMomentNode, "memoryOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMemoryNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMemoryNodeCollection *)v4;
}

- (PGGraphWeekdayNodeCollection)weekdayNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode weekdayOfMoment](PGGraphMomentNode, "weekdayOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphWeekdayNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphWeekdayNodeCollection *)v4;
}

- (PGGraphWeekendNodeCollection)weekendNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode weekendOfMoment](PGGraphMomentNode, "weekendOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphWeekendNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphWeekendNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)meaningNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode meaningOfMoment](PGGraphMomentNode, "meaningOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)alternativeMeaningNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode alternativeMeaningOfMoment](PGGraphMomentNode, "alternativeMeaningOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMeaningNodeCollection *)v4;
}

- (PGGraphMeaningNodeCollection)reliableMeaningNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode reliableMeaningOfMoment](PGGraphMomentNode, "reliableMeaningOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMeaningNodeCollection *)v4;
}

- (id)personActivityMeaningNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode personActivityMeaningOfMoment](PGGraphMomentNode, "personActivityMeaningOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPersonActivityMeaningNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (PGGraphPublicEventNodeCollection)publicEventNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode publicEventOfMoment](PGGraphMomentNode, "publicEventOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPublicEventNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPublicEventNodeCollection *)v4;
}

- (PGGraphBusinessNodeCollection)businessNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode businessOfMoment](PGGraphMomentNode, "businessOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphBusinessNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphBusinessNodeCollection *)v4;
}

- (PGGraphFeatureNodeCollection)featureNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode featureOfMoment](PGGraphMomentNode, "featureOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFeatureNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphFeatureNodeCollection *)v4;
}

- (PGGraphPOINodeCollection)poiNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode poiOfMoment](PGGraphMomentNode, "poiOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPOINodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPOINodeCollection *)v4;
}

- (PGGraphPOINodeCollection)improvedPOINodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode improvedPOIOfMoment](PGGraphMomentNode, "improvedPOIOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPOINodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPOINodeCollection *)v4;
}

- (PGGraphPOINodeCollection)specialPOINodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode specialPOIOfMoment](PGGraphMomentNode, "specialPOIOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPOINodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphPOINodeCollection *)v4;
}

- (PGGraphROINodeCollection)roiNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphROINodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphROINodeCollection *)v4;
}

- (PGGraphROINodeCollection)beachRoiNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[PGGraphROINode beachFilter](PGGraphROINode, "beachFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphROINodeCollection, "nodesRelatedToNodes:withRelation:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)mountainRoiNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[PGGraphROINode mountainFilter](PGGraphROINode, "mountainFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphROINodeCollection, "nodesRelatedToNodes:withRelation:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)natureRoiNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[PGGraphROINode natureFilter](PGGraphROINode, "natureFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphROINodeCollection, "nodesRelatedToNodes:withRelation:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)urbanRoiNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[PGGraphROINode urbanFilter](PGGraphROINode, "urbanFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphROINodeCollection, "nodesRelatedToNodes:withRelation:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphROINodeCollection)waterRoiNodes
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D42A68];
  +[PGGraphMomentNode roiOfMoment](PGGraphMomentNode, "roiOfMoment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  +[PGGraphROINode waterFilter](PGGraphROINode, "waterFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphROINodeCollection, "nodesRelatedToNodes:withRelation:", self, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphROINodeCollection *)v9;
}

- (PGGraphSceneNodeCollection)sceneNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphSceneEdge filter](PGGraphSceneEdge, "filter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSceneNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphSceneNodeCollection)reliableSceneNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphSceneEdge isReliableFilter](PGGraphSceneEdge, "isReliableFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSceneNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphSceneNodeCollection)highConfidenceSceneNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphSceneEdge highConfidenceAssetsFilter](PGGraphSceneEdge, "highConfidenceAssetsFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSceneNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)interestingSubset
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphMomentNode interestingFilter](PGGraphMomentNode, "interestingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)interestingWithAlternateJunkingSubset
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphMomentNode interestingWithAlternateJunkingFilter](PGGraphMomentNode, "interestingWithAlternateJunkingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)interestingForMemoriesSubset
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[MAElementCollection graph](self, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_interestingForMemoriesSubsetFromMomentNodes:inGraph:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphMomentNodeCollection)smartInterestingSubset
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphMomentNode smartInterestingFilter](PGGraphMomentNode, "smartInterestingFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "relation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v5;
}

- (PGGraphSceneNodeCollection)searchConfidenceSceneNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphSceneEdge searchConfidenceAssetsFilter](PGGraphSceneEdge, "searchConfidenceAssetsFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphSceneNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphSceneNodeCollection *)v5;
}

- (PGGraphEntityNetSceneNodeCollection)searchConfidenceEntityNetSceneNodes
{
  void *v3;
  void *v4;
  void *v5;

  +[PGGraphSceneEdge searchConfidenceAssetsFilter](PGGraphEntityNetSceneEdge, "searchConfidenceAssetsFilter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outRelation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphEntityNetSceneNodeCollection, "nodesRelatedToNodes:withRelation:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphEntityNetSceneNodeCollection *)v5;
}

- (id)poiNodesForLabel:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D42A68];
  v5 = a3;
  +[PGGraphMomentNode poiOfMoment](PGGraphMomentNode, "poiOfMoment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  +[PGGraphPOINode filterWithLabel:](PGGraphPOINode, "filterWithLabel:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "relation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "chain:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphPOINodeCollection, "nodesRelatedToNodes:withRelation:", self, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (PGGraphHolidayNodeCollection)celebratedHolidayNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode celebratedHolidayOfMoment](PGGraphMomentNode, "celebratedHolidayOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphHolidayNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphHolidayNodeCollection *)v4;
}

- (PGGraphFrequentLocationNodeCollection)frequentLocationNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode frequentLocationOfMoment](PGGraphMomentNode, "frequentLocationOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphFrequentLocationNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphFrequentLocationNodeCollection *)v4;
}

- (PGGraphMobilityNodeCollection)mobilityNodes
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode mobilityOfMoment](PGGraphMomentNode, "mobilityOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMobilityNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMobilityNodeCollection *)v4;
}

- (unint64_t)numberOfAssetsInExtendedCuration
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__PGGraphMomentNodeCollection_numberOfAssetsInExtendedCuration__block_invoke;
  v4[3] = &unk_1E84345C8;
  v4[4] = &v5;
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("extc"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (NSDictionary)numberOfAssetsByMomentUUID
{
  void *v3;
  uint64_t v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  NSDictionary *v9;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v4 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke;
  v14[3] = &unk_1E84364F8;
  v5 = v3;
  v15 = v5;
  -[PGGraphMomentNodeCollection enumerateUUIDsUsingBlock:](self, "enumerateUUIDsUsingBlock:", v14);
  v11[0] = v4;
  v11[1] = 3221225472;
  v11[2] = __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke_2;
  v11[3] = &unk_1E8432418;
  v12 = v5;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v13 = v6;
  v7 = v5;
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("cnt"), v11);
  v8 = v13;
  v9 = (NSDictionary *)v6;

  return v9;
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
  v6[2] = __56__PGGraphMomentNodeCollection_enumerateUUIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E8432440;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("lclid"), v6);

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
  v6[2] = __47__PGGraphMomentNodeCollection_localIdentifiers__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNodeCollection enumerateUUIDsUsingBlock:](self, "enumerateUUIDsUsingBlock:", v6);

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
  v6[2] = __36__PGGraphMomentNodeCollection_uuids__block_invoke;
  v6[3] = &unk_1E84364F8;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("lclid"), v6);

  return (NSSet *)v4;
}

- (id)firstAndLastMomentNodes
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__54839;
  v16 = __Block_byref_object_dispose__54840;
  v17 = 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__54839;
  v10 = __Block_byref_object_dispose__54840;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__PGGraphMomentNodeCollection_firstAndLastMomentNodes__block_invoke;
  v5[3] = &unk_1E8432468;
  v5[4] = &v12;
  v5[5] = &v6;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v5);
  if (v13[5] && (v2 = v7[5]) != 0)
  {
    v18[0] = v13[5];
    v18[1] = v2;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }
  _Block_object_dispose(&v6, 8);

  _Block_object_dispose(&v12, 8);
  return v3;
}

- (void)enumerateUniversalStartDatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__PGGraphMomentNodeCollection_enumerateUniversalStartDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("utcs"), v6);

}

- (void)enumerateUniversalEndDatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PGGraphMomentNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("utce"), v6);

}

- (NSDateInterval)universalDateInterval
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__54839;
  v24 = __Block_byref_object_dispose__54840;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v25 = v3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke;
  v19[3] = &unk_1E8432490;
  v19[4] = &v20;
  -[PGGraphMomentNodeCollection enumerateUniversalStartDatesUsingBlock:](self, "enumerateUniversalStartDatesUsingBlock:", v19);
  v5 = (void *)v21[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__54839;
    v17 = __Block_byref_object_dispose__54840;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke_2;
    v12[3] = &unk_1E8432490;
    v12[4] = &v13;
    -[PGGraphMomentNodeCollection enumerateUniversalEndDatesUsingBlock:](self, "enumerateUniversalEndDatesUsingBlock:", v12);
    v8 = (void *)v14[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "isEqualToDate:", v9);

    if ((v8 & 1) != 0 || objc_msgSend((id)v21[5], "compare:", v14[5]) == 1)
    {
      v7 = 0;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      v7 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v21[5], v14[5]);
    }
    _Block_object_dispose(&v13, 8);

  }
  _Block_object_dispose(&v20, 8);

  return (NSDateInterval *)v7;
}

- (NSSet)universalStartDates
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphMomentNodeCollection_universalStartDates__block_invoke;
  v6[3] = &unk_1E8434648;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNodeCollection enumerateUniversalStartDatesUsingBlock:](self, "enumerateUniversalStartDatesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (NSSet)universalEndDates
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__PGGraphMomentNodeCollection_universalEndDates__block_invoke;
  v6[3] = &unk_1E8434648;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNodeCollection enumerateUniversalEndDatesUsingBlock:](self, "enumerateUniversalEndDatesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (NSSet)localStartDates
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __46__PGGraphMomentNodeCollection_localStartDates__block_invoke;
  v6[3] = &unk_1E8434648;
  v4 = v3;
  v7 = v4;
  -[PGGraphMomentNodeCollection enumerateLocalStartDatesUsingBlock:](self, "enumerateLocalStartDatesUsingBlock:", v6);

  return (NSSet *)v4;
}

- (void)enumerateLocalStartDatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__PGGraphMomentNodeCollection_enumerateLocalStartDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("tzs"), v6);

}

- (void)enumerateLocalEndDatesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PGGraphMomentNodeCollection_enumerateLocalEndDatesUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("tze"), v6);

}

- (void)enumerateNodesAsCollectionsSortedByUniversalStartDateWithOrderAscending:(BOOL)a3 usingBlock:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __114__PGGraphMomentNodeCollection_enumerateNodesAsCollectionsSortedByUniversalStartDateWithOrderAscending_usingBlock___block_invoke;
  v8[3] = &unk_1E84324B8;
  v9 = v6;
  v7 = v6;
  -[MANodeCollection enumerateNodesAsCollectionsSortedByDoublePropertyForName:ascending:usingBlock:](self, "enumerateNodesAsCollectionsSortedByDoublePropertyForName:ascending:usingBlock:", CFSTR("utcs"), v4, v8);

}

- (NSDateInterval)localDateInterval
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__54839;
  v24 = __Block_byref_object_dispose__54840;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v25 = v3;
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke;
  v19[3] = &unk_1E8432490;
  v19[4] = &v20;
  -[PGGraphMomentNodeCollection enumerateLocalStartDatesUsingBlock:](self, "enumerateLocalStartDatesUsingBlock:", v19);
  v5 = (void *)v21[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v5, "isEqualToDate:", v6);

  if ((v5 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x3032000000;
    v16 = __Block_byref_object_copy__54839;
    v17 = __Block_byref_object_dispose__54840;
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    v12[0] = v4;
    v12[1] = 3221225472;
    v12[2] = __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke_2;
    v12[3] = &unk_1E8432490;
    v12[4] = &v13;
    -[PGGraphMomentNodeCollection enumerateLocalEndDatesUsingBlock:](self, "enumerateLocalEndDatesUsingBlock:", v12);
    v8 = (void *)v14[5];
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v8) = objc_msgSend(v8, "isEqualToDate:", v9);

    if ((v8 & 1) != 0 || objc_msgSend((id)v21[5], "compare:", v14[5]) == 1)
    {
      v7 = 0;
    }
    else
    {
      v10 = objc_alloc(MEMORY[0x1E0CB3588]);
      v7 = (void *)objc_msgSend(v10, "initWithStartDate:endDate:", v21[5], v14[5]);
    }
    _Block_object_dispose(&v13, 8);

  }
  _Block_object_dispose(&v20, 8);

  return (NSDateInterval *)v7;
}

- (void)enumerateContentScoresUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__PGGraphMomentNodeCollection_enumerateContentScoresUsingBlock___block_invoke;
  v6[3] = &unk_1E84338D8;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("cntsc"), v6);

}

- (void)enumerateNumberOfAssetsInExtendedCurationUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __83__PGGraphMomentNodeCollection_enumerateNumberOfAssetsInExtendedCurationUsingBlock___block_invoke;
  v6[3] = &unk_1E84324E0;
  v7 = v4;
  v5 = v4;
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("extc"), v6);

}

- (unint64_t)numberOfAssets
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__PGGraphMomentNodeCollection_numberOfAssets__block_invoke;
  v4[3] = &unk_1E84345C8;
  v4[4] = &v5;
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("cnt"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (unint64_t)numberOfAssetsWithPersons
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__PGGraphMomentNodeCollection_numberOfAssetsWithPersons__block_invoke;
  v4[3] = &unk_1E84345C8;
  v4[4] = &v5;
  -[MANodeCollection enumerateUnsignedIntegerPropertyValuesForKey:withBlock:](self, "enumerateUnsignedIntegerPropertyValuesForKey:withBlock:", CFSTR("nawp"), v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)averageContentScore
{
  unint64_t v3;
  double v4;
  _QWORD v6[5];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PGGraphMomentNodeCollection_averageContentScore__block_invoke;
  v6[3] = &unk_1E84345A0;
  v6[4] = &v7;
  -[MANodeCollection enumerateDoublePropertyValuesForKey:withBlock:](self, "enumerateDoublePropertyValuesForKey:withBlock:", CFSTR("cntsc"), v6);
  v3 = -[MAElementCollection count](self, "count");
  v4 = v8[3];
  if (v3)
  {
    v4 = v4 / (double)v3;
    v8[3] = v4;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (id)momentNodeAsCollectionByMomentUUID
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PGGraphMomentNodeCollection_momentNodeAsCollectionByMomentUUID__block_invoke;
  v8[3] = &unk_1E8432508;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("lclid"), v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (id)momentUUIDByMomentNodeAsCollection
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__PGGraphMomentNodeCollection_momentUUIDByMomentNodeAsCollection__block_invoke;
  v8[3] = &unk_1E8432508;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[MANodeCollection enumerateStringPropertyValuesForKey:withBlock:](self, "enumerateStringPropertyValuesForKey:withBlock:", CFSTR("lclid"), v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

- (id)momentNodeByMomentUUID
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", -[MAElementCollection count](self, "count"));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphMomentNodeCollection_momentNodeByMomentUUID__block_invoke;
  v6[3] = &unk_1E8436408;
  v4 = v3;
  v7 = v4;
  -[MANodeCollection enumerateNodesUsingBlock:](self, "enumerateNodesUsingBlock:", v6);

  return v4;
}

- (PGGraphFeatureNodeCollection)featureNodeCollection
{
  return +[PGGraphFeatureNodeCollection featureNodeCollectionWithCollection:](PGGraphFeatureNodeCollection, "featureNodeCollectionWithCollection:", self);
}

- (id)subsetWithEnoughScenesProcessed
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode filterEnoughScenesProcessed](PGGraphMomentNode, "filterEnoughScenesProcessed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANodeCollection nodesMatchingFilter:](self, "nodesMatchingFilter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)subsetWithEnoughFacesProcessed
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode filterEnoughFacesProcessed](PGGraphMomentNode, "filterEnoughFacesProcessed");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANodeCollection nodesMatchingFilter:](self, "nodesMatchingFilter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)momentNodesWithContentScoreAbove:(double)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("cntsc");
  v6 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithComparator:value:", 5, v7);
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)momentNodesWithMinimumNumberOfPersons:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("tnop");
  v6 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithComparator:value:", 6, v7);
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)momentNodesWithMinimumNumberOfExtendedCuratedAssets:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = CFSTR("extc");
  v6 = objc_alloc(MEMORY[0x1E0D42978]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithComparator:value:", 6, v7);
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "filterBySettingProperties:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "relation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)subsetWithTotalNumberOfPersonsGreaterThanOrEqualTo:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PGGraphMomentNode filterWithTotalNumberOfPersonsGreaterThanOrEqualTo:](PGGraphMomentNode, "filterWithTotalNumberOfPersonsGreaterThanOrEqualTo:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)happensPartiallyAtHomeOrWorkOfPersonNodes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[PGGraphMomentNodeCollection preciseAddressNodes](self, "preciseAddressNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeOrWorkNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addressNodes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "intersectsCollection:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)subsetForLocalDateInterval:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  +[PGGraphMomentNode filterWithLocalDateInterval:](PGGraphMomentNode, "filterWithLocalDateInterval:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PGGraphMomentNodeCollection)subsetWithSharedAssets
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode momentWithSharedAssetsOfMoment](PGGraphMomentNode, "momentWithSharedAssetsOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithPrivateAssets
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode momentWithPrivateAssetsOfMoment](PGGraphMomentNode, "momentWithPrivateAssetsOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithBothPrivateAndSharedAssets
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode momentWithPrivateAndSharedAssetsOfMoment](PGGraphMomentNode, "momentWithPrivateAndSharedAssetsOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithOnlySharedAssets
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode momentWithOnlySharedAssetsOfMoment](PGGraphMomentNode, "momentWithOnlySharedAssetsOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetWithOnlyPrivateAssets
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode momentWithOnlyPrivateAssetsOfMoment](PGGraphMomentNode, "momentWithOnlyPrivateAssetsOfMoment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[MANodeCollection nodesRelatedToNodes:withRelation:](PGGraphMomentNodeCollection, "nodesRelatedToNodes:withRelation:", self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (PGGraphMomentNodeCollection)subsetHappeningAtSensitiveLocation
{
  void *v3;
  void *v4;

  +[PGGraphMomentNode filterHappeningAtSensitiveLocation](PGGraphMomentNode, "filterHappeningAtSensitiveLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MANodeCollection nodesMatchingFilter:](self, "nodesMatchingFilter:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PGGraphMomentNodeCollection *)v4;
}

- (NSSet)universalDateIntervals
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__PGGraphMomentNodeCollection_universalDateIntervals__block_invoke;
  v6[3] = &unk_1E8432530;
  v4 = v3;
  v7 = v4;
  -[MAElementCollection enumerateIdentifiersAsCollectionsWithBlock:](self, "enumerateIdentifiersAsCollectionsWithBlock:", v6);

  return (NSSet *)v4;
}

void __53__PGGraphMomentNodeCollection_universalDateIntervals__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  objc_msgSend(a3, "universalDateInterval");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __53__PGGraphMomentNodeCollection_momentNodeByMomentUUID__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __65__PGGraphMomentNodeCollection_momentUUIDByMomentNodeAsCollection__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PGGraphMomentNodeCollection *v6;
  void *v7;
  void *v8;
  PGGraphMomentNodeCollection *v9;

  v5 = a3;
  v6 = [PGGraphMomentNodeCollection alloc];
  objc_msgSend(*(id *)(a1 + 32), "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
  v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v6, "initWithGraph:elementIdentifiers:", v7, v8);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v9);
}

void __65__PGGraphMomentNodeCollection_momentNodeAsCollectionByMomentUUID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PGGraphMomentNodeCollection *v6;
  void *v7;
  void *v8;
  PGGraphMomentNodeCollection *v9;

  v5 = a3;
  v6 = [PGGraphMomentNodeCollection alloc];
  objc_msgSend(*(id *)(a1 + 32), "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42990]), "initWithElementIdentifier:", a2);
  v9 = -[MAElementCollection initWithGraph:elementIdentifiers:](v6, "initWithGraph:elementIdentifiers:", v7, v8);

  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v5);
}

double __50__PGGraphMomentNodeCollection_averageContentScore__block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  double result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(double *)(v2 + 24) + a2;
  *(double *)(v2 + 24) = result;
  return result;
}

uint64_t __56__PGGraphMomentNodeCollection_numberOfAssetsWithPersons__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

uint64_t __45__PGGraphMomentNodeCollection_numberOfAssets__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

uint64_t __83__PGGraphMomentNodeCollection_enumerateNumberOfAssetsInExtendedCurationUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64__PGGraphMomentNodeCollection_enumerateContentScoresUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "earlierDate:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __48__PGGraphMomentNodeCollection_localDateInterval__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "laterDate:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __114__PGGraphMomentNodeCollection_enumerateNodesAsCollectionsSortedByUniversalStartDateWithOrderAscending_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __64__PGGraphMomentNodeCollection_enumerateLocalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __66__PGGraphMomentNodeCollection_enumerateLocalStartDatesUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __46__PGGraphMomentNodeCollection_localStartDates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __48__PGGraphMomentNodeCollection_universalEndDates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

uint64_t __50__PGGraphMomentNodeCollection_universalStartDates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:");
}

void __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "earlierDate:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __52__PGGraphMomentNodeCollection_universalDateInterval__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "laterDate:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __68__PGGraphMomentNodeCollection_enumerateUniversalEndDatesUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __70__PGGraphMomentNodeCollection_enumerateUniversalStartDatesUsingBlock___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __54__PGGraphMomentNodeCollection_firstAndLastMomentNodes__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v14 = v3;
  if (*(_QWORD *)(v4 + 40))
  {
    objc_msgSend(v3, "earlierMomentNode:");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    v8 = v3;
    v7 = *(void **)(v4 + 40);
    *(_QWORD *)(v4 + 40) = v8;
  }

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_QWORD *)(v9 + 40))
  {
    objc_msgSend(v14, "laterMomentNode:");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;
  }
  else
  {
    v13 = v14;
    v12 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v13;
  }

}

void __36__PGGraphMomentNodeCollection_uuids__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

}

void __47__PGGraphMomentNodeCollection_localIdentifiers__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD1670], "localIdentifierWithUUID:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

}

void __56__PGGraphMomentNodeCollection_enumerateUUIDsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a3;
  objc_msgSend(v5, "numberWithUnsignedInteger:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v7);

}

void __57__PGGraphMomentNodeCollection_numberOfAssetsByMomentUUID__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v8);

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 134217984;
      v13 = a2;
      _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[PGGraphMomentNodeCollection] No UUID for node with element identifier %lu.", (uint8_t *)&v12, 0xCu);
    }

  }
}

uint64_t __63__PGGraphMomentNodeCollection_numberOfAssetsInExtendedCuration__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a3;
  return result;
}

+ (Class)nodeClass
{
  return (Class)objc_opt_class();
}

+ (id)_interestingForMemoriesSubsetFromMomentNodes:(id)a3 inGraph:(id)a4
{
  id v6;
  id v7;
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
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  id v29;
  void *v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[2];
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  +[PGGraphMomentNode filter](PGGraphMomentNode, "filter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = CFSTR("intngaj");
  v34[1] = CFSTR("spr");
  v35[0] = MEMORY[0x1E0C9AAB0];
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42978]), "initWithComparator:value:", 6, &unk_1E84EB448);
  v35[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filterBySettingProperties:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v6, "nodesMatchingFilter:", v11);
  else
    objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v11, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "meNodeCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "homeOrWorkNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addressNodes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "momentNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "momentNodes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "collectionByFormingUnionWith:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "collectionByIntersecting:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "collectionBySubtracting:", v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "count"))
    {
      +[PGGraphNodeCollection nodesInGraph:](PGGraphPetNodeCollection, "nodesInGraph:", v7);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "momentNodes");
      v31 = v11;
      v23 = v16;
      v24 = v6;
      v25 = v13;
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __84__PGGraphMomentNodeCollection__interestingForMemoriesSubsetFromMomentNodes_inGraph___block_invoke;
      v32[3] = &unk_1E8433910;
      v33 = v26;
      v27 = v26;
      objc_msgSend(v20, "filteredCollectionUsingBlock:", v32);
      v28 = objc_claimAutoreleasedReturnValue();

      v13 = v25;
      v6 = v24;
      v16 = v23;
      v11 = v31;
      v20 = (void *)v28;
    }
    objc_msgSend(v21, "collectionByFormingUnionWith:", v20);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = v12;
  }

  return v29;
}

+ (id)momentNodesForUUIDs:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphMomentNode filterWithUUIDs:](PGGraphMomentNode, "filterWithUUIDs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)momentNodesForArrayOfUUIDs:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphMomentNode filterWithUUIDs:](PGGraphMomentNode, "filterWithUUIDs:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)momentNodesForLocalDateInterval:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphMomentNode filterWithLocalDateInterval:](PGGraphMomentNode, "filterWithLocalDateInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)momentNodesInUniversalDateInterval:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphMomentNode filterWithUniversalDateInterval:](PGGraphMomentNode, "filterWithUniversalDateInterval:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)momentNodeForUUID:(id)a3 inGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  +[PGGraphMomentNode filterWithUUID:](PGGraphMomentNode, "filterWithUUID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)momentNodeAsCollectionByMomentUUIDForMomentUUIDs:(id)a3 inGraph:(id)a4
{
  void *v4;
  void *v5;

  +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodeAsCollectionByMomentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)momentNodeAsCollectionByMomentUUIDForArrayOfMomentUUIDs:(id)a3 inGraph:(id)a4
{
  void *v4;
  void *v5;

  +[PGGraphMomentNodeCollection momentNodesForArrayOfUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForArrayOfUUIDs:inGraph:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "momentNodeAsCollectionByMomentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)momentNodesHappeningAtSensitiveLocationInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphMomentNode filterHappeningAtSensitiveLocation](PGGraphMomentNode, "filterHappeningAtSensitiveLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)momentNodesInterestingWithAlternateJunkingInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphMomentNode interestingWithAlternateJunkingFilter](PGGraphMomentNode, "interestingWithAlternateJunkingFilter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)momentNodesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)momentNodesInterestingForMemoriesInGraph:(id)a3
{
  return (id)objc_msgSend(a1, "_interestingForMemoriesSubsetFromMomentNodes:inGraph:", 0, a3);
}

+ (id)momentNodesWithEnoughScenesProcessedInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphMomentNode filterEnoughScenesProcessed](PGGraphMomentNode, "filterEnoughScenesProcessed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)momentNodesWithEnoughFacesProcessedInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  +[PGGraphMomentNode filterEnoughFacesProcessed](PGGraphMomentNode, "filterEnoughFacesProcessed");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "nodesMatchingFilter:inGraph:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __84__PGGraphMomentNodeCollection__interestingForMemoriesSubsetFromMomentNodes_inGraph___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  unint64_t v5;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsCollection:", v3) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = (unint64_t)fmax(ceil((double)(unint64_t)objc_msgSend(v3, "numberOfAssets") * 0.1), 10.0);
    v4 = objc_msgSend(v3, "numberOfAssetsWithPersons") >= v5;
  }

  return v4;
}

@end
