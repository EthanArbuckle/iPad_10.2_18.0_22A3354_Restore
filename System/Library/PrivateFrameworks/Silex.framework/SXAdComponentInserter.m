@implementation SXAdComponentInserter

- (SXAdComponentInserter)initWithConditionEngine:(id)a3 advertisingSettingsFactory:(id)a4
{
  id v7;
  id v8;
  SXAdComponentInserter *v9;
  SXAdComponentInserter *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXAdComponentInserter;
  v9 = -[SXAdComponentInserter init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_conditionEngine, a3);
    objc_storeStrong((id *)&v10->_advertisingSettingsFactory, a4);
  }

  return v10;
}

- (unint64_t)componentTraits
{
  return 16;
}

- (id)conditionsForDOMObjectProvider:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  SXTraitDistanceComponentInsertionCondition *v11;
  SXTraitDistanceComponentInsertionCondition *v12;
  SXParentContentDisplayCondition *v13;

  v4 = (void *)MEMORY[0x24BDBCEB8];
  v5 = a3;
  objc_msgSend(v4, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SXAdComponentInserter advertisingSettingsFactory](self, "advertisingSettingsFactory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createAdvertisingSettingsWithDOMObjectProvider:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "distanceFromMedia");
  if (v10)
  {
    v11 = -[SXTraitDistanceComponentInsertionCondition initWithTrait:otherTrait:distance:]([SXTraitDistanceComponentInsertionCondition alloc], "initWithTrait:otherTrait:distance:", 42, 16, v9, v10);
    objc_msgSend(v6, "addObject:", v11);

  }
  v12 = -[SXTraitDistanceComponentInsertionCondition initWithTrait:otherTrait:distance:]([SXTraitDistanceComponentInsertionCondition alloc], "initWithTrait:otherTrait:distance:", 16, 16, 0x4059000000000000, 2);
  objc_msgSend(v6, "addObject:", v12);
  v13 = objc_alloc_init(SXParentContentDisplayCondition);
  objc_msgSend(v6, "addObject:", v13);

  return v6;
}

- (BOOL)validateMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  BOOL v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SXAdComponentInserter advertisingSettingsFactory](self, "advertisingSettingsFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createAdvertisingSettingsWithDOMObjectProvider:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12
    || !objc_msgSend(v12, "frequency")
    || objc_msgSend(v12, "frequency") == 1 && -[SXAdComponentInserter insertedCount](self, "insertedCount") > 0)
  {
    goto LABEL_17;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v8, "path", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v16)
          objc_enumerationMutation(v13);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "allowAutoplacedAds"))
        {

          goto LABEL_17;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v15)
        continue;
      break;
    }
  }

  if (-[SXAdComponentInserter insertedCount](self, "insertedCount") < 1)
    goto LABEL_15;
  objc_msgSend(v10, "documentSize");
  v19 = v18;
  -[SXAdComponentInserter lastInsertedYOffset](self, "lastInsertedYOffset");
  v21 = v19 - v20;
  objc_msgSend(v10, "viewportSize");
  v23 = v21 / (v21 / v22 * ((double)(unint64_t)objc_msgSend(v12, "frequency") / 10.0));
  objc_msgSend(v8, "approximateLocation");
  v25 = v24;
  -[SXAdComponentInserter lastInsertedYOffset](self, "lastInsertedYOffset");
  if (v25 >= v26 + v23)
LABEL_15:
    v27 = 1;
  else
LABEL_17:
    v27 = 0;

  return v27;
}

- (id)componentInsertForMarker:(id)a3 DOMObjectProvider:(id)a4 layoutProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  SXInsertedAdComponent *v13;
  SXInsertComponentLayout *v14;
  void *v15;
  void *v16;
  SXInsertComponentLayout *v17;
  void *v18;
  void *v19;
  double v20;
  SXComponentInsert *v21;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  -[SXAdComponentInserter advertisingSettingsFactory](self, "advertisingSettingsFactory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "createAdvertisingSettingsWithDOMObjectProvider:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[SXInsertedAdComponent initWithAdType:]([SXInsertedAdComponent alloc], "initWithAdType:", -[SXAdComponentInserter adTypeFromBannerType:](self, "adTypeFromBannerType:", objc_msgSend(v12, "bannerType")));
  v14 = [SXInsertComponentLayout alloc];
  objc_msgSend(v9, "columnLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "documentLayout");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[SXInsertComponentLayout initWithColumnRange:](v14, "initWithColumnRange:", 0, objc_msgSend(v16, "columns"));

  -[SXInsertComponentLayout setIgnoreDocumentMargin:](v17, "setIgnoreDocumentMargin:", 3);
  objc_msgSend(v12, "layout");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "margin");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(v9, "suggestedMarginForMarker:", v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SXInsertComponentLayout setMargin:](v17, "setMargin:", v19);
  objc_msgSend(v8, "approximateLocation");
  -[SXAdComponentInserter setLastInsertedYOffset:](self, "setLastInsertedYOffset:", v20);
  -[SXAdComponentInserter setInsertedCount:](self, "setInsertedCount:", -[SXAdComponentInserter insertedCount](self, "insertedCount") + 1);
  v21 = -[SXComponentInsert initWithComponent:componentLayout:]([SXComponentInsert alloc], "initWithComponent:componentLayout:", v13, v17);

  return v21;
}

- (id)cacheValidatorForCache:(id)a3 DOMObjectProvider:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  -[SXAdComponentInserter advertisingSettingsFactory](self, "advertisingSettingsFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createAdvertisingSettingsWithDOMObjectProvider:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__SXAdComponentInserter_cacheValidatorForCache_DOMObjectProvider___block_invoke;
  v11[3] = &unk_24D6899D8;
  v11[4] = self;
  v12 = v7;
  v8 = v7;
  +[SXBlockComponentInsertionCacheValidator validatorWithBlock:](SXBlockComponentInsertionCacheValidator, "validatorWithBlock:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __66__SXAdComponentInserter_cacheValidatorForCache_DOMObjectProvider___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "advertisingSettingsFactory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "createAdvertisingSettingsWithDOMObjectProvider:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(*(id *)(a1 + 40), "isEqual:", v7);
  return v8;
}

- (void)componentInsertionCompleted
{
  -[SXAdComponentInserter setLastInsertedYOffset:](self, "setLastInsertedYOffset:", 0.0);
  -[SXAdComponentInserter setInsertedCount:](self, "setInsertedCount:", 0);
}

- (unint64_t)adTypeFromBannerType:(unint64_t)a3
{
  if (a3 - 2 >= 3)
    return 1;
  else
    return a3 + 2;
}

- (SXComponentInsertionConditionEngine)conditionEngine
{
  return self->_conditionEngine;
}

- (SXAdvertisingSettingsFactory)advertisingSettingsFactory
{
  return self->_advertisingSettingsFactory;
}

- (int64_t)insertedCount
{
  return self->_insertedCount;
}

- (void)setInsertedCount:(int64_t)a3
{
  self->_insertedCount = a3;
}

- (double)lastInsertedYOffset
{
  return self->_lastInsertedYOffset;
}

- (void)setLastInsertedYOffset:(double)a3
{
  self->_lastInsertedYOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertisingSettingsFactory, 0);
  objc_storeStrong((id *)&self->_conditionEngine, 0);
}

@end
