@implementation PKPassEntitlementCapabilitySectionController

- (PKPassEntitlementCapabilitySectionController)init
{

  return 0;
}

- (PKPassEntitlementCapabilitySectionController)initWithMode:(unint64_t)a3 entitlementComposer:(id)a4 composerView:(id)a5 isDisabled:(BOOL)a6 delegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  PKPassEntitlementCapabilitySectionController *v16;
  PKPassEntitlementCapabilitySectionController *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *, uint64_t, void *);
  void *v25;
  id v26;
  id location;
  objc_super v28;

  v13 = a4;
  v14 = a5;
  v15 = a7;
  v28.receiver = self;
  v28.super_class = (Class)PKPassEntitlementCapabilitySectionController;
  v16 = -[PKPassShareSectionController initWithIdentifiers:](&v28, sel_initWithIdentifiers_, MEMORY[0x1E0C9AA60]);
  v17 = v16;
  if (v16)
  {
    v16->_mode = a3;
    objc_storeStrong((id *)&v16->_entitlementComposer, a4);
    objc_storeStrong((id *)&v17->_composerView, a5);
    v17->_isDisabled = a6;
    objc_storeWeak((id *)&v17->_delegate, v15);
    -[PKPassEntitlementCapabilitySectionController _buildRowItemsWithNotify:](v17, "_buildRowItemsWithNotify:", 0);
    objc_initWeak(&location, v17);
    v18 = (void *)MEMORY[0x1E0DC35C8];
    v19 = objc_opt_class();
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __114__PKPassEntitlementCapabilitySectionController_initWithMode_entitlementComposer_composerView_isDisabled_delegate___block_invoke;
    v25 = &unk_1E3E62748;
    objc_copyWeak(&v26, &location);
    objc_msgSend(v18, "registrationWithCellClass:configurationHandler:", v19, &v22);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaymentSetupListSectionController setCellRegistration:](v17, "setCellRegistration:", v20, v22, v23, v24, v25);

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v17;
}

void __114__PKPassEntitlementCapabilitySectionController_initWithMode_entitlementComposer_composerView_isDisabled_delegate___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a2;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = (id)objc_msgSend(WeakRetained, "decorateListCell:forRowItem:", v9, v6);

  }
}

