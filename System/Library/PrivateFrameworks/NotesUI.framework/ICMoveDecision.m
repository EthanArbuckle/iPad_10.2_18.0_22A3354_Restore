@implementation ICMoveDecision

- (ICMoveDecision)initWithSourceObjects:(id)a3 destination:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  ICMoveDecision *v13;

  v6 = (void *)MEMORY[0x1E0D47230];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "mayOpenFromManagedToUnmanaged");

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "mayOpenFromUnmanagedToManaged");

  v13 = -[ICMoveDecision initWithSourceObjects:destination:allowsManagedToUnmanagedMove:allowsUnmanagedToManagedMove:](self, "initWithSourceObjects:destination:allowsManagedToUnmanagedMove:allowsUnmanagedToManagedMove:", v8, v7, v10, v12);
  return v13;
}

- (ICMoveDecision)initWithSourceObjects:(id)a3 destination:(id)a4 allowsManagedToUnmanagedMove:(BOOL)a5 allowsUnmanagedToManagedMove:(BOOL)a6
{
  id v10;
  id v11;
  ICMoveDecision *v12;
  ICMoveDecision *v13;
  id v14;
  id v15;
  uint64_t v16;
  ICMoveDecision *v17;
  id v18;
  id v19;
  uint64_t v20;
  NSArray *modernSourceObjects;
  uint64_t v22;
  NSArray *htmlSourceObjects;
  uint64_t v24;
  NSMutableSet *accountsOfHTMLSourceObjects;
  NSArray *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  BOOL v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t);
  void *v44;
  ICMoveDecision *v45;
  _QWORD v46[4];
  ICMoveDecision *v47;
  id v48;
  id v49;
  objc_super v50;

  v10 = a3;
  v11 = a4;
  v50.receiver = self;
  v50.super_class = (Class)ICMoveDecision;
  v12 = -[ICMoveDecision init](&v50, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_allowsManagedToUnmanagedMove = a5;
    v12->_allowsUnmanagedToManagedMove = a6;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v16 = MEMORY[0x1E0C809B0];
    v46[0] = MEMORY[0x1E0C809B0];
    v46[1] = 3221225472;
    v46[2] = __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke;
    v46[3] = &unk_1E5C23E88;
    v17 = v13;
    v47 = v17;
    v18 = v14;
    v48 = v18;
    v19 = v15;
    v49 = v19;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v46);
    if (objc_msgSend(v18, "count"))
    {
      v20 = objc_msgSend(v18, "copy");
      modernSourceObjects = v17->_modernSourceObjects;
      v17->_modernSourceObjects = (NSArray *)v20;

    }
    if (objc_msgSend(v19, "count"))
    {
      v22 = objc_msgSend(v19, "copy");
      htmlSourceObjects = v17->_htmlSourceObjects;
      v17->_htmlSourceObjects = (NSArray *)v22;

      v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", -[NSArray count](v17->_htmlSourceObjects, "count"));
      accountsOfHTMLSourceObjects = v17->_accountsOfHTMLSourceObjects;
      v17->_accountsOfHTMLSourceObjects = (NSMutableSet *)v24;

      v26 = v17->_htmlSourceObjects;
      v41 = v16;
      v42 = 3221225472;
      v43 = __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke_2;
      v44 = &unk_1E5C23EB0;
      v45 = v17;
      -[NSArray enumerateObjectsUsingBlock:](v26, "enumerateObjectsUsingBlock:", &v41);

    }
    if ((objc_msgSend((id)objc_opt_class(), "isValidModernDestinationObject:", v11) & 1) != 0)
    {
      v27 = 32;
    }
    else if ((objc_msgSend((id)objc_opt_class(), "isValidHTMLDestinationObject:", v11) & 1) != 0)
    {
      v27 = 40;
    }
    else
    {
      if (!objc_msgSend((id)objc_opt_class(), "isValidVirtualDestinationObject:", v11))
        goto LABEL_13;
      v27 = 48;
    }
    objc_storeStrong((id *)((char *)&v17->super.isa + v27), a4);
LABEL_13:
    -[ICMoveDecision _makeDecisionForMovingBetweenManagedAndUnmanagedAccounts](v17, "_makeDecisionForMovingBetweenManagedAndUnmanagedAccounts", v41, v42, v43, v44);
    if (-[ICMoveDecision type](v17, "type") > 1)
    {
LABEL_31:
      -[ICMoveDecision modernSourceObjects](v17, "modernSourceObjects");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "ic_objectsOfClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICMoveDecision setModernNotes:](v17, "setModernNotes:", v39);

      goto LABEL_32;
    }
    -[ICMoveDecision modernDestination](v17, "modernDestination");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      -[ICMoveDecision modernSourceObjects](v17, "modernSourceObjects");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = v29 != 0;
      if (v29)
        -[ICMoveDecision _makeDecisionForMovingModernObjectsToModernDestination](v17, "_makeDecisionForMovingModernObjectsToModernDestination");
      -[ICMoveDecision htmlSourceObjects](v17, "htmlSourceObjects");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31)
      {
        -[ICMoveDecision _makeDecisionForMovingHTMLObjectsToModernDestination](v17, "_makeDecisionForMovingHTMLObjectsToModernDestination");
        goto LABEL_31;
      }
    }
    else
    {
      -[ICMoveDecision htmlDestinationFolder](v17, "htmlDestinationFolder");
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32)
      {
        -[ICMoveDecision modernSourceObjects](v17, "modernSourceObjects");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v33 != 0;
        if (v33)
          -[ICMoveDecision _makeDecisionForMovingModernObjectsToHTMLDestination](v17, "_makeDecisionForMovingModernObjectsToHTMLDestination");
        -[ICMoveDecision htmlSourceObjects](v17, "htmlSourceObjects");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          -[ICMoveDecision _makeDecisionForMovingHTMLObjectsToHTMLDestination](v17, "_makeDecisionForMovingHTMLObjectsToHTMLDestination");
          goto LABEL_31;
        }
      }
      else
      {
        -[ICMoveDecision virtualDestinationFolder](v17, "virtualDestinationFolder");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v35)
          goto LABEL_30;
        -[ICMoveDecision modernSourceObjects](v17, "modernSourceObjects");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v30 = v36 != 0;
        if (v36)
          -[ICMoveDecision _makeDecisionForMovingModernObjectsToVirtualDestination](v17, "_makeDecisionForMovingModernObjectsToVirtualDestination");
        -[ICMoveDecision htmlSourceObjects](v17, "htmlSourceObjects");
        v37 = (void *)objc_claimAutoreleasedReturnValue();

        if (v37)
        {
          -[ICMoveDecision _makeDecisionForMovingHTMLObjectsToVirtualDestination](v17, "_makeDecisionForMovingHTMLObjectsToVirtualDestination");
          goto LABEL_31;
        }
      }
    }
    if (v30)
      goto LABEL_31;
LABEL_30:
    -[ICMoveDecision _setDecisionWithType:guiltyObjects:](v17, "_setDecisionWithType:guiltyObjects:", 2, 0);
    goto LABEL_31;
  }
LABEL_32:

  return v13;
}

