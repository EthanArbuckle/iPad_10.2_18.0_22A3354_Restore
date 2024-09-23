@implementation PKPayLaterProductOptionsSectionController

- (PKPayLaterProductOptionsSectionController)initWithSetupFlowController:(id)a3 dynamicContentPage:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PKPayLaterProductOptionsSectionController *v14;
  NSNumberFormatter *v15;
  NSNumberFormatter *numberFormatter;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  v11 = a4;
  objc_msgSend(v9, "financingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "payLaterAccount");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)PKPayLaterProductOptionsSectionController;
  v14 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v18, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, v13, v11, v10);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_setupController, a3);
    objc_storeWeak((id *)&v14->_delegate, v10);
    v15 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v14->_numberFormatter;
    v14->_numberFormatter = v15;

    v14->_showAllOptions = 0;
  }

  return v14;
}

- (void)configureCellForRegistration:(id)a3 item:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_super v9;

  v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPayLaterProductOptionsSectionController;
  v7 = a4;
  -[PKPayLaterSectionController configureCellForRegistration:item:](&v9, sel_configureCellForRegistration_item_, v6, v7);
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass();

  if ((self & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC34D8], "clearConfiguration", v9.receiver, v9.super_class);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackgroundConfiguration:", v8);

  }
  else
  {
    PKPayLaterConfigureCollectionViewCellWithGreyBackgroundForCell(v6);
  }

}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterProductOptionsSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v12, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (__CFString *)v6;
  v9 = v8;
  if (v8 == CFSTR("kShowMoreOptionsButtonSection")
    || v8
    && (v10 = -[__CFString isEqualToString:](v8, "isEqualToString:", CFSTR("kShowMoreOptionsButtonSection")),
        v9,
        v10))
  {
    objc_msgSend(v7, "contentInsets");
    objc_msgSend(v7, "setContentInsets:", 0.0);
  }

  return v7;
}

- (id)identifiers
{
  int64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void (**v13)(_QWORD);
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSDictionary *formattedIdentifiersByProductType;
  uint64_t v23;
  NSArray *sortedProductTypeSections;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  double v30;
  unint64_t v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  id v37;
  PKPayLaterProductOptionsSectionController *v38;
  unint64_t v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[5];
  _QWORD aBlock[5];
  id v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v3 = -[PKPayLaterSetupFlowController controllerContext](self->_setupController, "controllerContext");
  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assessmentCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PKPayLaterSetupFlowController selectedProductType](self->_setupController, "selectedProductType");
  if (v6 <= 1)
    v7 = 1;
  else
    v7 = v6;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v10 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke;
  aBlock[3] = &unk_1E3E6DDB0;
  v38 = self;
  aBlock[4] = self;
  v11 = v9;
  v47 = v11;
  v12 = v8;
  v48 = v12;
  v13 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_msgSend(v5, "productAssessmentForProductType:", v7);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2](v13);
  v36 = v5;
  objc_msgSend(v5, "eligibleProductAssessments");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v10;
  v45[1] = 3221225472;
  v45[2] = __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke_2;
  v45[3] = &__block_descriptor_40_e44_B32__0__PKPayLaterProductAssessment_8Q16_B24l;
  v45[4] = v7;
  objc_msgSend(v14, "pk_objectsPassingTest:", v45);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v42 != v19)
          objc_enumerationMutation(v16);
        ((void (*)(void (**)(_QWORD), _QWORD))v13[2])(v13, *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v41, v49, 16);
    }
    while (v18);
  }

  v21 = objc_msgSend(v11, "copy");
  formattedIdentifiersByProductType = v38->_formattedIdentifiersByProductType;
  v38->_formattedIdentifiersByProductType = (NSDictionary *)v21;

  v23 = objc_msgSend(v12, "copy");
  sortedProductTypeSections = v38->_sortedProductTypeSections;
  v38->_sortedProductTypeSections = (NSArray *)v23;

  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v12, "count"))
  {
    v25 = 0;
    v39 = v3 - 1;
    v37 = v12;
    do
    {
      objc_msgSend(v12, "objectAtIndexedSubscript:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKey:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v27;
      if (v25 || v39 < 3)
      {
        objc_msgSend(v40, "addObjectsFromArray:", v27);
      }
      else
      {
        v29 = objc_msgSend(v27, "count");
        v30 = fmin((double)v29, 3.0);
        if (v38->_showAllOptions)
          v31 = v29;
        else
          v31 = (uint64_t)v30;
        objc_msgSend(v28, "subarrayWithRange:", 0, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "addObjectsFromArray:", v32);

        v12 = v37;
        if (!v38->_showAllOptions && objc_msgSend(v28, "count") > v31)
          objc_msgSend(v40, "addObject:", CFSTR("kShowMoreOptionsButtonSection"));
      }

      ++v25;
    }
    while (v25 < objc_msgSend(v12, "count"));
  }
  v33 = (void *)objc_msgSend(v40, "copy");

  return v33;
}