- (void)_buildRowItemsWithNotify:(BOOL)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _BOOL8 v13;
  id v14;
  void *v15;
  void *v16;
  PKShareCapabilityRowItem *v17;
  void *v18;
  PKShareCapabilityRowItem *v19;
  void *v20;
  int v21;
  PKPassEntitlementCapabilitySectionController *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  void *v32;
  PKShareCapabilityRowItem *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t k;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  void *v46;
  PKShareCapabilityRowItem *v47;
  void *v48;
  _BOOL8 v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t m;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  uint64_t v59;
  void *v60;
  PKShareCapabilityRowItem *v61;
  void *v62;
  _BOOL8 v63;
  void *v64;
  void *v65;
  unint64_t v66;
  unint64_t v67;
  void *v68;
  int v69;
  _BOOL4 v70;
  uint64_t v71;
  PKShareCapabilityRowItem *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  NSDictionary *rowItemsForSection;
  void *v82;
  id WeakRetained;
  void *v84;
  _BOOL4 v85;
  void *v86;
  id v87;
  id obj;
  id obja;
  id objb;
  id v91;
  id v92;
  uint64_t v93;
  id v94;
  id v95;
  PKPassEntitlementCapabilitySectionController *v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v85 = a3;
  v118 = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = -[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable");
  v6 = -[PKPassEntitlementsComposerView shareability](self->_composerView, "shareability");
  v93 = -[PKPassEntitlementsComposerView visibility](self->_composerView, "visibility");
  v91 = (id)-[PKPassEntitlementsComposerView manageability](self->_composerView, "manageability");
  v96 = self;
  -[PKPassEntitlementsComposerView allPossibleCapabilitySets](self->_composerView, "allPossibleCapabilitySets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v84 = v7;
  if (PKSharingUsePredefinedCapabilitySets() && objc_msgSend(v7, "count"))
  {
    v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v110 = 0u;
    v111 = 0u;
    v112 = 0u;
    v113 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v111;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v111 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v110 + 1) + 8 * i);
          v13 = v6 == objc_msgSend(v12, "shareability")
             && v93 == objc_msgSend(v12, "visibility")
             && v91 == (id)objc_msgSend(v12, "manageability");
          if (v13 | v5)
          {
            v14 = objc_alloc(MEMORY[0x1E0CB3940]);
            objc_msgSend(v12, "localizedName");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR("%@-%@"), CFSTR("CapabilitySetSectionIdentifier"), v15);

            v17 = -[PKSharePreviewRowItem initWithIdentifier:]([PKShareCapabilityRowItem alloc], "initWithIdentifier:", v16);
            -[PKShareCapabilityRowItem setSectionIdentifier:](v17, "setSectionIdentifier:", CFSTR("CapabilitySetSectionIdentifier"));
            -[PKShareCapabilityRowItem setCapabilitySet:](v17, "setCapabilitySet:", v12);
            objc_msgSend(v12, "localizedName");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            -[PKSharePreviewRowItem setTitle:](v17, "setTitle:", v18);

            -[PKSharePreviewRowItem setDisplayCheckmark:](v17, "setDisplayCheckmark:", v13);
            -[PKSharePreviewRowItem setEnabled:](v17, "setEnabled:", !v96->_isDisabled);
            -[PKSharePreviewRowItem setAccessoryEnabled:](v17, "setAccessoryEnabled:", v5);
            objc_msgSend(v94, "addObject:", v17);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v110, v117, 16);
      }
      while (v9);
    }

    objc_msgSend(v4, "addObject:", CFSTR("CapabilitySetSectionIdentifier"));
    v19 = (PKShareCapabilityRowItem *)objc_msgSend(v94, "copy");
    v20 = v87;
    objc_msgSend(v87, "setObject:forKeyedSubscript:", v19, CFSTR("CapabilitySetSectionIdentifier"));
    goto LABEL_86;
  }
  v21 = PKSharingAllowAdvancedCapabilitySelection();
  v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v21)
  {
    v65 = v4;
    -[PKPassEntitlementsComposerView shareability](self->_composerView, "shareability");
    v66 = PKSharingCapabilityShareabilityMaxDepth();
    v67 = PKSharingCapabilityShareabilityMaxDepth();
    -[PKPassEntitlementsComposerView allPossibleShareability](v96->_composerView, "allPossibleShareability");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = objc_msgSend(v68, "containsObject:", &unk_1E3FAE0B0);

    if (v69)
      v70 = -[PKPassEntitlementsComposerView possibleVisibility](v96->_composerView, "possibleVisibility") == 2;
    else
      v70 = 0;
    v71 = -[PKPassEntitlementsComposerView visibility](v96->_composerView, "visibility");
    v72 = -[PKSharePreviewRowItem initWithIdentifier:]([PKShareCapabilityRowItem alloc], "initWithIdentifier:", CFSTR("SimpleCapabilityOptionAllowSharingIdentifier"));
    -[PKShareCapabilityRowItem setSectionIdentifier:](v72, "setSectionIdentifier:", CFSTR("SimpleCapabilityOptionsSectionIdentifier"));
    PKLocalizedShareableCredentialString(CFSTR("SIMPLE_CAPABILITY_CREATION_CAN_SHARE"));
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setTitle:](v72, "setTitle:", v73);

    if (v66 >= v67)
      v74 = 1;
    else
      v74 = 2;
    -[PKSharePreviewRowItem setDisplayToggleState:](v72, "setDisplayToggleState:", v74);
    if (v69 && !v96->_isDisabled)
      v75 = 1;
    else
      v75 = v5 ^ 1;
    -[PKSharePreviewRowItem setEnabled:](v72, "setEnabled:", v75);
    -[PKSharePreviewRowItem setAccessoryEnabled:](v72, "setAccessoryEnabled:", v5);
    objc_msgSend(v94, "addObject:", v72);
    v19 = -[PKSharePreviewRowItem initWithIdentifier:]([PKShareCapabilityRowItem alloc], "initWithIdentifier:", CFSTR("SimpleCapabilityOptionCanSeeAllIdentifier"));

    -[PKShareCapabilityRowItem setSectionIdentifier:](v19, "setSectionIdentifier:", CFSTR("SimpleCapabilityOptionsSectionIdentifier"));
    PKLocalizedShareableCredentialString(CFSTR("SIMPLE_CAPABILITY_CREATION_CAN_VIEW_ALL"));
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSharePreviewRowItem setTitle:](v19, "setTitle:", v76);

    if (v71 == 2)
      v77 = 1;
    else
      v77 = 2;
    -[PKSharePreviewRowItem setDisplayToggleState:](v19, "setDisplayToggleState:", v77);
    if (v70 && !v96->_isDisabled)
      v78 = 1;
    else
      v78 = v5 ^ 1;
    -[PKSharePreviewRowItem setEnabled:](v19, "setEnabled:", v78);
    -[PKSharePreviewRowItem setAccessoryEnabled:](v19, "setAccessoryEnabled:", v5);
    objc_msgSend(v94, "addObject:", v19);
    v4 = v65;
    objc_msgSend(v65, "addObject:", CFSTR("SimpleCapabilityOptionsSectionIdentifier"));
    v79 = (void *)objc_msgSend(v94, "copy");
    v20 = v87;
    objc_msgSend(v87, "setObject:forKeyedSubscript:", v79, CFSTR("SimpleCapabilityOptionsSectionIdentifier"));