void __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend((id)objc_opt_class(), "isValidModernSourceObject:", v5))
  {
    v3 = v5;
    v4 = (id *)(a1 + 40);
LABEL_5:
    objc_msgSend(*v4, "addObject:", v3);
    goto LABEL_6;
  }
  if (objc_msgSend((id)objc_opt_class(), "isValidHTMLSourceObject:", v5))
  {
    v3 = v5;
    v4 = (id *)(a1 + 48);
    goto LABEL_5;
  }
LABEL_6:

}

void __110__ICMoveDecision_initWithSourceObjects_destination_allowsManagedToUnmanagedMove_allowsUnmanagedToManagedMove___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "htmlAccountForObject:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountsOfHTMLSourceObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

}

- (void)_setDecisionWithType:(unint64_t)a3 additionalStep:(unint64_t)a4 guiltyObjects:(id)a5
{
  id v9;
  id v10;

  v9 = a5;
  if (self->_type < a3)
  {
    self->_type = a3;
    self->_additionalStep = a4;
    v10 = v9;
    objc_storeStrong((id *)&self->_guiltyObjects, a5);
    v9 = v10;
  }

}

- (void)_setDecisionWithType:(unint64_t)a3 guiltyObjects:(id)a4
{
  -[ICMoveDecision _setDecisionWithType:additionalStep:guiltyObjects:](self, "_setDecisionWithType:additionalStep:guiltyObjects:", a3, 0, a4);
}

- (BOOL)shouldMove
{
  return (-[ICMoveDecision type](self, "type") & 0xFFFFFFFFFFFFFFFELL) != 2;
}

- (BOOL)shouldProceed
{
  return -[ICMoveDecision type](self, "type") != 2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.receiver = self;
  v9.super_class = (Class)ICMoveDecision;
  -[ICMoveDecision description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision typeString](self, "typeString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision guiltyObjects](self, "guiltyObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: type = %@, guiltyObjects = %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)typeString
{
  unint64_t v2;

  v2 = -[ICMoveDecision type](self, "type");
  if (v2 > 3)
    return CFSTR("Unknown");
  else
    return off_1E5C24110[v2];
}

- (void)_makeDecisionForMovingBetweenManagedAndUnmanagedAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _BOOL4 v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[ICMoveDecision _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary](self, "_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary");
  -[ICMoveDecision accountsOfModernSourceObjects](self, "accountsOfModernSourceObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_90);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v4;
  objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_25);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision accountsOfHTMLSourceObjects](self, "accountsOfHTMLSourceObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_27_1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_28_0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_29_0);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v5;
  if (objc_msgSend(v5, "count"))
    v12 = 0;
  else
    v12 = objc_msgSend(v9, "count") == 0;
  v13 = v9;
  objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)v11;
  if (objc_msgSend(v6, "count"))
    v14 = 0;
  else
    v14 = objc_msgSend(v10, "count") == 0;
  -[ICMoveDecision htmlDestinationFolder](self, "htmlDestinationFolder");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "account");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICMoveDecision modernDestinationAccount](self, "modernDestinationAccount");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v17, "isManaged") & 1) != 0)
    v18 = 1;
  else
    v18 = objc_msgSend(v16, "isManaged");

  if (!-[ICMoveDecision allowsManagedToUnmanagedMove](self, "allowsManagedToUnmanagedMove") && !v12 && (v18 & 1) == 0)
  {
    -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, v29);
    v19 = v26;
LABEL_16:
    v20 = v25;
    v21 = v27;
    goto LABEL_17;
  }
  v19 = v26;
  if (!-[ICMoveDecision allowsUnmanagedToManagedMove](self, "allowsUnmanagedToManagedMove")
    && !v14
    && ((v18 ^ 1) & 1) == 0)
  {
    -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, v28);
    goto LABEL_16;
  }
  v21 = v27;
  v20 = v25;
  if (objc_msgSend(v27, "count"))
  {
    -[ICMoveDecision modernDestinationAccount](self, "modernDestinationAccount");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {

    }
    else
    {
      v30[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v27, "isEqual:", v23);

      v21 = v27;
      if ((v24 & 1) != 0)
        goto LABEL_17;
    }
    -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, v21);
  }
LABEL_17:

}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isManaged");
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isManaged") ^ 1;
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isManaged");
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isManaged") ^ 1;
}

uint64_t __74__ICMoveDecision__makeDecisionForMovingBetweenManagedAndUnmanagedAccounts__block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "preventMovingNotesToOtherAccounts");
}