void __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke(id *a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a2;
  v3 = objc_msgSend(v13, "isEligible");
  v4 = v13;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v13, "productType"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_msgSend(a1[4], "_productAssessmentInstallmentCount:", v13);
    if (v7 >= 1)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(v5, "integerValue");
        PKPayLaterAccountProductTypeToString();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%ld"), v11, i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

      }
    }
    if (objc_msgSend(v6, "count"))
      objc_msgSend(a1[5], "setObject:forKey:", v6, v5);
    objc_msgSend(a1[6], "addObject:", v5);

    v4 = v13;
  }

}

BOOL __56__PKPayLaterProductOptionsSectionController_identifiers__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "productType") != *(_QWORD *)(a1 + 32);
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_sortedProductTypeSections, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_sortedProductTypeSections, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_formattedIdentifiersByProductType, "objectForKey:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  if (-[NSArray count](self->_sortedProductTypeSections, "count") < 2)
  {
    v10 = 0;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_sortedProductTypeSections, "objectAtIndexedSubscript:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKey:](self->_formattedIdentifiersByProductType, "objectForKey:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count"))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  v11 = v4;
  v12 = v7;
  v13 = v12;
  if (v12 == v11)
  {

    goto LABEL_19;
  }
  if (v11 && v12)
  {
    v14 = objc_msgSend(v11, "isEqualToString:", v12);

    if (!v14)
      goto LABEL_21;
LABEL_19:
    -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = 1;
    goto LABEL_28;
  }

LABEL_21:
  v18 = v11;
  v19 = v10;
  if (v19 == v18)
  {

  }
  else
  {
    v20 = v19;
    if (!v11 || !v19)
    {

      goto LABEL_31;
    }
    v21 = objc_msgSend(v18, "isEqualToString:", v19);

    if (!v21)
      goto LABEL_31;
  }
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  v17 = 3;
LABEL_28:
  objc_msgSend(v15, "productSectionForType:", v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "contentTitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v23)
  {
LABEL_31:
    v29 = 0;
    goto LABEL_32;
  }
  v24 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(v23, "uppercaseString");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4AB8], (void *)*MEMORY[0x1E0DC4918], 0, 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v26;
  v31[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v32[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (void *)objc_msgSend(v24, "initWithString:attributes:", v25, v28);

LABEL_32:
  return v29;
}

- (id)footerContentForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v4 = a3;
  -[PKPayLaterProductOptionsSectionController identifiers](self, "identifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v4;
  v8 = v6;
  if (v8 == v7)
  {

    goto LABEL_7;
  }
  v9 = v8;
  if (!v7 || !v8)
  {

    goto LABEL_9;
  }
  v10 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v10 & 1) != 0)
  {
LABEL_7:
    -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "footerContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
LABEL_9:
  v24 = 0x7FFFFFFFFFFFFFFFLL;
  -[PKPayLaterProductOptionsSectionController _productAssessmentForSectionIdentifier:outIndex:](self, "_productAssessmentForSectionIdentifier:outIndex:", v7, &v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v13;
  v14 = v24;
  if (v24 < 0
    || (objc_msgSend(v13, "financingOptions"),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        v16 = objc_msgSend(v15, "count"),
        v15,
        v14 >= v16))
  {
    v18 = 0;
  }
  else
  {
    objc_msgSend(v11, "financingOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v11, "productType");
  objc_msgSend(v18, "identifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "dynamicContentPageForProductType:optionIdentifier:", v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "footerContent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v12;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  if (objc_msgSend(v5, "hasPrefix:", CFSTR("kShowMoreOptionsButtonSection")))
    -[PKPayLaterProductOptionsSectionController _configureShowMoreOptionsButtonSectionWithSnapshot:](self, "_configureShowMoreOptionsButtonSectionWithSnapshot:", v6);
  else
    -[PKPayLaterProductOptionsSectionController _configureProductSectionWithSectionIdentifier:snapshot:](self, "_configureProductSectionWithSectionIdentifier:snapshot:", v5, v6);

  return v6;
}

- (void)_configureProductSectionWithSectionIdentifier:(id)a3 snapshot:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99DE8];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  -[PKPayLaterProductOptionsSectionController _productAssessmentForSectionIdentifier:outIndex:](self, "_productAssessmentForSectionIdentifier:outIndex:", v8, &v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKPayLaterProductOptionsSectionController _productTileDetailRowForProductAssessment:installmentIndex:](self, "_productTileDetailRowForProductAssessment:installmentIndex:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safelyAddObject:", v11);
  if (objc_msgSend(v9, "count"))
  {
    v12 = (void *)objc_msgSend(v9, "copy");
    objc_msgSend(v6, "appendItems:", v12);

  }
}

- (void)_configureShowMoreOptionsButtonSectionWithSnapshot:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PKPayLaterButtonRow *v17;
  PKPayLaterButtonRow *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "productSectionForType:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "linkText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    PKLocalizedCocoonString(CFSTR("SHOW_MORE_OPTIONS"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  objc_msgSend(v7, "systemImageName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "configurationWithHierarchicalColor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v12, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  objc_initWeak(&location, self);
  v17 = [PKPayLaterButtonRow alloc];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__PKPayLaterProductOptionsSectionController__configureShowMoreOptionsButtonSectionWithSnapshot___block_invoke;
  v20[3] = &unk_1E3E61B68;
  objc_copyWeak(&v21, &location);
  v20[4] = self;
  v18 = -[PKPayLaterButtonRow initWithTitle:selectionHandler:](v17, "initWithTitle:selectionHandler:", v11, v20);
  -[PKPayLaterButtonRow setImage:](v18, "setImage:", v16);
  objc_msgSend(v5, "addObject:", v18);
  v19 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v19);

  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);

}

void __96__PKPayLaterProductOptionsSectionController__configureShowMoreOptionsButtonSectionWithSnapshot___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[120] = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 120) ^ 1;
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D68858];
    v8[0] = *MEMORY[0x1E0D68C10];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportAnalyticsEvent:", v5);

    objc_msgSend(v3, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadDataAnimated:", 1);

  }
}

