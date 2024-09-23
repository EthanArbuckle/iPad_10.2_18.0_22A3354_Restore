@implementation PGFoodieMemoryTitleGenerator

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 cityNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  PGFoodieMemoryTitleGenerator *v10;
  PGFoodieMemoryTitleGenerator *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_cityNode, a4);
    v11->_type = 1;
  }

  return v11;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 businessNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  PGFoodieMemoryTitleGenerator *v10;
  PGFoodieMemoryTitleGenerator *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_businessNode, a4);
    v11->_type = 2;
  }

  return v11;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 personNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  PGFoodieMemoryTitleGenerator *v10;
  PGFoodieMemoryTitleGenerator *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_personNode, a4);
    v11->_type = 3;
  }

  return v11;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 addressNode:(id)a4 titleGenerationContext:(id)a5
{
  id v9;
  PGFoodieMemoryTitleGenerator *v10;
  PGFoodieMemoryTitleGenerator *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v10 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v13, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_addressNode, a4);
    v11->_type = 4;
  }

  return v11;
}

- (PGFoodieMemoryTitleGenerator)initWithMomentNodes:(id)a3 tripLocationNode:(id)a4 tripTitleLocationType:(unint64_t)a5 titleGenerationContext:(id)a6
{
  id v11;
  PGFoodieMemoryTitleGenerator *v12;
  PGFoodieMemoryTitleGenerator *v13;
  objc_super v15;

  v11 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PGFoodieMemoryTitleGenerator;
  v12 = -[PGTitleGenerator initWithMomentNodes:type:titleGenerationContext:](&v15, sel_initWithMomentNodes_type_titleGenerationContext_, a3, 0, a6);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_tripLocationNode, a4);
    v13->_tripTitleLocationType = a5;
    v13->_type = 5;
  }

  return v13;
}

- (void)_generateTitleAndSubtitleWithResult:(id)a3
{
  id v4;
  void *v5;
  PGSpecBasedTitleGenerator *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  PGLocationTitleOptions *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  PGGraphLocationCityNode *cityNode;
  void *v21;
  void *v22;
  PGSpecBasedTitleGenerator *v23;
  void *v24;
  PGSpecBasedTitleGenerator *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PGSpecBasedTitleGenerator *v32;
  void *v33;
  uint64_t v34;
  PGGraphLocationOrArea *tripLocationNode;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  PGSpecBasedTitleGenerator *v40;
  void *v41;
  void *v42;
  PGTimeTitleOptions *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[5];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v4 = a3;
  switch(self->_type)
  {
    case 0:
      +[PGTitleSpecFactory specCollectionForFoodieMemoryWithPersonNodes:locationName:tripTitleLocationType:allowInspiredTastesTitle:genericOnly:](PGTitleSpecFactory, "specCollectionForFoodieMemoryWithPersonNodes:locationName:tripTitleLocationType:allowInspiredTastesTitle:genericOnly:", 0, 0, 0, 0, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = [PGSpecBasedTitleGenerator alloc];
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PGSpecBasedTitleGenerator initWithMomentNodes:specCollection:titleGenerationContext:](v6, "initWithMomentNodes:specCollection:titleGenerationContext:", v7, v5, v8);
      goto LABEL_12;
    case 1:
      -[PGGraphNamedLocationNode name](self->_cityNode, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "length");

      if (!v19)
        goto LABEL_8;
      cityNode = self->_cityNode;
      -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "locationHelper");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", cityNode, v22);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      +[PGTitleSpecFactory specCollectionForFoodieMemoryWithPersonNodes:locationName:tripTitleLocationType:allowInspiredTastesTitle:genericOnly:](PGTitleSpecFactory, "specCollectionForFoodieMemoryWithPersonNodes:locationName:tripTitleLocationType:allowInspiredTastesTitle:genericOnly:", 0, v5, 0, 0, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = [PGSpecBasedTitleGenerator alloc];
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PGSpecBasedTitleGenerator initWithMomentNodes:specCollection:titleGenerationContext:](v23, "initWithMomentNodes:specCollection:titleGenerationContext:", v8, v7, v24);

LABEL_13:
      v26 = 0;
      if (!v25)
        goto LABEL_26;
      goto LABEL_21;
    case 2:
      v12 = objc_alloc_init(PGLocationTitleOptions);
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGLocationTitleOptions setMomentNodes:](v12, "setMomentNodes:", v27);

      v48 = 0;
      v49 = &v48;
      v50 = 0x3032000000;
      v51 = __Block_byref_object_copy__63887;
      v52 = __Block_byref_object_dispose__63888;
      v53 = 0;
      v47[0] = MEMORY[0x1E0C809B0];
      v47[1] = 3221225472;
      v47[2] = __68__PGFoodieMemoryTitleGenerator__generateTitleAndSubtitleWithResult___block_invoke;
      v47[3] = &unk_1E8434DC0;
      v47[4] = &v48;
      +[PGLocationTitleUtility generateBusinessItemLocationWithOptions:result:](PGLocationTitleUtility, "generateBusinessItemLocationWithOptions:result:", v12, v47);
      if (v49[5])
      {
        v28 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleWithBusinessName %@"), CFSTR("PGFoodieMemoryTitleWithBusinessName %@"), CFSTR("Localizable"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "localizedStringWithFormat:", v30, v49[5]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v31, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }
      _Block_object_dispose(&v48, 8);

      goto LABEL_25;
    case 3:
      v32 = [PGSpecBasedTitleGenerator alloc];
      -[PGTitleGenerator momentNodes](self, "momentNodes");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_personNode);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[PGSpecBasedTitleGenerator initWithMomentNodes:personNodes:memoryCategory:subcategory:titleGenerationContext:](v32, "initWithMomentNodes:personNodes:memoryCategory:subcategory:titleGenerationContext:", v5, v7, 301, 218, v8);