- (void)_makeDecisionForMovingModernObjectsToModernDestination
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  char v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unint64_t v40;
  unint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  int v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  ICMoveDecision *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  int v58;
  void *v59;
  uint64_t v60;
  _BOOL4 v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  void *v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  int v75;
  void *v76;
  void *v77;
  void *v78;
  id v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  void (*v83)(uint64_t, void *);
  void *v84;
  ICMoveDecision *v85;
  id v86;
  _QWORD v87[5];
  _QWORD v88[2];

  v88[1] = *MEMORY[0x1E0C80C00];
  if (-[ICMoveDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
  {
    -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isUnsupported");

    if (v4)
      goto LABEL_5;
    -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isSharedReadOnly");

    if (v6
      || (-[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v8 = objc_msgSend(v7, "isSmartFolder"),
          v7,
          v8))
    {
LABEL_5:
      -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, 0);
    }
    else
    {
      -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke;
      v87[3] = &unk_1E5C23FB8;
      v87[4] = self;
      objc_msgSend(v23, "enumerateObjectsUsingBlock:", v87);

    }
    if (!-[ICMoveDecision type](self, "type"))
    {
      v9 = objc_alloc(MEMORY[0x1E0C99E20]);
      -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithArray:", v10);

      -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = MEMORY[0x1E0C809B0];
      v82 = 3221225472;
      v83 = __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_2;
      v84 = &unk_1E5C23FE0;
      v85 = self;
      v13 = v11;
      v86 = v13;
      objc_msgSend(v12, "enumerateObjectsUsingBlock:", &v81);

      -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqual:", v13);

      if ((v15 & 1) == 0)
      {
        -[ICMoveDecision setFilteredModernSourceObjects:](self, "setFilteredModernSourceObjects:", v13);
        -[ICMoveDecision setHasSanitizedAndScreenedModernSourceObjects:](self, "setHasSanitizedAndScreenedModernSourceObjects:", 0);
      }
      -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "count");

      if (!v17)
        -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, 0);

    }
    if (!-[ICMoveDecision type](self, "type"))
    {
      -[ICMoveDecision _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary](self, "_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary");
      -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "count"))
      {
        -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v19, "isDefaultFolderForAccount"))
        {
          -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_msgSend(v30, "isTrashFolder");

          if ((v31 & 1) == 0)
            goto LABEL_27;
LABEL_18:
          -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "count"))
          {
            -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (v22)
              goto LABEL_27;
          }
          else
          {

          }
          -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v24, "count"))
          {

LABEL_31:
            -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v33, "count")
              && (-[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder"),
                  (v34 = objc_claimAutoreleasedReturnValue()) != 0))
            {
              v35 = (void *)v34;
              -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = objc_msgSend(v36, "depth");
              v38 = (void *)MEMORY[0x1E0D63B10];
              -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              v40 = objc_msgSend(v38, "maximumDistanceToLeafFolderOfFolders:", v39) + v37;
              v41 = objc_msgSend(MEMORY[0x1E0D63B10], "folderDepthLimit");

              if (v40 >= v41)
              {
                -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v88[0] = v42;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                -[ICMoveDecision _setDecisionWithType:additionalStep:guiltyObjects:](self, "_setDecisionWithType:additionalStep:guiltyObjects:", 3, 1, v43);

                return;
              }
            }
            else
            {

            }
            -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v44, "count"))
            {
              -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              v46 = objc_msgSend(v45, "isSystemFolder");

              if (v46)
              {
                -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
                v32 = objc_claimAutoreleasedReturnValue();
                goto LABEL_28;
              }
            }
            else
            {

            }
            -[ICMoveDecision readOnlySharedSubObjectsInSource](self, "readOnlySharedSubObjectsInSource");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v47, "count");

            if (v48)
            {
              -[ICMoveDecision readOnlySharedSubObjectsInSource](self, "readOnlySharedSubObjectsInSource");
              v32 = objc_claimAutoreleasedReturnValue();
              goto LABEL_28;
            }
            if (-[ICMoveDecision hasSharedObjectsNotFromDestinationAccountInSource](self, "hasSharedObjectsNotFromDestinationAccountInSource"))
            {
              -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
              v49 = objc_claimAutoreleasedReturnValue();
              v50 = self;
              v51 = 3;
              v52 = 4;
LABEL_66:
              v80 = (id)v49;
              goto LABEL_67;
            }
            -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v53, "isSharedViaICloud"))
            {

            }
            else
            {
              -[ICMoveDecision readWriteSharedSubObjectsInSource](self, "readWriteSharedSubObjectsInSource");
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "count");

              if (v55)
              {
                -[ICMoveDecision readWriteSharedSubObjectsInSource](self, "readWriteSharedSubObjectsInSource");
                v56 = objc_claimAutoreleasedReturnValue();
                goto LABEL_48;
              }
            }
            -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v57, "isSharedViaICloud");

            -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
            v59 = (void *)objc_claimAutoreleasedReturnValue();
            v60 = objc_msgSend(v59, "count");
            if (!v58)
            {
              if (v60)
              {
                v61 = -[ICMoveDecision hasLockedNotesNotFromDestinationAccountInSource](self, "hasLockedNotesNotFromDestinationAccountInSource");

                if (v61)
                {
                  -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
                  v49 = objc_claimAutoreleasedReturnValue();
                  v50 = self;
                  v51 = 3;
                  v52 = 2;
                  goto LABEL_66;
                }
              }
              else
              {

              }
              -[ICMoveDecision systemPaperNotesInSource](self, "systemPaperNotesInSource");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              v67 = objc_msgSend(v66, "count");

              if (v67)
              {
                -[ICMoveDecision systemPaperNotesInSource](self, "systemPaperNotesInSource");
                v49 = objc_claimAutoreleasedReturnValue();
                v50 = self;
                v51 = 1;
                v52 = 8;
              }
              else
              {
                -[ICMoveDecision mathNotesNotesInSource](self, "mathNotesNotesInSource");
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = objc_msgSend(v68, "count");

                if (v69)
                {
                  -[ICMoveDecision mathNotesNotesInSource](self, "mathNotesNotesInSource");
                  v49 = objc_claimAutoreleasedReturnValue();
                  v50 = self;
                  v51 = 1;
                  v52 = 10;
                }
                else
                {
                  -[ICMoveDecision callNotesInSource](self, "callNotesInSource");
                  v72 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = objc_msgSend(v72, "count");

                  if (!v73)
                  {
                    -[ICMoveDecision modernDestinationAccount](self, "modernDestinationAccount");
                    v74 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = objc_msgSend(v74, "isLocalAccount");

                    if (!v75)
                      return;
                    -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
                    v76 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v76, "ic_objectsPassingTest:", &__block_literal_global_35_1);
                    v79 = (id)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v79, "ic_objectsPassingTest:", &__block_literal_global_37_0);
                    v77 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v77, "count"))
                    {
                      objc_msgSend(v77, "allObjects");
                      v78 = (void *)objc_claimAutoreleasedReturnValue();
                      -[ICMoveDecision _setDecisionWithType:additionalStep:guiltyObjects:](self, "_setDecisionWithType:additionalStep:guiltyObjects:", 3, 13, v78);

                    }
LABEL_29:

                    return;
                  }
                  -[ICMoveDecision callNotesInSource](self, "callNotesInSource");
                  v49 = objc_claimAutoreleasedReturnValue();
                  v50 = self;
                  v51 = 1;
                  v52 = 12;
                }
              }
              goto LABEL_66;
            }
            if (v60)
            {

LABEL_56:
              -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              -[ICMoveDecision joinedSharedRootObjectsInSource](self, "joinedSharedRootObjectsInSource");
              v65 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "arrayByAddingObjectsFromArray:", v65);
              v80 = (id)objc_claimAutoreleasedReturnValue();

              v50 = self;
              v51 = 3;
              v52 = 3;
              v49 = (uint64_t)v80;
LABEL_67:
              -[ICMoveDecision _setDecisionWithType:additionalStep:guiltyObjects:](v50, "_setDecisionWithType:additionalStep:guiltyObjects:", v51, v52, v49, v80, v81, v82, v83, v84, v85);
              goto LABEL_29;
            }
            -[ICMoveDecision joinedSharedRootObjectsInSource](self, "joinedSharedRootObjectsInSource");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v63 = objc_msgSend(v62, "count");

            if (v63)
              goto LABEL_56;
            -[ICMoveDecision sharedObjectsNotFromDestinationFolderInSource](self, "sharedObjectsNotFromDestinationFolderInSource");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = objc_msgSend(v70, "count");

            if (!v71)
              return;
            -[ICMoveDecision sharedObjectsNotFromDestinationFolderInSource](self, "sharedObjectsNotFromDestinationFolderInSource");
            v56 = objc_claimAutoreleasedReturnValue();
LABEL_48:
            v49 = v56;
            v50 = self;
            v51 = 1;
            v52 = 6;
            goto LABEL_66;
          }
          -[ICMoveDecision accountsOfModernSourceObjects](self, "accountsOfModernSourceObjects");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = (void *)MEMORY[0x1E0C99E60];
          -[ICMoveDecision modernDestinationAccount](self, "modernDestinationAccount");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setWithObject:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v25, "isEqual:", v28);

          if ((v29 & 1) != 0)
            goto LABEL_31;
LABEL_27:
          -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
          v32 = objc_claimAutoreleasedReturnValue();
LABEL_28:
          -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, v32, v81, v82, v83, v84, v85);
          goto LABEL_29;
        }

      }
      goto LABEL_18;
    }
  }
}

void __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "modernDestinationFolder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isDescendantOfFolder:", v7))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "modernDestination");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {

        goto LABEL_9;
      }
      v12 = objc_msgSend(v7, "isSmartFolder");

      if (!v12)
        goto LABEL_9;
    }
    v9 = *(void **)(a1 + 32);
    v13[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_setDecisionWithType:guiltyObjects:", 2, v10);

    *a4 = 1;
  }
LABEL_9:

}

