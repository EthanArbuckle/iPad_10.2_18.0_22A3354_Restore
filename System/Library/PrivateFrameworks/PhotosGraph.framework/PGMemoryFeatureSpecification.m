@implementation PGMemoryFeatureSpecification

- (PGMemoryFeatureSpecification)initWithFeatureType:(int64_t)a3 typeSpecificIdentifiers:(id)a4 combineFeatureNodes:(BOOL)a5 graph:(id)a6 loggingConnection:(id)a7
{
  id v13;
  id v14;
  id v15;
  PGMemoryFeatureSpecification *v16;
  PGMemoryFeatureSpecification *v17;
  uint64_t v18;
  PGGraphFeatureNodeCollection *featureNodes;
  objc_super v21;

  v13 = a4;
  v14 = a6;
  v15 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PGMemoryFeatureSpecification;
  v16 = -[PGMemoryFeatureSpecification init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_featureType = a3;
    objc_storeStrong((id *)&v16->_typeSpecificIdentifiers, a4);
    v17->_combineFeatureNodes = a5;
    objc_storeStrong((id *)&v17->_loggingConnection, a7);
    -[PGMemoryFeatureSpecification featureNodesInGraph:](v17, "featureNodesInGraph:", v14);
    v18 = objc_claimAutoreleasedReturnValue();
    featureNodes = v17->_featureNodes;
    v17->_featureNodes = (PGGraphFeatureNodeCollection *)v18;

  }
  return v17;
}