LABEL_86:
    v22 = v96;
    goto LABEL_87;
  }
  v86 = v4;
  v108 = 0u;
  v109 = 0u;
  v106 = 0u;
  v107 = 0u;
  v22 = self;
  -[PKPassEntitlementsComposerView allPossibleShareability](self->_composerView, "allPossibleShareability");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v107;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v107 != v25)
          objc_enumerationMutation(obja);
        v27 = *(void **)(*((_QWORD *)&v106 + 1) + 8 * j);
        v28 = objc_msgSend(v27, "unsignedIntegerValue");
        v29 = -[PKPassEntitlementsComposerView shareability](v22->_composerView, "shareability");
        if (v29 == v28)
          v30 = 1;
        else
          v30 = v5;
        if (v30 == 1)
        {
          if (v29 == v28)
            v31 = v5;
          else
            v31 = 0;
          v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), CFSTR("SharabilitySectionIdentifier"), v27);
          v33 = -[PKSharePreviewRowItem initWithIdentifier:]([PKShareCapabilityRowItem alloc], "initWithIdentifier:", v32);
          -[PKShareCapabilityRowItem setSectionIdentifier:](v33, "setSectionIdentifier:", CFSTR("SharabilitySectionIdentifier"));
          -[PKShareCapabilityRowItem setCapability:](v33, "setCapability:", v28);
          v105 = 0;
          PKSharingCapabilityShareabilityToLocalizedString();
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKSharePreviewRowItem setTitle:](v33, "setTitle:", v34);

          -[PKSharePreviewRowItem setSubtitle:](v33, "setSubtitle:", 0);
          v35 = v31;
          v22 = v96;
          -[PKSharePreviewRowItem setDisplayCheckmark:](v33, "setDisplayCheckmark:", v35);
          -[PKSharePreviewRowItem setEnabled:](v33, "setEnabled:", !v96->_isDisabled);
          -[PKSharePreviewRowItem setAccessoryEnabled:](v33, "setAccessoryEnabled:", v5);
          objc_msgSend(v94, "addObject:", v33);

        }
      }
      v24 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
    }
    while (v24);
  }

  objc_msgSend(v86, "addObject:", CFSTR("SharabilitySectionIdentifier"));
  v36 = (void *)objc_msgSend(v94, "copy");
  objc_msgSend(v87, "setObject:forKeyedSubscript:", v36, CFSTR("SharabilitySectionIdentifier"));

  objb = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  -[PKPassEntitlementsComposerView allPossibleVisibility](v22->_composerView, "allPossibleVisibility");
  v95 = (id)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v102;
    do
    {
      for (k = 0; k != v38; ++k)
      {
        if (*(_QWORD *)v102 != v39)
          objc_enumerationMutation(v95);
        v41 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * k);
        v42 = objc_msgSend(v41, "unsignedIntegerValue");
        v43 = -[PKPassEntitlementsComposerView visibility](v22->_composerView, "visibility");
        if (v43 == v42)
          v44 = 1;
        else
          v44 = v5;
        if (v44 == 1)
        {
          if (v43 == v42)
            v45 = v5;
          else
            v45 = 0;
          v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), CFSTR("VisibilitySectionIdentifier"), v41);
          v47 = -[PKSharePreviewRowItem initWithIdentifier:]([PKShareCapabilityRowItem alloc], "initWithIdentifier:", v46);
          -[PKShareCapabilityRowItem setSectionIdentifier:](v47, "setSectionIdentifier:", CFSTR("VisibilitySectionIdentifier"));
          -[PKShareCapabilityRowItem setCapability:](v47, "setCapability:", v42);
          PKSharingCapabilityVisibilityToLocalizedString();
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKSharePreviewRowItem setTitle:](v47, "setTitle:", v48);

          -[PKSharePreviewRowItem setDisplayCheckmark:](v47, "setDisplayCheckmark:", v45);
          if (PKSharingCapabilityIsVisibilityValidForManageability())
          {
            v22 = v96;
            v49 = !v96->_isDisabled;
          }
          else
          {
            v49 = 0;
            v22 = v96;
          }
          -[PKSharePreviewRowItem setEnabled:](v47, "setEnabled:", v49);
          -[PKSharePreviewRowItem setAccessoryEnabled:](v47, "setAccessoryEnabled:", v5);
          objc_msgSend(objb, "addObject:", v47);

        }
      }
      v38 = objc_msgSend(v95, "countByEnumeratingWithState:objects:count:", &v101, v115, 16);
    }
    while (v38);
  }

  objc_msgSend(v86, "addObject:", CFSTR("VisibilitySectionIdentifier"));
  v50 = (void *)objc_msgSend(objb, "copy");
  objc_msgSend(v87, "setObject:forKeyedSubscript:", v50, CFSTR("VisibilitySectionIdentifier"));

  v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  -[PKPassEntitlementsComposerView allPossibleManageability](v22->_composerView, "allPossibleManageability");
  v92 = (id)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
  if (v51)
  {
    v52 = v51;
    v53 = *(_QWORD *)v98;
    do
    {
      for (m = 0; m != v52; ++m)
      {
        if (*(_QWORD *)v98 != v53)
          objc_enumerationMutation(v92);
        v55 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * m);
        v56 = objc_msgSend(v55, "unsignedIntegerValue");
        v57 = -[PKPassEntitlementsComposerView manageability](v22->_composerView, "manageability");
        if (v57 == v56)
          v58 = 1;
        else
          v58 = v5;
        if (v58 == 1)
        {
          if (v57 == v56)
            v59 = v5;
          else
            v59 = 0;
          v60 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@-%@"), CFSTR("ManageabilitySectionIdentifier"), v55);
          v61 = -[PKSharePreviewRowItem initWithIdentifier:]([PKShareCapabilityRowItem alloc], "initWithIdentifier:", v60);
          -[PKShareCapabilityRowItem setSectionIdentifier:](v61, "setSectionIdentifier:", CFSTR("ManageabilitySectionIdentifier"));
          -[PKShareCapabilityRowItem setCapability:](v61, "setCapability:", v56);
          PKSharingCapabilityManageabilityToLocalizedString();
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKSharePreviewRowItem setTitle:](v61, "setTitle:", v62);

          -[PKSharePreviewRowItem setDisplayCheckmark:](v61, "setDisplayCheckmark:", v59);
          if (PKSharingCapabilityIsManageabilityValidForVisibility())
            v63 = !v96->_isDisabled;
          else
            v63 = 0;
          -[PKSharePreviewRowItem setEnabled:](v61, "setEnabled:", v63);
          -[PKSharePreviewRowItem setAccessoryEnabled:](v61, "setAccessoryEnabled:", v5);
          objc_msgSend(v94, "addObject:", v61);

          v22 = v96;
        }
      }
      v52 = objc_msgSend(v92, "countByEnumeratingWithState:objects:count:", &v97, v114, 16);
    }
    while (v52);
  }

  v4 = v86;
  objc_msgSend(v86, "addObject:", CFSTR("ManageabilitySectionIdentifier"));
  v64 = (void *)objc_msgSend(v94, "copy");
  v20 = v87;
  objc_msgSend(v87, "setObject:forKeyedSubscript:", v64, CFSTR("ManageabilitySectionIdentifier"));