void __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;

  v18 = a2;
  objc_msgSend(v18, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modernDestination");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 40), "removeObject:", v18);
  }
  else
  {
    objc_msgSend(v18, "cloudAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "modernDestinationAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if (v11)
    {
      objc_opt_class();
      ICDynamicCast();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "folder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "modernDestination");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v14, "isEqualToString:", v16) && (objc_msgSend(v12, "isSystemPaper") & 1) == 0)
      {
        v17 = objc_msgSend(v12, "isMathNote");

        if ((v17 & 1) == 0)
          objc_msgSend(*(id *)(a1 + 40), "removeObject:", v18);
      }
      else
      {

      }
    }
  }

}

uint64_t __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  objc_opt_class();
  ICDynamicCast();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "isSmartFolder"))
  {
    objc_msgSend(v3, "account");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isLocalAccount") ^ 1;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = a2;
  objc_msgSend(v2, "smartFolderQuery");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterSelectionWithManagedObjectContext:account:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "filterTypeSelections");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "ic_containsObjectPassingTest:", &__block_literal_global_39_0);

  return v9;
}

uint64_t __72__ICMoveDecision__makeDecisionForMovingModernObjectsToModernDestination__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x1E0D63B08];
  v3 = a2;
  objc_msgSend(v2, "cloudSpecificFilterTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = objc_msgSend(v3, "filterType");

  objc_msgSend(v5, "numberWithInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "containsObject:", v7);

  return v8;
}

- (void)_makeDecisionForMovingModernObjectsToHTMLDestination
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  ICMoveDecision *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;

  if (-[ICMoveDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
  {
    v3 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
    v4 = objc_claimAutoreleasedReturnValue();
    v23 = (id)objc_msgSend(v3, "initWithArray:", v4);

    -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v23);

    if ((v4 & 1) == 0)
    {
      -[ICMoveDecision setFilteredModernSourceObjects:](self, "setFilteredModernSourceObjects:", v23);
      -[ICMoveDecision setHasSanitizedAndScreenedModernSourceObjects:](self, "setHasSanitizedAndScreenedModernSourceObjects:", 0);
    }
    -[ICMoveDecision _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary](self, "_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary");
    -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7)
      -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, 0);
    -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
        -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (v15)
        {
          -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = self;
          v17 = 3;
          v18 = 2;
        }
        else
        {
          -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "count");

          if (v20)
          {
            -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = self;
            v17 = 3;
            v18 = 4;
          }
          else
          {
            -[ICMoveDecision privateModernNoteWithAttachmentsInSource](self, "privateModernNoteWithAttachmentsInSource");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");

            if (!v22)
              goto LABEL_13;
            -[ICMoveDecision privateModernNoteWithAttachmentsInSource](self, "privateModernNoteWithAttachmentsInSource");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = self;
            v17 = 1;
            v18 = 5;
          }
        }
        -[ICMoveDecision _setDecisionWithType:additionalStep:guiltyObjects:](v16, "_setDecisionWithType:additionalStep:guiltyObjects:", v17, v18, v13);
LABEL_12:

LABEL_13:
        return;
      }
      -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v10;
    -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, v10);
    goto LABEL_12;
  }
}

- (void)_makeDecisionForMovingModernObjectsToVirtualDestination
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  ICMoveDecision *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;

  -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v48 = (id)objc_claimAutoreleasedReturnValue();

  if (!v48)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((context) != nil)", "-[ICMoveDecision _makeDecisionForMovingModernObjectsToVirtualDestination]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "context");
  if (-[ICMoveDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
  {
    -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v48)
    {
      if (v5)
      {
        -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)objc_msgSend(v6, "mutableCopy");

        v8 = (void *)MEMORY[0x1E0D63BB8];
        -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "predicateForContext:", v48);
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "ic_objectsMatchingPredicate:context:", v10, v48);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "minusSet:", v12);

        -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v10) = objc_msgSend(v13, "isEqual:", v7);

        if ((v10 & 1) == 0)
        {
          -[ICMoveDecision setFilteredModernSourceObjects:](self, "setFilteredModernSourceObjects:", v7);
          -[ICMoveDecision setHasSanitizedAndScreenedModernSourceObjects:](self, "setHasSanitizedAndScreenedModernSourceObjects:", 0);
        }
        -[ICMoveDecision _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary](self, "_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary");
        -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count");

        if (!v15)
        {
          -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        if (v17)
        {
          -[ICMoveDecision unsupportedObjectsInSource](self, "unsupportedObjectsInSource");
          v18 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v23 = (void *)v18;
          -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, v18);
LABEL_17:

LABEL_18:
          goto LABEL_19;
        }
        -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v20)
        {
          -[ICMoveDecision modernFoldersInSource](self, "modernFoldersInSource");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        -[ICMoveDecision readOnlySharedSubObjectsInSource](self, "readOnlySharedSubObjectsInSource");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          -[ICMoveDecision readOnlySharedSubObjectsInSource](self, "readOnlySharedSubObjectsInSource");
          v18 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
        if (-[ICMoveDecision hasSharedObjectsNotFromDestinationAccountInSource](self, "hasSharedObjectsNotFromDestinationAccountInSource"))
        {
          -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = self;
          v25 = 3;
          v26 = 4;
        }
        else if (-[ICMoveDecision hasLockedNotesNotFromDestinationAccountInSource](self, "hasLockedNotesNotFromDestinationAccountInSource"))
        {
          -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = self;
          v25 = 3;
          v26 = 2;
        }
        else
        {
          -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "type");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSharedWithYou"));

          if (v29)
          {
            -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
            v30 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "type");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeSystemPaper"));

            if (!v33)
            {
              -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "type");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeMathNotes"));

              if (v38)
              {
                -[ICMoveDecision nonMathNotesNotesInSource](self, "nonMathNotesNotesInSource");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "count");

                if (!v40)
                  goto LABEL_18;
                -[ICMoveDecision nonMathNotesNotesInSource](self, "nonMathNotesNotesInSource");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = self;
                v25 = 1;
                v26 = 9;
              }
              else
              {
                -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
                v41 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "type");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "isEqual:", CFSTR("ICVirtualSmartFolderItemIdentifierTypeCallNotes"));

                if (!v43)
                  goto LABEL_18;
                -[ICMoveDecision nonCallNotesInSource](self, "nonCallNotesInSource");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "count");

                if (!v45)
                  goto LABEL_18;
                -[ICMoveDecision nonCallNotesInSource](self, "nonCallNotesInSource");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                v24 = self;
                v25 = 1;
                v26 = 11;
              }
              goto LABEL_30;
            }
            -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "count");

            if (!v35)
            {
              -[ICMoveDecision nonSystemPaperNotesInSource](self, "nonSystemPaperNotesInSource");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = objc_msgSend(v46, "count");

              if (!v47)
                goto LABEL_18;
              -[ICMoveDecision nonSystemPaperNotesInSource](self, "nonSystemPaperNotesInSource");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = self;
              v25 = 1;
              v26 = 7;
              goto LABEL_30;
            }
            -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
            v30 = objc_claimAutoreleasedReturnValue();
          }
          v23 = (void *)v30;
          v24 = self;
          v25 = 2;
          v26 = 0;
        }
LABEL_30:
        -[ICMoveDecision _setDecisionWithType:additionalStep:guiltyObjects:](v24, "_setDecisionWithType:additionalStep:guiltyObjects:", v25, v26, v23);
        goto LABEL_17;
      }
    }
  }
LABEL_19:

}

