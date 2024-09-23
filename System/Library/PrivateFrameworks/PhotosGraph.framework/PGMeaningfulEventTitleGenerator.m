@implementation PGMeaningfulEventTitleGenerator

- (PGMeaningfulEventTitleGenerator)initWithCollection:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5 titleGenerationContext:(id)a6 featureNodes:(id)a7
{
  id v13;
  id v14;
  PGMeaningfulEventTitleGenerator *v15;
  PGMeaningfulEventTitleGenerator *v16;
  objc_super v18;

  v13 = a4;
  v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)PGMeaningfulEventTitleGenerator;
  v15 = -[PGDefaultCollectionTitleGenerator initWithCollection:keyAsset:curatedAssetCollection:titleGenerationContext:](&v18, sel_initWithCollection_keyAsset_curatedAssetCollection_titleGenerationContext_, a3, 0, 0, a6);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_meaningLabel, a4);
    v16->_meaningIsReliable = a5;
    objc_storeStrong((id *)&v16->_featureNodes, a7);
  }

  return v16;
}

- (PGMeaningfulEventTitleGenerator)initWithCollection:(id)a3 meaningLabel:(id)a4 meaningIsReliable:(BOOL)a5 titleGenerationContext:(id)a6
{
  return -[PGMeaningfulEventTitleGenerator initWithCollection:meaningLabel:meaningIsReliable:titleGenerationContext:featureNodes:](self, "initWithCollection:meaningLabel:meaningIsReliable:titleGenerationContext:featureNodes:", a3, a4, a5, a6, 0);
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  void (**v4)(id, void *, void *);
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v4 = (void (**)(id, void *, void *))a3;
  -[PGMeaningfulEventTitleGenerator _title](self, "_title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGMeaningfulEventTitleGenerator _timeTitle](self, "_timeTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v4[2](v4, v5, v6);
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PGMeaningfulEventTitleGenerator;
    -[PGTitleGenerator _generateTitleAndSubtitleWithResult:](&v9, sel__generateTitleAndSubtitleWithResult_, v4);
  }

}

- (id)_title
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PGSpecBasedTitleGenerator *v8;
  void *v9;
  void *v10;
  PGSpecBasedTitleGenerator *v11;
  uint8_t v13[16];

  -[PGMeaningfulEventTitleGenerator _meaningLabelForTitle](self, "_meaningLabelForTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MAElementCollection count](self->_featureNodes, "count")
    && objc_msgSend(v3, "isEqualToString:", CFSTR("HolidayEvent")))
  {
    +[PGGraphNodeCollection subsetInCollection:](PGGraphHolidayNodeCollection, "subsetInCollection:", self->_featureNodes);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "localizedHolidayNames");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "anyObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v6, 5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGMeaningfulEventTitleGenerator.m] MeaningfulEvent memory of type kPGGraphNodeMeaningHolidayEvent has no featureNode of type PGGraphHolidayNode.", v13, 2u);
      }
      v7 = 0;
    }

  }
  else
  {
    v8 = [PGSpecBasedTitleGenerator alloc];
    -[PGTitleGenerator momentNodes](self, "momentNodes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PGSpecBasedTitleGenerator initWithMomentNodes:meaningLabel:titleGenerationContext:](v8, "initWithMomentNodes:meaningLabel:titleGenerationContext:", v9, v3, v10);

    -[PGSpecBasedTitleGenerator setLineBreakBehavior:](v11, "setLineBreakBehavior:", -[PGTitleGenerator lineBreakBehavior](self, "lineBreakBehavior"));
    -[PGSpecBasedTitleGenerator title](v11, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)_meaningLabelForTitle
{
  NSString *v3;
  __CFString **v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v3 = self->_meaningLabel;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("AmusementPark"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Festival"))
    || -[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Museum")))
  {
    v4 = kPGGraphNodeMeaningEntertainment;
  }
  else
  {
    if (!-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Concert"))
      && !-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Theater"))
      && !-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Dance")))
    {
      goto LABEL_6;
    }
    v4 = kPGGraphNodeMeaningPerformance;
  }
  v5 = *v4;

  v3 = (NSString *)v5;
LABEL_6:
  if (self->_meaningIsReliable)
    goto LABEL_7;
  if (_meaningLabelForTitle_onceToken2 != -1)
    dispatch_once(&_meaningLabelForTitle_onceToken2, &__block_literal_global_58312);
  objc_msgSend((id)_meaningLabelForTitle_meaningLabelToUnreliableMeaningLabel, "objectForKeyedSubscript:", v3);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v6)
LABEL_7:
    v6 = v3;
  if (-[NSString isEqualToString:](v3, "isEqualToString:", CFSTR("Wedding")))
  {
    v7 = CFSTR("Celebration");

    v6 = CFSTR("Celebration");
  }

  return v6;
}

- (id)_timeTitle
{
  PGTimeTitleOptions *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(PGTimeTitleOptions);
  if (-[NSString isEqualToString:](self->_meaningLabel, "isEqualToString:", CFSTR("Birthday")))
    v4 = 4;
  else
    v4 = 1;
  -[PGTimeTitleOptions setAllowedFormats:](v3, "setAllowedFormats:", v4);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v3, "setMomentNodes:", v5);

  -[PGTitleGenerator usedLocationNodes](self, "usedLocationNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setLocationNodes:](v3, "setLocationNodes:", v6);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v7, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureNodes, 0);
  objc_storeStrong((id *)&self->_meaningLabel, 0);
}

void __56__PGMeaningfulEventTitleGenerator__meaningLabelForTitle__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[14];
  _QWORD v3[15];

  v3[14] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Wedding");
  v2[1] = CFSTR("AmusementPark");
  v3[0] = CFSTR("Celebration");
  v3[1] = CFSTR("Entertainment");
  v2[2] = CFSTR("Performance");
  v2[3] = CFSTR("Concert");
  v3[2] = CFSTR("Entertainment");
  v3[3] = CFSTR("Entertainment");
  v2[4] = CFSTR("Festival");
  v2[5] = CFSTR("Theater");
  v3[4] = CFSTR("Entertainment");
  v3[5] = CFSTR("Entertainment");
  v2[6] = CFSTR("Dance");
  v2[7] = CFSTR("Museum");
  v3[6] = CFSTR("Entertainment");
  v3[7] = CFSTR("Entertainment");
  v2[8] = CFSTR("NightOut");
  v2[9] = CFSTR("SportEvent");
  v3[8] = CFSTR("Entertainment");
  v3[9] = CFSTR("Entertainment");
  v2[10] = CFSTR("WinterSport");
  v2[11] = CFSTR("Diving");
  v3[10] = CFSTR("Activity");
  v3[11] = CFSTR("Activity");
  v2[12] = CFSTR("Hiking");
  v2[13] = CFSTR("Climbing");
  v3[12] = CFSTR("Activity");
  v3[13] = CFSTR("Activity");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_meaningLabelForTitle_meaningLabelToUnreliableMeaningLabel;
  _meaningLabelForTitle_meaningLabelToUnreliableMeaningLabel = v0;

}

@end