LABEL_87:
  v80 = objc_msgSend(v20, "copy");
  rowItemsForSection = v22->_rowItemsForSection;
  v22->_rowItemsForSection = (NSDictionary *)v80;

  v82 = (void *)objc_msgSend(v4, "copy");
  -[PKPaymentSetupListSectionController setIdentifiers:](v22, "setIdentifiers:", v82);

  if (v85)
  {
    WeakRetained = objc_loadWeakRetained((id *)&v22->_delegate);
    objc_msgSend(WeakRetained, "reloadDataAnimated:", 1);

  }
}

- (void)setIsDisabled:(BOOL)a3
{
  if (((!self->_isDisabled ^ a3) & 1) == 0)
  {
    self->_isDisabled = a3;
    -[PKPassEntitlementCapabilitySectionController _buildRowItemsWithNotify:](self, "_buildRowItemsWithNotify:", 1);
  }
}

- (id)decorateListCell:(id)a3 forRowItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  char v17;
  char **v18;
  id v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v9);

  objc_msgSend(v7, "subtitle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v10);

  objc_msgSend(v8, "secondaryTextProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v12);

  objc_msgSend(v8, "setDirectionalLayoutMargins:", 10.0, 0.0, 10.0, 0.0);
  objc_msgSend(v6, "setContentConfiguration:", v8);
  objc_msgSend(v6, "setUserInteractionEnabled:", objc_msgSend(v7, "enabled"));
  if ((objc_msgSend(v7, "displayChevron") & 1) != 0 || !objc_msgSend(v7, "displayToggleState"))
  {
    v19 = objc_alloc_init(MEMORY[0x1E0DC3548]);
    objc_msgSend(v19, "setReservedLayoutWidth:", *MEMORY[0x1E0DC4890]);
    objc_msgSend(v19, "setHidden:", objc_msgSend(v7, "displayCheckmark") ^ 1);
    goto LABEL_12;
  }
  v13 = objc_msgSend(v7, "displayToggleState");
  if (!v13)
  {
    v19 = 0;
    goto LABEL_12;
  }
  v14 = v13;
  v15 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
  objc_msgSend(v7, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = PKEqualObjects();

  if ((v17 & 1) != 0)
  {
    v18 = &selRef__allowSharingSwitchValueChanged_;
LABEL_10:
    objc_msgSend(v15, "addTarget:action:forControlEvents:", self, *v18, 4096);
    goto LABEL_11;
  }
  objc_msgSend(v7, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = PKEqualObjects();

  if (v21)
  {
    v18 = &selRef__canSeeAllSwitchValueChanged_;
    goto LABEL_10;
  }
LABEL_11:
  objc_msgSend(v15, "setOn:", v14 == 1);
  objc_msgSend(v15, "setEnabled:", objc_msgSend(v7, "accessoryEnabled"));
  v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3550]), "initWithCustomView:placement:", v15, 1);
  objc_msgSend(v19, "setMaintainsFixedSize:", 1);

LABEL_12:
  if ((objc_msgSend(v7, "accessoryEnabled") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkGrayColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setTintColor:", v22);

  v25[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessories:", v23);

  objc_msgSend(v6, "setConfigurationUpdateHandler:", &__block_literal_global_249);
  return v8;
}

void __76__PKPassEntitlementCapabilitySectionController_decorateListCell_forRowItem___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)MEMORY[0x1E0DC34D8];
  v5 = a2;
  objc_msgSend(v4, "listGroupedCellConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isHighlighted") & 1) != 0 || (objc_msgSend(v9, "isSelected") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tableCellDefaultSelectionTintColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
  objc_msgSend(v6, "setBackgroundColor:", v7);

  objc_msgSend(v5, "setBackgroundConfiguration:", v6);
}

- (id)headerAttributedStringForIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  __CFString *v18;
  char v19;
  __CFString *v20;
  __CFString *v21;
  char v22;
  __CFString *v23;
  _QWORD v25[2];
  _QWORD v26[3];

  v26[2] = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("SharabilitySectionIdentifier"))
    goto LABEL_4;
  if (!v3)
  {
LABEL_18:

    goto LABEL_19;
  }
  v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("SharabilitySectionIdentifier"));

  if ((v5 & 1) != 0)
  {
LABEL_4:
    v6 = CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SHAREABILITY_HEADER");
    goto LABEL_5;
  }
  v14 = v4;
  if (v14 == CFSTR("VisibilitySectionIdentifier")
    || (v15 = v14,
        v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("VisibilitySectionIdentifier")),
        v15,
        (v16 & 1) != 0))
  {
    v6 = CFSTR("SHARED_ENTITLEMENT_CAPABILITY_VISIBILITY_HEADER");
    goto LABEL_5;
  }
  v17 = v15;
  if (v17 == CFSTR("ManageabilitySectionIdentifier")
    || (v18 = v17,
        v19 = -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("ManageabilitySectionIdentifier")),
        v18,
        (v19 & 1) != 0))
  {
    v6 = CFSTR("SHARED_ENTITLEMENT_CAPABILITY_MANAGEABILITY_HEADER");
    goto LABEL_5;
  }
  v20 = v18;
  if (v20 != CFSTR("CapabilitySetSectionIdentifier"))
  {
    v21 = v20;
    v22 = -[__CFString isEqualToString:](v20, "isEqualToString:", CFSTR("CapabilitySetSectionIdentifier"));

    if ((v22 & 1) == 0)
    {
      v23 = v21;
      if (v23 != CFSTR("OverviewSectionIdentifier"))
        -[__CFString isEqualToString:](v23, "isEqualToString:", CFSTR("OverviewSectionIdentifier"));
      goto LABEL_18;
    }
  }
  v6 = CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_HEADER");