- (void)_makeDecisionForMovingHTMLObjectsToModernDestination
{
  void *v3;
  char v4;
  void *v5;
  int v6;

  if (-[ICMoveDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
  {
    -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isSharedReadOnly");

    if ((v4 & 1) != 0
      || (-[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isSmartFolder"),
          v5,
          v6))
    {
      -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, 0);
    }
  }
}

- (void)_makeDecisionForMovingHTMLObjectsToHTMLDestination
{
  if (-[ICMoveDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
    -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, 0);
}

- (void)_makeDecisionForMovingHTMLObjectsToVirtualDestination
{
  id v3;

  if (-[ICMoveDecision shouldContinueDecisionMaking](self, "shouldContinueDecisionMaking"))
  {
    -[ICMoveDecision _sanitizeAndScreenFilteredModernSourceObjectsIfNecessary](self, "_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary");
    -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[ICMoveDecision _setDecisionWithType:guiltyObjects:](self, "_setDecisionWithType:guiltyObjects:", 2, v3);

  }
}

- (void)_sanitizeAndScreenFilteredModernSourceObjectsIfNecessary
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  unint64_t v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t i;
  void *v93;
  id v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  _BOOL4 v100;
  uint64_t v101;
  void *v102;
  void *v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  _QWORD v108[5];
  _QWORD v109[4];
  id v110;
  ICMoveDecision *v111;
  _QWORD v112[5];
  _QWORD v113[4];
  id v114;
  ICMoveDecision *v115;
  _QWORD v116[4];
  id v117;
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x1E0C80C00];
  if (-[ICMoveDecision hasSanitizedAndScreenedModernSourceObjects](self, "hasSanitizedAndScreenedModernSourceObjects"))
    return;
  -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C99E20]);
    -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "initWithArray:", v5);
    -[ICMoveDecision setFilteredModernSourceObjects:](self, "setFilteredModernSourceObjects:", v6);

  }
  -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "ic_objectsPassingTest:", &__block_literal_global_48);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision setModernFoldersInSource:](self, "setModernFoldersInSource:", v9);

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision filteredModernSourceObjects](self, "filteredModernSourceObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = MEMORY[0x1E0C809B0];
  v116[0] = MEMORY[0x1E0C809B0];
  v116[1] = 3221225472;
  v116[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_2;
  v116[3] = &unk_1E5C23FB8;
  v15 = v10;
  v117 = v15;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", v116);
  objc_msgSend(v13, "removeObjectsInArray:", v15);
  v113[0] = v14;
  v113[1] = 3221225472;
  v113[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_3;
  v113[3] = &unk_1E5C23FE0;
  v16 = v13;
  v114 = v16;
  v115 = self;
  v103 = v15;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v113);
  v102 = v16;
  -[ICMoveDecision setSanitizedFilteredModernSourceObjects:](self, "setSanitizedFilteredModernSourceObjects:", v16);
  v17 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithCapacity:", objc_msgSend(v18, "count"));
  -[ICMoveDecision setOwnedSharedRootObjectsInSource:](self, "setOwnedSharedRootObjectsInSource:", v19);

  v20 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v20, "initWithCapacity:", objc_msgSend(v21, "count"));
  -[ICMoveDecision setJoinedSharedRootObjectsInSource:](self, "setJoinedSharedRootObjectsInSource:", v22);

  v23 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v23, "initWithCapacity:", objc_msgSend(v24, "count"));
  -[ICMoveDecision setReadWriteSharedSubObjectsInSource:](self, "setReadWriteSharedSubObjectsInSource:", v25);

  v26 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)objc_msgSend(v26, "initWithCapacity:", objc_msgSend(v27, "count"));
  -[ICMoveDecision setReadOnlySharedSubObjectsInSource:](self, "setReadOnlySharedSubObjectsInSource:", v28);

  v29 = objc_alloc(MEMORY[0x1E0C99E20]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = (void *)objc_msgSend(v29, "initWithCapacity:", objc_msgSend(v30, "count"));
  -[ICMoveDecision setAccountsOfModernSourceObjects:](self, "setAccountsOfModernSourceObjects:", v31);

  v32 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithCapacity:", objc_msgSend(v33, "count"));
  -[ICMoveDecision setSharedObjectsInSource:](self, "setSharedObjectsInSource:", v34);

  v35 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = (void *)objc_msgSend(v35, "initWithCapacity:", objc_msgSend(v36, "count"));
  -[ICMoveDecision setLockedObjectsInSource:](self, "setLockedObjectsInSource:", v37);

  v38 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v38, "initWithCapacity:", objc_msgSend(v39, "count"));
  -[ICMoveDecision setUnsupportedObjectsInSource:](self, "setUnsupportedObjectsInSource:", v40);

  v41 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v41, "initWithCapacity:", objc_msgSend(v42, "count"));
  -[ICMoveDecision setPrivateModernNoteWithAttachmentsInSource:](self, "setPrivateModernNoteWithAttachmentsInSource:", v43);

  v44 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = (void *)objc_msgSend(v44, "initWithCapacity:", objc_msgSend(v45, "count"));
  -[ICMoveDecision setSharedObjectsNotFromDestinationFolderInSource:](self, "setSharedObjectsNotFromDestinationFolderInSource:", v46);

  v47 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v47, "initWithCapacity:", objc_msgSend(v48, "count"));
  -[ICMoveDecision setSystemPaperNotesInSource:](self, "setSystemPaperNotesInSource:", v49);

  v50 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = (void *)objc_msgSend(v50, "initWithCapacity:", objc_msgSend(v51, "count"));
  -[ICMoveDecision setNonSystemPaperNotesInSource:](self, "setNonSystemPaperNotesInSource:", v52);

  v53 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v53, "initWithCapacity:", objc_msgSend(v54, "count"));
  -[ICMoveDecision setMathNotesNotesInSource:](self, "setMathNotesNotesInSource:", v55);

  v56 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v56, "initWithCapacity:", objc_msgSend(v57, "count"));
  -[ICMoveDecision setNonMathNotesNotesInSource:](self, "setNonMathNotesNotesInSource:", v58);

  v59 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v59, "initWithCapacity:", objc_msgSend(v60, "count"));
  -[ICMoveDecision setCallNotesInSource:](self, "setCallNotesInSource:", v61);

  v62 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = (void *)objc_msgSend(v62, "initWithCapacity:", objc_msgSend(v63, "count"));
  -[ICMoveDecision setNonCallNotesInSource:](self, "setNonCallNotesInSource:", v64);

  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v112[0] = v14;
  v112[1] = 3221225472;
  v112[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_4;
  v112[3] = &unk_1E5C23FB8;
  v112[4] = self;
  objc_msgSend(v65, "enumerateObjectsUsingBlock:", v112);

  -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision ownedSharedRootObjectsInSource](self, "ownedSharedRootObjectsInSource");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "addObjectsFromArray:", v67);

  -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision joinedSharedRootObjectsInSource](self, "joinedSharedRootObjectsInSource");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "addObjectsFromArray:", v69);

  -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision readWriteSharedSubObjectsInSource](self, "readWriteSharedSubObjectsInSource");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "addObjectsFromArray:", v71);

  -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICMoveDecision readOnlySharedSubObjectsInSource](self, "readOnlySharedSubObjectsInSource");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "addObjectsFromArray:", v73);

  -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "rootSharingFolder");
  v75 = (void *)objc_claimAutoreleasedReturnValue();

  if (v75)
  {
    -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v109[0] = v14;
    v109[1] = 3221225472;
    v109[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_5;
    v109[3] = &unk_1E5C23FE0;
    v110 = v75;
    v111 = self;
    objc_msgSend(v76, "enumerateObjectsUsingBlock:", v109);

  }
  -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = objc_msgSend(v77, "count");

  if (v78)
  {
    -[ICMoveDecision accountsOfModernSourceObjects](self, "accountsOfModernSourceObjects");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = objc_msgSend(v79, "count");

    if (v80 < 2)
    {
      -[ICMoveDecision accountsOfModernSourceObjects](self, "accountsOfModernSourceObjects");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v81, "count") == 1)
      {
        -[ICMoveDecision accountsOfModernSourceObjects](self, "accountsOfModernSourceObjects");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v82, "anyObject");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "identifier");
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICMoveDecision modernDestinationAccount](self, "modernDestinationAccount");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "identifier");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v84, "isEqualToString:", v86);

        if ((v87 & 1) == 0)
          -[ICMoveDecision setHasSharedObjectsNotFromDestinationAccountInSource:](self, "setHasSharedObjectsNotFromDestinationAccountInSource:", 1);
        goto LABEL_13;
      }
    }
    else
    {
      -[ICMoveDecision sharedObjectsInSource](self, "sharedObjectsInSource");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = v14;
      v108[1] = 3221225472;
      v108[2] = __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_6;
      v108[3] = &unk_1E5C240C8;
      v108[4] = self;
      -[ICMoveDecision setHasSharedObjectsNotFromDestinationAccountInSource:](self, "setHasSharedObjectsNotFromDestinationAccountInSource:", objc_msgSend(v81, "ic_containsObjectPassingTest:", v108));
    }

  }
