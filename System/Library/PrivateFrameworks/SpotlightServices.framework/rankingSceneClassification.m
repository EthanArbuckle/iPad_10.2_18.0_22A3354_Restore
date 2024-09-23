@implementation rankingSceneClassification

- (void)updateBoundingBoxOfDetector
{
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  rankingSceneClassification *v7;

  -[SSPommesPhotosRanker sceneTaxonomy](self->_rankerReference, "sceneTaxonomy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[rankingSceneClassification identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "nodeRefForSceneClassId:", objc_msgSend(v4, "unsignedIntValue"));

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x3032000000;
  v6[3] = __Block_byref_object_copy__6;
  v6[4] = __Block_byref_object_dispose__6;
  v7 = 0;
  v7 = self;
  if (v5)
    PFSceneTaxonomyNodeVisitDetectors();
  _Block_object_dispose(v6, 8);

}

- (double)boundingBoxRatio
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  -[NSArray objectAtIndexedSubscript:](self->_boundingBox, "objectAtIndexedSubscript:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValue");
  v5 = v4;
  -[NSArray objectAtIndexedSubscript:](self->_boundingBox, "objectAtIndexedSubscript:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v5 * v7;

  return v8;
}

- (void)matchScoreFromMatchInfo:(id)a3 userQueryToken:(id)a4
{
  id v6;
  int sceneMatchedType;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  sceneMatchedType = self->_sceneMatchedType;
  if ((sceneMatchedType | 2) == 3)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6678]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      -[rankingSceneClassification matchScoreWhenLabelMatched:userQueryToken:](self, "matchScoreWhenLabelMatched:userQueryToken:", v8, v6);

    sceneMatchedType = self->_sceneMatchedType;
  }
  if ((sceneMatchedType & 0xFFFFFFFE) == 2)
  {
    objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CA6688]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      -[rankingSceneClassification matchScoreWhenSynonymsMatched:userQueryToken:](self, "matchScoreWhenSynonymsMatched:userQueryToken:", v9, v6);

  }
}

- (void)matchScoreWhenLabelMatched:(id)a3 userQueryToken:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__rankingSceneClassification_matchScoreWhenLabelMatched_userQueryToken___block_invoke;
  v8[3] = &unk_1E6E453B0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

- (void)matchScoreWhenSynonymsMatched:(id)a3 userQueryToken:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __75__rankingSceneClassification_matchScoreWhenSynonymsMatched_userQueryToken___block_invoke;
  v8[3] = &unk_1E6E453B0;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateObjectsUsingBlock:", v8);

}

- (id)convertToLabelIndexWithSynonymCount:(id)a3 synonymsIndex:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    v9 = 0;
    v10 = 0;
    do
    {
      if (v10 >= objc_msgSend(v6, "count"))
        break;
      objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntValue");

      if (v8 <= v12)
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v8 += objc_msgSend(v14, "unsignedIntValue");

        ++v9;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 - 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v10;
      }
    }
    while (v9 < objc_msgSend(v5, "count"));
  }
  else
  {
    v10 = 0;
  }
  while (v10 < objc_msgSend(v6, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count") - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v15);

    ++v10;
  }

  return v7;
}

- (SSTokenizedString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (NSArray)synonyms
{
  return self->_synonyms;
}

- (void)setSynonyms:(id)a3
{
  objc_storeStrong((id *)&self->_synonyms, a3);
}

- (double)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(double)a3
{
  self->_confidence = a3;
}

- (NSArray)boundingBox
{
  return self->_boundingBox;
}

- (void)setBoundingBox:(id)a3
{
  objc_storeStrong((id *)&self->_boundingBox, a3);
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (double)matchedBoundingBoxScore
{
  return self->_matchedBoundingBoxScore;
}

- (void)setMatchedBoundingBoxScore:(double)a3
{
  self->_matchedBoundingBoxScore = a3;
}

- (double)matchedConfidenceScore
{
  return self->_matchedConfidenceScore;
}

- (void)setMatchedConfidenceScore:(double)a3
{
  self->_matchedConfidenceScore = a3;
}

- (double)matchedSceneLabelRatio
{
  return self->_matchedSceneLabelRatio;
}

- (void)setMatchedSceneLabelRatio:(double)a3
{
  self->_matchedSceneLabelRatio = a3;
}

- (double)matchedSceneSynonymsRatio
{
  return self->_matchedSceneSynonymsRatio;
}

- (void)setMatchedSceneSynonymsRatio:(double)a3
{
  self->_matchedSceneSynonymsRatio = a3;
}

- (BOOL)exactSceneMatch
{
  return self->_exactSceneMatch;
}

- (void)setExactSceneMatch:(BOOL)a3
{
  self->_exactSceneMatch = a3;
}

- (unint64_t)totalLabels
{
  return self->_totalLabels;
}

- (void)setTotalLabels:(unint64_t)a3
{
  self->_totalLabels = a3;
}

- (unint64_t)totalSynonyms
{
  return self->_totalSynonyms;
}

- (void)setTotalSynonyms:(unint64_t)a3
{
  self->_totalSynonyms = a3;
}

- (SSPommesPhotosRanker)rankerReference
{
  return self->_rankerReference;
}

- (void)setRankerReference:(id)a3
{
  objc_storeStrong((id *)&self->_rankerReference, a3);
}

- (NSDictionary)sceneReferenceDictionary
{
  return (NSDictionary *)objc_loadWeakRetained((id *)&self->_sceneReferenceDictionary);
}

- (void)setSceneReferenceDictionary:(id)a3
{
  objc_storeWeak((id *)&self->_sceneReferenceDictionary, a3);
}

- (int)sceneMatchedType
{
  return self->_sceneMatchedType;
}

- (void)setSceneMatchedType:(int)a3
{
  self->_sceneMatchedType = a3;
}

- (NSArray)synonymsIndexes
{
  return self->_synonymsIndexes;
}

- (void)setSynonymsIndexes:(id)a3
{
  objc_storeStrong((id *)&self->_synonymsIndexes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_synonymsIndexes, 0);
  objc_destroyWeak((id *)&self->_sceneReferenceDictionary);
  objc_storeStrong((id *)&self->_rankerReference, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_boundingBox, 0);
  objc_storeStrong((id *)&self->_synonyms, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