LABEL_5:
  PKLocalizedShareableCredentialString(&v6->isa);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_19:
    v13 = 0;
    goto LABEL_20;
  }
  v8 = (void *)v7;
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v25[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((void *)*MEMORY[0x1E0DC4B10], (void *)*MEMORY[0x1E0DC48F8], 2, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v10;
  v25[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v12);

LABEL_20:
  return v13;
}

- (id)footerAttributedStringForIdentifier:(id)a3
{
  __CFString *v3;
  __CFString *v4;
  char v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  char v16;
  __CFString *v17;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v3 = (__CFString *)a3;
  v4 = v3;
  if (v3 == CFSTR("CapabilitySetSectionIdentifier"))
    goto LABEL_4;
  if (!v3)
  {
LABEL_12:

    goto LABEL_13;
  }
  v5 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("CapabilitySetSectionIdentifier"));

  if ((v5 & 1) != 0)
  {
LABEL_4:
    v6 = CFSTR("SHARED_ENTITLEMENT_CAPABILITY_SET_FOOTER");
    goto LABEL_5;
  }
  v14 = v4;
  if (v14 != CFSTR("SimpleCapabilityOptionsSectionIdentifier"))
  {
    v15 = v14;
    v16 = -[__CFString isEqualToString:](v14, "isEqualToString:", CFSTR("SimpleCapabilityOptionsSectionIdentifier"));

    if ((v16 & 1) == 0)
    {
      v17 = v15;
      if (v17 != CFSTR("OverviewSectionIdentifier"))
        -[__CFString isEqualToString:](v17, "isEqualToString:", CFSTR("OverviewSectionIdentifier"));
      goto LABEL_12;
    }
  }
  v6 = CFSTR("SIMPLE_CAPABILITY_CREATION_FOOTER");
LABEL_5:
  PKLocalizedShareableCredentialString(&v6->isa);
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_13:
    v13 = 0;
    goto LABEL_14;
  }
  v8 = (void *)v7;
  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  v19[0] = *MEMORY[0x1E0DC1138];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4AB8], (NSString *)*MEMORY[0x1E0DC4900]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v19[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v9, "initWithString:attributes:", v8, v12);