- (id)featureNodesInGraph:(id)a3
{
  id v4;
  __objc2_class *v5;
  NSSet *typeSpecificIdentifiers;
  void *v7;
  void *v8;
  void *v9;
  NSSet *v10;
  __objc2_class *v11;
  void *v12;
  void *v13;
  NSSet *v14;
  void *v15;
  NSSet *v16;
  NSSet *v17;
  NSSet *v18;
  NSSet *v19;
  NSSet *v20;
  NSSet *v21;
  NSSet *v22;
  NSSet *v23;
  void *v24;
  NSObject *loggingConnection;
  const char *v26;
  uint8_t *v27;
  NSSet *v28;
  __int16 v30;
  __int16 v31;
  __int16 v32;
  __int16 v33;
  __int16 v34;
  __int16 v35;
  uint8_t buf[2];

  v4 = a3;
  switch(self->_featureType)
  {
    case 1:
      v5 = PGGraphMonthDayNodeCollection;
      goto LABEL_62;
    case 2:
      typeSpecificIdentifiers = self->_typeSpecificIdentifiers;
      if (!typeSpecificIdentifiers)
        goto LABEL_61;
      if (-[NSSet count](typeSpecificIdentifiers, "count") == 1)
      {
        -[NSSet anyObject](self->_typeSpecificIdentifiers, "anyObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphSeasonNodeCollection seasonNodesForSeasonName:inGraph:](PGGraphSeasonNodeCollection, "seasonNodesForSeasonName:inGraph:", v7, v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "featureNodeCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_65;
      }
      v28 = self->_typeSpecificIdentifiers;
      if (!v28 || -[NSSet count](v28, "count") < 2)
      {
LABEL_61:
        v5 = PGGraphSeasonNodeCollection;
        goto LABEL_62;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      *(_WORD *)buf = 0;
      v26 = "[PGMemoryFeatureSpecification] Only one seasonName should be defined in the PGFeatureTypeSeason typeSpecificIdentifier.";
      v27 = buf;
      goto LABEL_59;
    case 3:
      v5 = PGGraphAreaNodeCollection;
      goto LABEL_62;
    case 4:
      v10 = self->_typeSpecificIdentifiers;
      v11 = PGGraphROINodeCollection;
      if (!v10)
        goto LABEL_33;
      -[NSSet allObjects](v10, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphROINodeCollection roiNodesForLabels:inGraph:](PGGraphROINodeCollection, "roiNodesForLabels:inGraph:", v12, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    case 5:
      v14 = self->_typeSpecificIdentifiers;
      v11 = PGGraphPOINodeCollection;
      if (!v14)
        goto LABEL_33;
      -[NSSet allObjects](v14, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphPOINodeCollection poiNodesForLabels:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabels:inGraph:", v12, v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    case 6:
      v5 = PGGraphLocationDistrictNodeCollection;
      goto LABEL_62;
    case 7:
      v5 = PGGraphAddressNodeCollection;
      goto LABEL_62;
    case 8:
      v5 = PGGraphLocationCityNodeCollection;
      goto LABEL_62;
    case 9:
      v5 = PGGraphLocationStateNodeCollection;
      goto LABEL_62;
    case 0xALL:
      v5 = PGGraphLocationCountryNodeCollection;
      goto LABEL_62;
    case 0xBLL:
      +[PGGraphHomeWorkNodeCollection homeNodesInGraph:](PGGraphHomeWorkNodeCollection, "homeNodesInGraph:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 0xCLL:
      +[PGGraphHomeWorkNodeCollection workNodesInGraph:](PGGraphHomeWorkNodeCollection, "workNodesInGraph:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 0xDLL:
      v5 = PGGraphFrequentLocationNodeCollection;
      goto LABEL_62;
    case 0xELL:
      v5 = PGGraphSocialGroupNodeCollection;
      goto LABEL_62;
    case 0xFLL:
      +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 0x10:
      +[PGGraphPersonNodeCollection personNodesInAgeCategories:includingMe:inGraph:](PGGraphPersonNodeCollection, "personNodesInAgeCategories:includingMe:inGraph:", &unk_1E84E9A60, 0, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 0x11:
      v5 = PGGraphPetNodeCollection;
      goto LABEL_62;
    case 0x12:
      v16 = self->_typeSpecificIdentifiers;
      if (v16)
      {
        +[PGGraphSceneNodeCollection sceneNodesForSceneNames:inGraph:](PGGraphSceneNodeCollection, "sceneNodesForSceneNames:inGraph:", v16, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      v35 = 0;
      v26 = "[PGMemoryFeatureSpecification] No sceneNames specified for PGFeatureTypeScene.";
      v27 = (uint8_t *)&v35;
      goto LABEL_59;
    case 0x13:
      v17 = self->_typeSpecificIdentifiers;
      if (v17)
      {
        -[NSSet allObjects](v17, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphSceneFeatureNodeCollection sceneFeatureNodesForSceneNames:inGraph:](PGGraphSceneFeatureNodeCollection, "sceneFeatureNodesForSceneNames:inGraph:", v12, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      v34 = 0;
      v26 = "[PGMemoryFeatureSpecification] No sceneFeatureNodeLabels specified for PGFeatureTypeSceneFeature";
      v27 = (uint8_t *)&v34;
      goto LABEL_59;
    case 0x14:
      v18 = self->_typeSpecificIdentifiers;
      v5 = PGGraphAudioFeatureNodeCollection;
      if (!v18)
        goto LABEL_62;
      +[PGGraphAudioFeatureNodeCollection audioFeatureNodesForLabels:inGraph:](PGGraphAudioFeatureNodeCollection, "audioFeatureNodesForLabels:inGraph:", v18, v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 0x15:
      v19 = self->_typeSpecificIdentifiers;
      if (v19)
      {
        -[NSSet allObjects](v19, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphMeaningNodeCollection meaningNodesWithMeaningLabels:inGraph:](PGGraphMeaningNodeCollection, "meaningNodesWithMeaningLabels:inGraph:", v12, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      v33 = 0;
      v26 = "[PGMemoryFeatureSpecification] No meaningLabels specified for PGFeatureTypeMeaning.";
      v27 = (uint8_t *)&v33;
      goto LABEL_59;
    case 0x16:
      v20 = self->_typeSpecificIdentifiers;
      v11 = PGGraphHolidayNodeCollection;
      if (v20)
      {
        -[NSSet allObjects](v20, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGGraphHolidayNodeCollection holidayNodesWithNames:inGraph:](PGGraphHolidayNodeCollection, "holidayNodesWithNames:inGraph:", v12, v4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_41;
      }
LABEL_33:
      v5 = v11;
LABEL_62:
      -[__objc2_class nodesInGraph:](v5, "nodesInGraph:", v4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_63;
    case 0x17:
      v21 = self->_typeSpecificIdentifiers;
      if (v21)
      {
        +[PGGraphPersonActivityMeaningNodeCollection personActivityMeaningNodesForActivityLabels:inGraph:](PGGraphPersonActivityMeaningNodeCollection, "personActivityMeaningNodesForActivityLabels:inGraph:", v21, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_63;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      v32 = 0;
      v26 = "[PGMemoryFeatureSpecification] No activityLabels specified for PGFeatureTypePersonActivityMeaning.";
      v27 = (uint8_t *)&v32;
      goto LABEL_59;
    case 0x18:
      v22 = self->_typeSpecificIdentifiers;
      if (v22)
      {
        +[PGGraphBusinessCategoryNodeCollection businessCategoryNodesForCategories:inGraph:](PGGraphBusinessCategoryNodeCollection, "businessCategoryNodesForCategories:inGraph:", v22, v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "businessNodes");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:
        v24 = v13;
        objc_msgSend(v13, "featureNodeCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_64;
      }
      loggingConnection = self->_loggingConnection;
      if (!os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        goto LABEL_60;
      v31 = 0;
      v26 = "[PGMemoryFeatureSpecification] No businessCategories specified for PGFeatureTypeBusiness.";
      v27 = (uint8_t *)&v31;
      goto LABEL_59;
    case 0x19:
      v23 = self->_typeSpecificIdentifiers;
      if (v23)
      {
        +[PGGraphPublicEventNodeCollection publicEventNodesWithCategories:inGraph:](PGGraphPublicEventNodeCollection, "publicEventNodesWithCategories:inGraph:", v23, v4);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_63:
        v12 = v15;
        objc_msgSend(v15, "featureNodeCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_64:

      }
      else
      {
        loggingConnection = self->_loggingConnection;
        if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
        {
          v30 = 0;
          v26 = "[PGMemoryFeatureSpecification] No publicEventCategories specified for PGFeatureTypePublicEvent.";
          v27 = (uint8_t *)&v30;
LABEL_59:
          _os_log_error_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_ERROR, v26, v27, 2u);
        }
LABEL_60:
        v9 = 0;
      }
LABEL_65:

      return v9;
    case 0x1ALL:
      +[PGGraphHighlightTypeNodeCollection concludedTripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "concludedTripTypeNodesInGraph:", v4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "highlightGroupNodes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_41;
    case 0x1BLL:
      v5 = PGGraphMeNodeCollection;
      goto LABEL_62;
    default:
      goto LABEL_60;
  }
}

- (int64_t)featureType
{
  return self->_featureType;
}

- (NSSet)typeSpecificIdentifiers
{
  return self->_typeSpecificIdentifiers;
}

- (PGGraphFeatureNodeCollection)featureNodes
{
  return self->_featureNodes;
}

- (BOOL)combineFeatureNodes
{
  return self->_combineFeatureNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_typeSpecificIdentifiers, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

@end