LABEL_13:
  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  -[ICMoveDecision sanitizedFilteredModernSourceObjects](self, "sanitizedFilteredModernSourceObjects");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
  if (v89)
  {
    v90 = v89;
    v91 = *(_QWORD *)v105;
    do
    {
      for (i = 0; i != v90; ++i)
      {
        if (*(_QWORD *)v105 != v91)
          objc_enumerationMutation(v88);
        v93 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v94 = v93;
          if (objc_msgSend(v94, "isSystemPaper"))
            -[ICMoveDecision systemPaperNotesInSource](self, "systemPaperNotesInSource");
          else
            -[ICMoveDecision nonSystemPaperNotesInSource](self, "nonSystemPaperNotesInSource");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "addObject:", v94);

          if (objc_msgSend(v94, "isMathNote"))
            -[ICMoveDecision mathNotesNotesInSource](self, "mathNotesNotesInSource");
          else
            -[ICMoveDecision nonMathNotesNotesInSource](self, "nonMathNotesNotesInSource");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "addObject:", v94);

          if (objc_msgSend(v94, "isCallNote"))
            -[ICMoveDecision callNotesInSource](self, "callNotesInSource");
          else
            -[ICMoveDecision nonCallNotesInSource](self, "nonCallNotesInSource");
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v97, "addObject:", v94);

          if (objc_msgSend(v94, "isPasswordProtected"))
          {
            objc_msgSend(v94, "account");
            v98 = (void *)objc_claimAutoreleasedReturnValue();
            -[ICMoveDecision modernDestinationAccount](self, "modernDestinationAccount");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = -[ICMoveDecision hasLockedNotesNotFromDestinationAccountInSource](self, "hasLockedNotesNotFromDestinationAccountInSource");
            v101 = v98 != v99 || v100;
            -[ICMoveDecision setHasLockedNotesNotFromDestinationAccountInSource:](self, "setHasLockedNotesNotFromDestinationAccountInSource:", v101);

          }
        }
      }
      v90 = objc_msgSend(v88, "countByEnumeratingWithState:objects:count:", &v104, v118, 16);
    }
    while (v90);
  }

  -[ICMoveDecision setHasSanitizedAndScreenedModernSourceObjects:](self, "setHasSanitizedAndScreenedModernSourceObjects:", 1);
}

uint64_t __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

void __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4
    && (objc_msgSend(v4, "isSharedViaICloud") & 1) == 0
    && (objc_msgSend(v4, "visibleNotesCount") || objc_msgSend(v4, "visibleNoteContainerChildrenCount")))
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
  }

}

void __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_opt_class();
  ICDynamicCast();
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend((id)objc_opt_class(), "objectsForMakingDecisionForNonSharedFolder:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v5);

}

void __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "accountForObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accountsOfModernSourceObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ic_addNonNilObject:", v4);

  objc_opt_class();
  ICDynamicCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isPasswordProtected"))
  {
    objc_msgSend(*(id *)(a1 + 32), "lockedObjectsInSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v3);

  }
  if (objc_msgSend(v3, "isUnsupported"))
  {
    objc_msgSend(*(id *)(a1 + 32), "unsupportedObjectsInSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v3);

  }
  if (objc_msgSend(v3, "isSharedViaICloud"))
  {
    if (objc_msgSend(v3, "isSharedRootObject"))
    {
      v9 = objc_msgSend(v3, "isOwnedByCurrentUser");
      v10 = *(void **)(a1 + 32);
      if (v9)
        objc_msgSend(v10, "ownedSharedRootObjectsInSource");
      else
        objc_msgSend(v10, "joinedSharedRootObjectsInSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v3;
      goto LABEL_16;
    }
    v16 = objc_msgSend(v3, "isSharedReadOnly");
    v17 = *(void **)(a1 + 32);
    if (v16)
      objc_msgSend(v17, "readOnlySharedSubObjectsInSource");
    else
      objc_msgSend(v17, "readWriteSharedSubObjectsInSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v3);

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(v6, "attachments", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v27 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          if (objc_msgSend(v24, "isUnsupported"))
          {
            objc_msgSend(*(id *)(a1 + 32), "unsupportedObjectsInSource");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "addObject:", v24);

          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v21);
    }

  }
  else if (v6)
  {
    objc_msgSend(v6, "attachments");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 32), "privateModernNoteWithAttachmentsInSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      v15 = v6;
LABEL_16:
      objc_msgSend(v13, "addObject:", v15);

    }
  }

}

void __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_5(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v10 = a2;
  v3 = objc_msgSend(v10, "isSharedViaICloud");
  v4 = v10;
  if (v3)
  {
    objc_msgSend(v10, "parentCloudObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    ICCheckedDynamicCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isSharedViaICloud"))
    {
      objc_msgSend(v6, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0)
      {

LABEL_7:
        goto LABEL_8;
      }
      v9 = objc_msgSend(v6, "isDescendantOfFolder:", *(_QWORD *)(a1 + 32));

      if ((v9 & 1) != 0)
      {
LABEL_8:

        v4 = v10;
        goto LABEL_9;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "sharedObjectsNotFromDestinationFolderInSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v10);
    goto LABEL_7;
  }
LABEL_9:

}

uint64_t __74__ICMoveDecision__sanitizeAndScreenFilteredModernSourceObjectsIfNecessary__block_invoke_6(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "accountForObject:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "modernDestinationAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToString:", v6) ^ 1;

  return v7;
}

- (BOOL)hasLockedObjects
{
  void *v2;
  BOOL v3;

  -[ICMoveDecision lockedObjectsInSource](self, "lockedObjectsInSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)accountForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  objc_opt_class();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "account");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_11;
  }
  else
  {
    objc_opt_class();
    ICDynamicCast();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "account");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }

    if (v6)
      goto LABEL_11;
  }
  v9 = os_log_create("com.apple.notes", "Move");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[ICMoveDecision accountForObject:].cold.1((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);

LABEL_11:
  return v6;
}