LABEL_14:
  return v13;
}

- (void)didSelectItem:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  PKPassEntitlementsComposerView *composerView;
  void *v17;
  __CFString *v18;
  id WeakRetained;
  id v20;

  v20 = a3;
  objc_msgSend(v20, "sectionIdentifier");
  v4 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 == CFSTR("SharabilitySectionIdentifier"))
    goto LABEL_4;
  if (!v4)
  {
LABEL_16:

    goto LABEL_17;
  }
  v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("SharabilitySectionIdentifier"));

  if (!v6)
  {
    v7 = v5;
    if (v7 == CFSTR("VisibilitySectionIdentifier")
      || (v8 = v7,
          v9 = -[__CFString isEqualToString:](v7, "isEqualToString:", CFSTR("VisibilitySectionIdentifier")),
          v8,
          v9))
    {
      -[PKPassEntitlementsComposerView setVisibility:](self->_composerView, "setVisibility:", objc_msgSend(v20, "capability"));
      goto LABEL_17;
    }
    v10 = v8;
    if (v10 == CFSTR("ManageabilitySectionIdentifier")
      || (v11 = v10,
          v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("ManageabilitySectionIdentifier")),
          v11,
          v12))
    {
      -[PKPassEntitlementsComposerView setManageability:](self->_composerView, "setManageability:", objc_msgSend(v20, "capability"));
      goto LABEL_17;
    }
    v13 = v11;
    if (v13 == CFSTR("CapabilitySetSectionIdentifier")
      || (v14 = v13,
          v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("CapabilitySetSectionIdentifier")),
          v14,
          v15))
    {
      composerView = self->_composerView;
      objc_msgSend(v20, "capabilitySet");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassEntitlementsComposerView updateCapabilitiesWithSet:](composerView, "updateCapabilitiesWithSet:", v17);

      goto LABEL_17;
    }
    v18 = v14;
    if (v18 != CFSTR("OverviewSectionIdentifier"))
      -[__CFString isEqualToString:](v18, "isEqualToString:", CFSTR("OverviewSectionIdentifier"));
    goto LABEL_16;
  }