LABEL_12:
      v25 = (PGSpecBasedTitleGenerator *)v9;
      goto LABEL_13;
    case 4:
      -[PGGraphAddressNode collection](self->_addressNode, "collection");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "homeNodes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "ownerNodes");
      v12 = (PGLocationTitleOptions *)objc_claimAutoreleasedReturnValue();

      -[MANode graph](self->_addressNode, "graph");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[PGLocationTitleOptions intersectsCollection:](v12, "intersectsCollection:", v14)
        && (objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class()),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PGFoodieMemoryTitleForHome"), CFSTR("PGFoodieMemoryTitleForHome"), CFSTR("Localizable")), v16 = (void *)objc_claimAutoreleasedReturnValue(), v15, v16))
      {
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v16, 4);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = 0;
      }

LABEL_25:
      v26 = 0;
      v25 = 0;
      if (!v17)
        goto LABEL_26;
      goto LABEL_29;
    case 5:
      -[PGGraphLocationOrArea name](self->_tripLocationNode, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "length");

      if (v34)
      {
        tripLocationNode = self->_tripLocationNode;
        -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "locationHelper");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        +[PGLocationTitleUtility beautifiedLocationNodeStringWithPlaceNode:locationHelper:](PGLocationTitleUtility, "beautifiedLocationNodeStringWithPlaceNode:locationHelper:", tripLocationNode, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();

        +[PGTitleSpecFactory specCollectionForFoodieMemoryWithPersonNodes:locationName:tripTitleLocationType:allowInspiredTastesTitle:genericOnly:](PGTitleSpecFactory, "specCollectionForFoodieMemoryWithPersonNodes:locationName:tripTitleLocationType:allowInspiredTastesTitle:genericOnly:", 0, v38, self->_tripTitleLocationType, 1, 0);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = [PGSpecBasedTitleGenerator alloc];
        -[PGTitleGenerator momentNodes](self, "momentNodes");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGTitleGenerator titleGenerationContext](self, "titleGenerationContext");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = -[PGSpecBasedTitleGenerator initWithMomentNodes:specCollection:titleGenerationContext:](v40, "initWithMomentNodes:specCollection:titleGenerationContext:", v41, v39, v42);

      }
      else
      {
        v25 = 0;
      }
      -[PGFoodieMemoryTitleGenerator _timeTitleForTripAndWeekend](self, "_timeTitleForTripAndWeekend");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v25)
        goto LABEL_26;
LABEL_21:
      -[PGSpecBasedTitleGenerator title](v25, "title");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v26)
        goto LABEL_29;
      goto LABEL_30;
    default:
LABEL_8:
      v26 = 0;
LABEL_26:
      if (v4)
      {
        (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, 0, 0);
      }
      else
      {
        v25 = 0;
        v17 = 0;
        if (!v26)
        {
LABEL_29:
          v43 = objc_alloc_init(PGTimeTitleOptions);
          -[PGTitleGenerator momentNodes](self, "momentNodes");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGTimeTitleOptions setMomentNodes:](v43, "setMomentNodes:", v44);

          -[PGTitleGenerator featuredYearNodes](self, "featuredYearNodes");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGTimeTitleOptions setFeaturedYearNodes:](v43, "setFeaturedYearNodes:", v45);

          -[PGTimeTitleOptions setAllowedFormats:](v43, "setAllowedFormats:", 20);
          +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v43);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

        }
LABEL_30:
        +[PGTitle titleWithString:category:](PGTitle, "titleWithString:category:", v26, 5);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4)
          (*((void (**)(id, void *, void *))v4 + 2))(v4, v17, v46);

      }
      return;
  }
}

- (id)_timeTitleForTripAndWeekend
{
  PGTimeTitleOptions *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = objc_alloc_init(PGTimeTitleOptions);
  -[PGTitleGenerator momentNodes](self, "momentNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setMomentNodes:](v3, "setMomentNodes:", v4);

  -[PGTitleGenerator locale](self, "locale");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGTimeTitleOptions setLocale:](v3, "setLocale:", v5);

  +[PGTimeTitleUtility timeTitleWithOptions:](PGTimeTitleUtility, "timeTitleWithOptions:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFoodieMemoryTitleGenerator _typeString](self, "_typeString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v12 = v6;
LABEL_6:
    v11 = v12;
    goto LABEL_7;
  }
  if (!objc_msgSend(v6, "length"))
  {
    v12 = v7;
    goto LABEL_6;
  }
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PGTripMemorySubtitleFormatWithLocalizedDate %@"), CFSTR("PGTripMemorySubtitleFormatWithLocalizedDate %@"), CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_7:
  v13 = v11;

  return v13;
}

- (id)_typeString
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("PGTripMemoryTypeStringTrip"), CFSTR("PGTripMemoryTypeStringTrip"), CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripLocationNode, 0);
  objc_storeStrong((id *)&self->_addressNode, 0);
  objc_storeStrong((id *)&self->_personNode, 0);
  objc_storeStrong((id *)&self->_businessNode, 0);
  objc_storeStrong((id *)&self->_cityNode, 0);
}

void __68__PGFoodieMemoryTitleGenerator__generateTitleAndSubtitleWithResult___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

@end