- (id)htmlAccountForObject:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v3 = a3;
  ICProtocolCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "folder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
LABEL_4:
    objc_msgSend(v6, "account");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    ICProtocolCast();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  ICProtocolCast();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    goto LABEL_4;
  v9 = 0;
LABEL_5:

  if (!v9)
  {
    v10 = os_log_create("com.apple.notes", "Move");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ICMoveDecision htmlAccountForObject:].cold.1((uint64_t)v3, v10, v11, v12, v13, v14, v15, v16);

  }
  return v9;
}

+ (id)objectsForMakingDecisionForNonSharedFolder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((objc_msgSend(v4, "isSharedViaICloud") & 1) != 0 || objc_msgSend(v4, "isSmartFolder"))
  {
    objc_msgSend(v5, "addObject:", v4);
  }
  else
  {
    objc_msgSend(v4, "visibleNotes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    objc_msgSend(v4, "visibleNoteContainerChildrenUnsorted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __61__ICMoveDecision_objectsForMakingDecisionForNonSharedFolder___block_invoke;
    v9[3] = &unk_1E5C240F0;
    v10 = v5;
    v11 = a1;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

  }
  return v5;
}

void __61__ICMoveDecision_objectsForMakingDecisionForNonSharedFolder___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "objectsForMakingDecisionForNonSharedFolder:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObjectsFromArray:", v3);

}

+ (BOOL)isValidModernSourceObject:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)isValidHTMLSourceObject:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)isValidModernDestinationObject:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

+ (BOOL)isValidHTMLDestinationObject:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (BOOL)isValidVirtualDestinationObject:(id)a3
{
  id v3;
  char isKindOfClass;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)shouldContinueDecisionMaking
{
  return -[ICMoveDecision type](self, "type") != 3;
}

- (ICFolder)modernDestinationFolder
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[ICMoveDecision modernDestination](self, "modernDestination");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (ICFolder *)v4;
}

- (ICAccount)modernDestinationAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[ICMoveDecision modernSourceObjects](self, "modernSourceObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[ICMoveDecision modernDestination](self, "modernDestination");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    -[ICMoveDecision modernDestinationFolder](self, "modernDestinationFolder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "account");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v9 = v11;
    }
    else
    {
      -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "accountObjectID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        -[ICMoveDecision virtualDestinationFolder](self, "virtualDestinationFolder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "accountObjectID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectWithID:", v16);
        v9 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v9 = 0;
      }

    }
  }

  return (ICAccount *)v9;
}

+ (BOOL)shouldCopyThenDeleteWhenMovingObject:(id)a3 toNoteContainer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  int v13;
  char v14;
  void *v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  ICDynamicCast();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  ICDynamicCast();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v7)
    v8 = v7;
  objc_msgSend(v8, "account");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v6;
    objc_msgSend(v11, "account");
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v17 = os_log_create("com.apple.notes", "Move");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        +[ICMoveDecision shouldCopyThenDeleteWhenMovingObject:toNoteContainer:].cold.1((uint64_t)v6, v17, v18, v19, v20, v21, v22, v23);

      v11 = 0;
      v12 = 0;
      LOBYTE(v13) = 0;
      goto LABEL_23;
    }
    v12 = v6;
    v11 = 0;
  }
  if (v10 == v12)
  {
    v13 = objc_msgSend(v11, "isSharedViaICloud");
    if (objc_msgSend(v5, "isSharedViaICloud"))
    {
      v14 = objc_msgSend(v5, "isSharedRootObject");
      if (!v13 || (v14 & 1) != 0)
      {
        v12 = v10;
        LOBYTE(v13) = v13 | v14 ^ 1;
        goto LABEL_23;
      }
      if (v7)
      {
        objc_msgSend(v7, "folder");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isSharedViaSharedFolder:", v11);

      }
      else if (v9)
      {
        v16 = objc_msgSend(v9, "isSharedViaSharedFolder:", v11);
      }
      else
      {
        v16 = 0;
      }
      LOBYTE(v13) = v16 ^ 1;
    }
    v12 = v10;
    goto LABEL_23;
  }
  LOBYTE(v13) = 1;
LABEL_23:

  return v13;
}

- (NSArray)modernSourceObjects
{
  return self->_modernSourceObjects;
}

- (NSArray)htmlSourceObjects
{
  return self->_htmlSourceObjects;
}

- (ICCloudSyncingObject)modernDestination
{
  return self->_modernDestination;
}

- (NoteStoreObject)htmlDestinationFolder
{
  return self->_htmlDestinationFolder;
}

- (ICVirtualSmartFolderItemIdentifier)virtualDestinationFolder
{
  return self->_virtualDestinationFolder;
}

- (unint64_t)type
{
  return self->_type;
}

- (unint64_t)additionalStep
{
  return self->_additionalStep;
}

- (NSArray)guiltyObjects
{
  return self->_guiltyObjects;
}

- (NSArray)modernNotes
{
  return self->_modernNotes;
}

- (void)setModernNotes:(id)a3
{
  objc_storeStrong((id *)&self->_modernNotes, a3);
}

- (NSMutableSet)filteredModernSourceObjects
{
  return self->_filteredModernSourceObjects;
}

- (void)setFilteredModernSourceObjects:(id)a3
{
  objc_storeStrong((id *)&self->_filteredModernSourceObjects, a3);
}

- (NSMutableArray)sanitizedFilteredModernSourceObjects
{
  return self->_sanitizedFilteredModernSourceObjects;
}

- (void)setSanitizedFilteredModernSourceObjects:(id)a3
{
  objc_storeStrong((id *)&self->_sanitizedFilteredModernSourceObjects, a3);
}

- (NSMutableArray)ownedSharedRootObjectsInSource
{
  return self->_ownedSharedRootObjectsInSource;
}

- (void)setOwnedSharedRootObjectsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_ownedSharedRootObjectsInSource, a3);
}

- (NSMutableArray)joinedSharedRootObjectsInSource
{
  return self->_joinedSharedRootObjectsInSource;
}

- (void)setJoinedSharedRootObjectsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_joinedSharedRootObjectsInSource, a3);
}

- (NSMutableArray)readWriteSharedSubObjectsInSource
{
  return self->_readWriteSharedSubObjectsInSource;
}

- (void)setReadWriteSharedSubObjectsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_readWriteSharedSubObjectsInSource, a3);
}

- (NSMutableArray)readOnlySharedSubObjectsInSource
{
  return self->_readOnlySharedSubObjectsInSource;
}

- (void)setReadOnlySharedSubObjectsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_readOnlySharedSubObjectsInSource, a3);
}

- (NSMutableArray)lockedObjectsInSource
{
  return self->_lockedObjectsInSource;
}

- (void)setLockedObjectsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_lockedObjectsInSource, a3);
}

- (NSMutableArray)unsupportedObjectsInSource
{
  return self->_unsupportedObjectsInSource;
}

- (void)setUnsupportedObjectsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_unsupportedObjectsInSource, a3);
}