LABEL_4:
  -[PKPassEntitlementsComposerView setShareability:](self->_composerView, "setShareability:", objc_msgSend(v20, "capability"));
LABEL_17:
  -[PKPassEntitlementCapabilitySectionController _buildRowItemsWithNotify:](self, "_buildRowItemsWithNotify:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "deselectCells");

}

- (BOOL)shouldHighlightItem:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  int v7;
  BOOL v8;

  v4 = a3;
  v8 = 0;
  if (-[PKPassEntitlementsComposer editable](self->_entitlementComposer, "editable"))
  {
    objc_msgSend(v4, "sectionIdentifier");
    v5 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    if (v5 != CFSTR("SimpleCapabilityOptionsSectionIdentifier"))
    {
      v6 = v5;
      if (!v5
        || (v7 = -[__CFString isEqualToString:](v5, "isEqualToString:", CFSTR("SimpleCapabilityOptionsSectionIdentifier")), v6, v6, !v7))
      {
        v8 = 1;
      }
    }
  }

  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x1E0DC3390];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  -[NSDictionary objectForKeyedSubscript:](self->_rowItemsForSection, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "appendItems:", v8);
  return v7;
}

- (void)_allowSharingSwitchValueChanged:(id)a3
{
  int v4;
  PKPassEntitlementsComposerView *composerView;

  v4 = objc_msgSend(a3, "isOn");
  composerView = self->_composerView;
  if (v4)
  {
    -[PKPassEntitlementsComposerView setShareability:](composerView, "setShareability:", 2);
  }
  else
  {
    -[PKPassEntitlementsComposerView setShareability:](composerView, "setShareability:", 0);
    -[PKPassEntitlementsComposerView setVisibility:](self->_composerView, "setVisibility:", 1);
  }
  -[PKPassEntitlementCapabilitySectionController _buildRowItemsWithNotify:](self, "_buildRowItemsWithNotify:", 1);
}

- (void)_canSeeAllSwitchValueChanged:(id)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;

  v4 = objc_msgSend(a3, "isOn");
  if (v4)
    v5 = 2;
  else
    v5 = 1;
  if (v4)
    v6 = 2;
  else
    v6 = 0;
  -[PKPassEntitlementsComposerView setVisibility:](self->_composerView, "setVisibility:", v5);
  -[PKPassEntitlementsComposerView setShareability:](self->_composerView, "setShareability:", v6);
  -[PKPassEntitlementCapabilitySectionController _buildRowItemsWithNotify:](self, "_buildRowItemsWithNotify:", 1);
}

- (BOOL)isDisabled
{
  return self->_isDisabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowItemsForSection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_composerView, 0);
  objc_storeStrong((id *)&self->_entitlementComposer, 0);
}

@end