- (id)_productTileDetailRowForProductAssessment:(id)a3 installmentIndex:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  PKPayLaterScheduleView *v27;
  void *v28;
  PKPayLaterScheduleView *v29;
  void *v31;
  void *v32;
  PKPayLaterProductOptionsSectionController *v33;
  void *v34;

  v6 = a3;
  objc_msgSend(v6, "preliminaryAssessment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "financingOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (!v9)
  {
    v19 = 0;
    if (a4 < 0 || !v7)
      goto LABEL_17;
    objc_msgSend(v7, "installmentPlans");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 > a4)
    {
      v33 = self;
      -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dynamicContentPageForProductType:optionIdentifier:", objc_msgSend(v6, "productType"), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "contentItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0;
      goto LABEL_9;
    }
LABEL_12:
    v19 = 0;
    goto LABEL_17;
  }
  if (a4 < 0)
    goto LABEL_12;
  objc_msgSend(v6, "financingOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v11 <= a4)
    goto LABEL_12;
  objc_msgSend(v6, "financingOptions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", a4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = self;
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "productType");
  v34 = v13;
  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dynamicContentPageForProductType:optionIdentifier:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  objc_msgSend(v18, "contentTitle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentSubtitle");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentDetailLeading");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentDetailTrailing");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "contentDetailSubtitleLeading");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (+[PKPayLaterScheduleView canFormScheduleViewForDynamincContentItem:](PKPayLaterScheduleView, "canFormScheduleViewForDynamincContentItem:", v18))
    {
      v27 = -[PKPayLaterScheduleView initWithDynamicContentItem:]([PKPayLaterScheduleView alloc], "initWithDynamicContentItem:", v18);
    }
    else
    {
      v27 = 0;
    }
    v28 = v34;
    v31 = v7;
    v32 = v7;
    v29 = v27;
    -[PKPayLaterProductOptionsSectionController _tileDetailRowWithTitle:subtitle:text:detailText:textSubtitle:customView:financingOption:preliminaryAssessment:](v33, "_tileDetailRowWithTitle:subtitle:text:detailText:textSubtitle:customView:financingOption:preliminaryAssessment:", v22, v23, v24, v25, v26, v27, v34, v31);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v32;
  }
  else
  {
    v19 = 0;
    v28 = v34;
  }