- (NSArray)modernFoldersInSource
{
  return self->_modernFoldersInSource;
}

- (void)setModernFoldersInSource:(id)a3
{
  objc_storeStrong((id *)&self->_modernFoldersInSource, a3);
}

- (NSMutableSet)accountsOfModernSourceObjects
{
  return self->_accountsOfModernSourceObjects;
}

- (void)setAccountsOfModernSourceObjects:(id)a3
{
  objc_storeStrong((id *)&self->_accountsOfModernSourceObjects, a3);
}

- (NSMutableSet)accountsOfHTMLSourceObjects
{
  return self->_accountsOfHTMLSourceObjects;
}

- (void)setAccountsOfHTMLSourceObjects:(id)a3
{
  objc_storeStrong((id *)&self->_accountsOfHTMLSourceObjects, a3);
}

- (NSMutableArray)privateModernNoteWithAttachmentsInSource
{
  return self->_privateModernNoteWithAttachmentsInSource;
}

- (void)setPrivateModernNoteWithAttachmentsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_privateModernNoteWithAttachmentsInSource, a3);
}

- (NSMutableArray)sharedObjectsNotFromDestinationFolderInSource
{
  return self->_sharedObjectsNotFromDestinationFolderInSource;
}

- (void)setSharedObjectsNotFromDestinationFolderInSource:(id)a3
{
  objc_storeStrong((id *)&self->_sharedObjectsNotFromDestinationFolderInSource, a3);
}

- (NSMutableArray)sharedObjectsInSource
{
  return self->_sharedObjectsInSource;
}

- (void)setSharedObjectsInSource:(id)a3
{
  objc_storeStrong((id *)&self->_sharedObjectsInSource, a3);
}

- (NSMutableArray)systemPaperNotesInSource
{
  return self->_systemPaperNotesInSource;
}

- (void)setSystemPaperNotesInSource:(id)a3
{
  objc_storeStrong((id *)&self->_systemPaperNotesInSource, a3);
}

- (NSMutableArray)nonSystemPaperNotesInSource
{
  return self->_nonSystemPaperNotesInSource;
}

- (void)setNonSystemPaperNotesInSource:(id)a3
{
  objc_storeStrong((id *)&self->_nonSystemPaperNotesInSource, a3);
}

- (NSMutableArray)mathNotesNotesInSource
{
  return self->_mathNotesNotesInSource;
}

- (void)setMathNotesNotesInSource:(id)a3
{
  objc_storeStrong((id *)&self->_mathNotesNotesInSource, a3);
}

- (NSMutableArray)nonMathNotesNotesInSource
{
  return self->_nonMathNotesNotesInSource;
}

- (void)setNonMathNotesNotesInSource:(id)a3
{
  objc_storeStrong((id *)&self->_nonMathNotesNotesInSource, a3);
}

- (NSMutableArray)callNotesInSource
{
  return self->_callNotesInSource;
}

- (void)setCallNotesInSource:(id)a3
{
  objc_storeStrong((id *)&self->_callNotesInSource, a3);
}

- (NSMutableArray)nonCallNotesInSource
{
  return self->_nonCallNotesInSource;
}

- (void)setNonCallNotesInSource:(id)a3
{
  objc_storeStrong((id *)&self->_nonCallNotesInSource, a3);
}

- (BOOL)hasSharedObjectsNotFromDestinationAccountInSource
{
  return self->_hasSharedObjectsNotFromDestinationAccountInSource;
}

- (void)setHasSharedObjectsNotFromDestinationAccountInSource:(BOOL)a3
{
  self->_hasSharedObjectsNotFromDestinationAccountInSource = a3;
}

- (BOOL)hasLockedNotesNotFromDestinationAccountInSource
{
  return self->_hasLockedNotesNotFromDestinationAccountInSource;
}

- (void)setHasLockedNotesNotFromDestinationAccountInSource:(BOOL)a3
{
  self->_hasLockedNotesNotFromDestinationAccountInSource = a3;
}

- (BOOL)hasSanitizedAndScreenedModernSourceObjects
{
  return self->_hasSanitizedAndScreenedModernSourceObjects;
}

- (void)setHasSanitizedAndScreenedModernSourceObjects:(BOOL)a3
{
  self->_hasSanitizedAndScreenedModernSourceObjects = a3;
}

- (BOOL)allowsManagedToUnmanagedMove
{
  return self->_allowsManagedToUnmanagedMove;
}

- (void)setAllowsManagedToUnmanagedMove:(BOOL)a3
{
  self->_allowsManagedToUnmanagedMove = a3;
}

- (BOOL)allowsUnmanagedToManagedMove
{
  return self->_allowsUnmanagedToManagedMove;
}

- (void)setAllowsUnmanagedToManagedMove:(BOOL)a3
{
  self->_allowsUnmanagedToManagedMove = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonCallNotesInSource, 0);
  objc_storeStrong((id *)&self->_callNotesInSource, 0);
  objc_storeStrong((id *)&self->_nonMathNotesNotesInSource, 0);
  objc_storeStrong((id *)&self->_mathNotesNotesInSource, 0);
  objc_storeStrong((id *)&self->_nonSystemPaperNotesInSource, 0);
  objc_storeStrong((id *)&self->_systemPaperNotesInSource, 0);
  objc_storeStrong((id *)&self->_sharedObjectsInSource, 0);
  objc_storeStrong((id *)&self->_sharedObjectsNotFromDestinationFolderInSource, 0);
  objc_storeStrong((id *)&self->_privateModernNoteWithAttachmentsInSource, 0);
  objc_storeStrong((id *)&self->_accountsOfHTMLSourceObjects, 0);
  objc_storeStrong((id *)&self->_accountsOfModernSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernFoldersInSource, 0);
  objc_storeStrong((id *)&self->_unsupportedObjectsInSource, 0);
  objc_storeStrong((id *)&self->_lockedObjectsInSource, 0);
  objc_storeStrong((id *)&self->_readOnlySharedSubObjectsInSource, 0);
  objc_storeStrong((id *)&self->_readWriteSharedSubObjectsInSource, 0);
  objc_storeStrong((id *)&self->_joinedSharedRootObjectsInSource, 0);
  objc_storeStrong((id *)&self->_ownedSharedRootObjectsInSource, 0);
  objc_storeStrong((id *)&self->_sanitizedFilteredModernSourceObjects, 0);
  objc_storeStrong((id *)&self->_filteredModernSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernNotes, 0);
  objc_storeStrong((id *)&self->_guiltyObjects, 0);
  objc_storeStrong((id *)&self->_virtualDestinationFolder, 0);
  objc_storeStrong((id *)&self->_htmlDestinationFolder, 0);
  objc_storeStrong((id *)&self->_modernDestination, 0);
  objc_storeStrong((id *)&self->_htmlSourceObjects, 0);
  objc_storeStrong((id *)&self->_modernSourceObjects, 0);
}

- (void)accountForObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Can't get account because object is neither an ICNote or ICFolder: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)htmlAccountForObject:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "Can't get account because object is neither an ICLegacyNote or ICLegacyFolder: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

+ (void)shouldCopyThenDeleteWhenMovingObject:(uint64_t)a3 toNoteContainer:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1AC7A1000, a2, a3, "shouldCopyThenDeleteWhenMovingObject received an unrecognized destinationContainer %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