LABEL_17:
  return v19;
}

- (id)_tileDetailRowWithTitle:(id)a3 subtitle:(id)a4 text:(id)a5 detailText:(id)a6 textSubtitle:(id)a7 customView:(id)a8 financingOption:(id)a9 preliminaryAssessment:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  PKPayLaterTileDetailRow *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD aBlock[4];
  id v38;
  id v39;
  id v40;
  id location;

  v36 = a3;
  v35 = a4;
  v34 = a5;
  v16 = a6;
  v17 = a7;
  v33 = a8;
  v18 = a9;
  v19 = a10;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __156__PKPayLaterProductOptionsSectionController__tileDetailRowWithTitle_subtitle_text_detailText_textSubtitle_customView_financingOption_preliminaryAssessment___block_invoke;
  aBlock[3] = &unk_1E3E61EE8;
  objc_copyWeak(&v40, &location);
  v20 = v18;
  v38 = v20;
  v21 = v19;
  v39 = v21;
  v22 = _Block_copy(aBlock);
  -[PKPayLaterSectionController dynamicContentPage](self, "dynamicContentPage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "pageType");

  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "assessmentCollection");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v26, "eligibleProductAssessments");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v24 == 11 || v24 == 6 && v28 == 1)
  {
    v29 = v17;
    v30 = v16;

    v22 = 0;
  }
  else
  {
    v29 = v17;
    v30 = v16;
  }
  v31 = -[PKPayLaterTileDetailRow initWithTitleText:subtitleText:text:detailText:textSubtitle:customView:selectionHandler:]([PKPayLaterTileDetailRow alloc], "initWithTitleText:subtitleText:text:detailText:textSubtitle:customView:selectionHandler:", v36, v35, v34, v30, v29, v33, v22);

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v31;
}

void __156__PKPayLaterProductOptionsSectionController__tileDetailRowWithTitle_subtitle_text_detailText_textSubtitle_customView_financingOption_preliminaryAssessment___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      v4 = WeakRetained;
      v3 = objc_loadWeakRetained(WeakRetained + 13);
      objc_msgSend(v3, "productOptionsSectionController:didSelectFinancingOption:", v4, *(_QWORD *)(a1 + 32));
LABEL_6:

      WeakRetained = v4;
      goto LABEL_7;
    }
    if (*(_QWORD *)(a1 + 40))
    {
      v4 = WeakRetained;
      v3 = objc_loadWeakRetained(WeakRetained + 13);
      objc_msgSend(v3, "productOptionsSectionController:didSelectPreliminaryAssessment:", v4, *(_QWORD *)(a1 + 40));
      goto LABEL_6;
    }
  }
LABEL_7:

}

- (int64_t)_productAssessmentInstallmentCount:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  int64_t v7;
  void *v9;
  void *v10;
  int64_t v11;

  v3 = a3;
  objc_msgSend(v3, "financingOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v3, "financingOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v6, "count");
    return v7;
  }
  else
  {
    objc_msgSend(v3, "preliminaryAssessment");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "installmentPlans");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count") != 0;

    return v11;
  }
}

- (id)_productAssessmentForSectionIdentifier:(id)a3 outIndex:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  void *v12;

  v6 = a3;
  -[PKPayLaterSetupFlowController financingController](self->_setupController, "financingController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assessmentCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  PKPayLaterAccountProductTypeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hasPrefix:", v9))
  {
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v9, &stru_1E3E7D690);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "integerValue");

    objc_msgSend(v8, "productAssessmentForProductType:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v12 = 0;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  if (a4)
LABEL_5:
    *a4 = v11;
LABEL_6:

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_formattedIdentifiersByProductType, 0);
  objc_storeStrong((id *)&self->_sortedProductTypeSections, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_setupController, 0);
}

@end
