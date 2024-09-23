@implementation CACRecordedUserAction

- (CACRecordedUserAction)initWithSpokenCommand:(id)a3
{
  id v5;
  CACRecordedUserAction *v6;
  CACRecordedUserAction *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  NSDictionary *targetAttributes;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CACRecordedUserAction;
  v6 = -[CACRecordedUserAction init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 1;
    objc_storeStrong(&v6->_object, a3);
    objc_msgSend(v5, "identifier");
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v7->_identifier;
    v7->_identifier = (NSString *)v8;

    -[CACRecordedUserAction _derivedTargetAttributesFromSpokenCommand:](v7, "_derivedTargetAttributesFromSpokenCommand:", v5);
    v10 = objc_claimAutoreleasedReturnValue();
    targetAttributes = v7->_targetAttributes;
    v7->_targetAttributes = (NSDictionary *)v10;

  }
  return v7;
}

- (id)spokenCommand
{
  id object;

  if (-[CACRecordedUserAction isSpokenCommand](self, "isSpokenCommand"))
    object = self->_object;
  else
    object = 0;
  return object;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", 1, CFSTR("Version"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_type, CFSTR("Type"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("CommandIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_targetAttributes, CFSTR("TargetAttributes"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_canIgnoreFailure, CFSTR("CanIgnoreFailure"));

}

- (CACRecordedUserAction)initWithCoder:(id)a3
{
  id v4;
  CACRecordedUserAction *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  NSDictionary *targetAttributes;
  void *v16;
  uint64_t v17;
  id object;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CACRecordedUserAction;
  v5 = -[CACRecordedUserAction init](&v20, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("Type"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CommandIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = (void *)MEMORY[0x24BDBCF20];
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = objc_opt_class();
    objc_msgSend(v8, "setWithObjects:", v9, v10, v11, v12, objc_opt_class(), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v13, CFSTR("TargetAttributes"));
    v14 = objc_claimAutoreleasedReturnValue();
    targetAttributes = v5->_targetAttributes;
    v5->_targetAttributes = (NSDictionary *)v14;

    v5->_canIgnoreFailure = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("CanIgnoreFailure"));
    if (v5->_type == 1)
    {
      if (v5->_identifier)
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "copySupportedCommandWithIdentifier:", v5->_identifier);
        object = v5->_object;
        v5->_object = (id)v17;

        objc_msgSend(v5->_object, "setExecutedIndirectly:", 1);
      }
    }
  }

  return v5;
}

- (id)_dictionaryFromRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = objc_alloc(MEMORY[0x24BDBCE70]);
  *(float *)&v8 = x;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v10 = y;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v12 = width;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v14 = height;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v7, "initWithObjectsAndKeys:", v9, CFSTR("x"), v11, CFSTR("y"), v13, CFSTR("width"), v15, CFSTR("height"), 0);

  return v16;
}

- (CGRect)_rectFromDictionary:(id)a3
{
  id v3;
  void *v4;
  float v5;
  double v6;
  void *v7;
  float v8;
  double v9;
  void *v10;
  float v11;
  double v12;
  void *v13;
  float v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");
  v6 = v5;
  objc_msgSend(v3, "objectForKey:", CFSTR("y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;
  objc_msgSend(v3, "objectForKey:", CFSTR("width"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "floatValue");
  v12 = v11;
  objc_msgSend(v3, "objectForKey:", CFSTR("height"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "floatValue");
  v15 = v14;

  v16 = v6;
  v17 = v9;
  v18 = v12;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_derivedTargetAttributesFromSpokenCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  void *v58;
  CACRecordedUserAction *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _BYTE v73[128];
  _QWORD v74[10];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v59 = self;
  if (self->_type == 1)
  {
    v51 = v4;
    objc_msgSend(v4, "recognizedParameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    objc_msgSend(v6, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
    if (!v8)
      goto LABEL_57;
    v9 = v8;
    v10 = 0x24BDBC000uLL;
    v11 = (_QWORD *)MEMORY[0x24BEAFF30];
    v12 = *(_QWORD *)v70;
    v53 = v6;
    v54 = v5;
    v52 = v7;
    v56 = *(_QWORD *)v70;
    while (1)
    {
      v13 = 0;
      v55 = v9;
      do
      {
        if (*(_QWORD *)v70 != v12)
          objc_enumerationMutation(v7);
        v61 = v13;
        v14 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v13);
        if ((objc_msgSend(v14, "isEqualToString:", kCACCommandParameterText) & 1) != 0
          || objc_msgSend(v14, "isEqualToString:", kCACCommandParameterTextVariants))
        {
          objc_msgSend(v6, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKey:", v15, v14);
          goto LABEL_10;
        }
        v16 = *MEMORY[0x24BEAFEF0];
        v74[0] = *v11;
        v74[1] = v16;
        v17 = *MEMORY[0x24BEAFF50];
        v74[2] = *MEMORY[0x24BEAFEF8];
        v74[3] = v17;
        v18 = *MEMORY[0x24BEAFF28];
        v74[4] = *MEMORY[0x24BEAFF20];
        v74[5] = v18;
        v19 = *MEMORY[0x24BEAFF40];
        v74[6] = *MEMORY[0x24BEAFEE8];
        v74[7] = v19;
        v20 = *MEMORY[0x24BEAFF18];
        v74[8] = *MEMORY[0x24BEAFF10];
        v74[9] = v20;
        objc_msgSend(*(id *)(v10 + 3632), "arrayWithObjects:count:", v74, 10);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "containsObject:", v14);

        v12 = v56;
        if (v22)
        {
          v15 = (void *)objc_opt_new();
          v58 = v14;
          objc_msgSend(v6, "objectForKey:", v14);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          objc_msgSend(v23, "allKeys");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
          if (!v25)
            goto LABEL_55;
          v26 = v25;
          v27 = *(_QWORD *)v66;
          v60 = v24;
          while (1)
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v66 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v28);
              if ((objc_msgSend(v29, "isEqualToString:", kCACCommandParameterText) & 1) != 0
                || (objc_msgSend(v29, "isEqualToString:", kCACCommandParameterTextVariants) & 1) != 0
                || (objc_msgSend(v29, "isEqualToString:", kCACCommandParameterMatchingApps) & 1) != 0
                || (objc_msgSend(v29, "isEqualToString:", kCACCommandParameterAppIdentifier) & 1) != 0
                || objc_msgSend(v29, "isEqualToString:", kCACCommandParameterAttributedText))
              {
                objc_msgSend(v23, "objectForKey:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "setObject:forKey:", v30, v29);
                goto LABEL_25;
              }
              if ((objc_msgSend(v29, "isEqualToString:", kCACCommandParameterLabeledElement) & 1) != 0
                || objc_msgSend(v29, "isEqualToString:", kCACCommandParameterLabeledElementForDisambiguation))
              {
                objc_msgSend(v23, "objectForKey:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "element");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = v31;
                v64 = (void *)objc_opt_new();
                if (v31)
                {
                  objc_msgSend(v31, "frame");
                  -[CACRecordedUserAction _dictionaryFromRect:](v59, "_dictionaryFromRect:");
                  v32 = v31;
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setObject:forKey:", v33, CFSTR("ScreenRect"));

                  objc_msgSend(v32, "uiElement");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "stringWithAXAttribute:", 5019);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v35, "length"))
                    objc_msgSend(v64, "setObject:forKey:", v35, CFSTR("AXElementIdentifier"));
                  v62 = v35;
                  if (objc_msgSend(v58, "isEqualToString:", *MEMORY[0x24BEAFF50]))
                  {
                    objc_msgSend(v23, "objectForKey:", kCACCommandParameterText);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v36, "length"))
                      objc_msgSend(v64, "setObject:forKey:", v36, CFSTR("AXElementLabel"));
                    objc_msgSend(v64, "setObject:forKey:", CFSTR("ItemName"), CFSTR("RecordedApproach"));
                    goto LABEL_51;
                  }
                  if ((objc_msgSend(v58, "isEqualToString:", *MEMORY[0x24BEAFF20]) & 1) != 0
                    || objc_msgSend(v58, "isEqualToString:", *MEMORY[0x24BEAFF28]))
                  {
                    objc_msgSend(v63, "recognitionStrings");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v45, "firstObject");
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v36, "length"))
                      objc_msgSend(v64, "setObject:forKey:", v36, CFSTR("AXElementLabel"));
                    objc_msgSend(v23, "objectForKey:", kCACCommandParameterText);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v46)
                      objc_msgSend(v64, "setObject:forKey:", v46, CFSTR("NumberedLabel"));
                    objc_msgSend(v64, "setObject:forKey:", CFSTR("ItemNumber"), CFSTR("RecordedApproach"));

LABEL_51:
                  }
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v29, "isEqualToString:", kCACCommandParameterLabeledElementForDisambiguation));
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = v64;
                  objc_msgSend(v64, "setObject:forKey:", v47, CFSTR("RequiredDisambiguation"));

                  objc_msgSend(v15, "setObject:forKey:", v64, CFSTR("MatchingCriteria"));
                }
                else
                {
                  objc_msgSend(0, "recognitionStrings");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v37, "firstObject");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();

                  if (objc_msgSend(v38, "length"))
                    objc_msgSend(v64, "setObject:forKey:", v38, CFSTR("AXElementLabel"));
                  v62 = v38;
                  objc_msgSend(v30, "rectangle");
                  -[CACRecordedUserAction _dictionaryFromRect:](v59, "_dictionaryFromRect:");
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v64, "setObject:forKey:", v39, CFSTR("ScreenRect"));

                  objc_msgSend(v30, "numberedLabel");
                  v40 = objc_claimAutoreleasedReturnValue();
                  if (v40)
                    objc_msgSend(v64, "setObject:forKey:", v40, CFSTR("NumberedLabel"));
                  v57 = (void *)v40;
                  objc_msgSend(v30, "element");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "uiElement");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "stringWithAXAttribute:", 5019);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  v44 = v64;
                  if (objc_msgSend(v43, "length"))
                    objc_msgSend(v64, "setObject:forKey:", v43, CFSTR("AXElementIdentifier"));
                  objc_msgSend(v64, "setObject:forKey:", CFSTR("GridNumber"), CFSTR("RecordedApproach"));
                  objc_msgSend(v15, "setObject:forKey:", v64, CFSTR("MatchingCriteria"));

                }
                v24 = v60;
LABEL_25:

              }
              ++v28;
            }
            while (v26 != v28);
            v48 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v65, v73, 16);
            v26 = v48;
            if (!v48)
            {
LABEL_55:

              v5 = v54;
              objc_msgSend(v54, "setObject:forKey:", v15, v58);

              v7 = v52;
              v6 = v53;
              v9 = v55;
              v12 = v56;
              v10 = 0x24BDBC000;
              v11 = (_QWORD *)MEMORY[0x24BEAFF30];
LABEL_10:

              break;
            }
          }
        }
        v13 = v61 + 1;
      }
      while (v61 + 1 != v9);
      v49 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      v9 = v49;
      if (!v49)
      {
LABEL_57:

        v4 = v51;
        break;
      }
    }
  }

  return v5;
}

- (id)_labeledElementsFromMatchingCriteria:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  id v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  int v54;
  id v55;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CACLabeledElement *v66;
  CACLabeledElement *v67;
  void *v68;
  void *v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  void *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  CACLabeledElement *v85;
  id v86;
  id v87;
  id v88;
  id v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v92 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "labeledScreenElementsCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copyTableOfCollectedElementsByTitle");

  objc_msgSend(v3, "objectForKey:", CFSTR("AXElementLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v3;
  if (v7)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("AXElementLabel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  if ((unint64_t)objc_msgSend(v10, "count") >= 2)
  {
    objc_msgSend(v3, "objectForKey:", CFSTR("RecordedApproach"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("ItemName"));

    if ((v12 & 1) == 0)
    {

      v10 = 0;
    }
  }
  if (objc_msgSend(v10, "count"))
  {
    v13 = v10;
    v14 = 0;
LABEL_9:
    v15 = 0;
    v16 = 0;
    goto LABEL_52;
  }
  v68 = v10;
  v69 = v6;
  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  objc_msgSend(v6, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v17 = v3;
  v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
  v18 = 0;
  v15 = 0;
  v16 = 0;
  if (v72)
  {
    v71 = *(_QWORD *)v82;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v82 != v71)
          objc_enumerationMutation(obj);
        v73 = v19;
        v20 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * v19);
        v77 = 0u;
        v78 = 0u;
        v79 = 0u;
        v80 = 0u;
        v74 = v20;
        v21 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v78;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v78 != v23)
                objc_enumerationMutation(v74);
              v25 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
              objc_msgSend(v17, "objectForKey:", CFSTR("NumberedLabel"));
              v26 = objc_claimAutoreleasedReturnValue();
              v27 = (void *)v26;
              if (!v15 && v26)
              {
                objc_msgSend(v25, "numberedLabel");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                v29 = objc_msgSend(v28, "isEqualToString:", v27);

                if (v29)
                  v15 = v25;
                else
                  v15 = 0;
                v17 = v76;
              }
              v30 = v15;
              objc_msgSend(v17, "objectForKey:", CFSTR("AXElementIdentifier"));
              v31 = objc_claimAutoreleasedReturnValue();
              v32 = (void *)v31;
              v33 = v18;
              if (!v16 && v31)
              {
                objc_msgSend(v25, "axIdentifier");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "isEqualToString:", v32);

                if (v35)
                  v16 = v25;
                else
                  v16 = 0;
              }
              objc_msgSend(v76, "objectForKey:", CFSTR("ScreenRect"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              -[CACRecordedUserAction _rectFromDictionary:](self, "_rectFromDictionary:", v36);
              v38 = v37;
              v40 = v39;
              v42 = v41;
              v44 = v43;

              v18 = v33;
              v15 = v30;
              if (!v18)
              {
                v93.origin.x = v38;
                v93.origin.y = v40;
                v93.size.width = v42;
                v93.size.height = v44;
                if (CGRectIsEmpty(v93))
                  goto LABEL_35;
                objc_msgSend(v25, "rectangle");
                v95.origin.x = v45;
                v95.origin.y = v46;
                v95.size.width = v47;
                v95.size.height = v48;
                v94.origin.x = v38;
                v94.origin.y = v40;
                v94.size.width = v42;
                v94.size.height = v44;
                if (!CGRectEqualToRect(v94, v95))
LABEL_35:
                  v18 = 0;
                else
                  v18 = v25;
              }

              v17 = v76;
            }
            v22 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v77, v90, 16);
          }
          while (v22);
        }

        v19 = v73 + 1;
      }
      while (v73 + 1 != v72);
      v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v91, 16);
    }
    while (v72);
  }
  v49 = v18;

  objc_msgSend(v17, "objectForKey:", CFSTR("RecordedApproach"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "isEqualToString:", CFSTR("ItemNumber")))
  {

    v10 = v68;
    v6 = v69;
LABEL_43:
    if (!v15)
    {
      v14 = v49;
      if (v16)
      {
        v88 = v16;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v88, 1);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        v15 = 0;
        goto LABEL_52;
      }
      if (!v49)
      {
        v15 = 0;
        v16 = 0;
        v13 = 0;
        goto LABEL_52;
      }
      v87 = v49;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v87, 1);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    v89 = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v89, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_51:
    v14 = v49;
    goto LABEL_52;
  }
  objc_msgSend(v17, "objectForKey:", CFSTR("RecordedApproach"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "isEqualToString:", CFSTR("ItemName"));

  v10 = v68;
  v6 = v69;
  if (v52)
    goto LABEL_43;
  objc_msgSend(v76, "objectForKey:", CFSTR("RecordedApproach"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "isEqualToString:", CFSTR("GridNumber"));

  if (!v54)
  {
    v13 = 0;
    goto LABEL_51;
  }
  if (v49)
  {
    v14 = v49;
    v86 = v49;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v86, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v76, "objectForKey:", CFSTR("ScreenRect"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[CACRecordedUserAction _rectFromDictionary:](self, "_rectFromDictionary:", v57);
    v59 = v58;
    v61 = v60;
    v63 = v62;
    v65 = v64;

    v66 = [CACLabeledElement alloc];
    v67 = -[CACLabeledElement initWithElement:recognitionStrings:rectangle:](v66, "initWithElement:recognitionStrings:rectangle:", 0, MEMORY[0x24BDBD1A8], v59, v61, v63, v65);
    v85 = v67;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v85, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
  }
LABEL_52:
  v55 = v13;

  return v55;
}

- (void)beginExecutingWithCompletionBlock:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (self->_type == 1)
  {
    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke;
    v7[3] = &unk_24F2AA990;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

  }
  else
  {
    CACMakeError(3006, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v6);

  }
}

void __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  id *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  id *v29;
  void *v30;
  void *v31;
  void *v32;
  unint64_t v33;
  id *v34;
  void *v35;
  void *v36;
  BOOL v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *WeakRetained;
  unint64_t v44;
  id v45;
  id v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id obj;
  uint64_t v61;
  uint64_t v62;
  _QWORD v63[4];
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[2];
  uint64_t v70;
  _QWORD v71[9];
  _BYTE v72[128];
  uint64_t v73;

  v1 = a1;
  v73 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v3 = 12;
  while (!objc_msgSend(v2, "isListening"))
  {
    if (v3 < 1)
      goto LABEL_11;
LABEL_9:
    usleep(0x3D090u);
    --v3;
  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isSynchronizingRecognizers") & 1) != 0)
  {
LABEL_6:

    if (v3 <= 0)
      goto LABEL_11;
    goto LABEL_9;
  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isFetchingElements") & 1) != 0)
  {

    goto LABEL_6;
  }

LABEL_11:
  if (!objc_msgSend(v2, "isListening"))
  {
    v48 = *(_QWORD *)(v1 + 40);
    +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandPlayback.Error.NotAppropriateForContext"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    CACMakeError(3002, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v48 + 16))(v48, v50);

    goto LABEL_54;
  }
  v56 = v2;
  v6 = (void *)objc_opt_new();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v57 = v6;
  v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
  if (!v62)
  {
LABEL_44:

    v2 = v56;
LABEL_52:
    v54 = v57;
    objc_msgSend(v2, "setRecognizedParameters:", v57, v56);
    v63[0] = MEMORY[0x24BDAC760];
    v63[1] = 3221225472;
    v63[2] = __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke_2;
    v63[3] = &unk_24F2ABE20;
    v64 = *(id *)(v1 + 40);
    objc_msgSend(v2, "setCompletionBlock:", v63);
    +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleRecognizedCommand:", v2);

    v53 = v64;
    goto LABEL_53;
  }
  v61 = *(_QWORD *)v66;
  v7 = 0x24BDBC000uLL;
  v8 = (_QWORD *)MEMORY[0x24BEAFF18];
  v59 = v1;
  while (2)
  {
    v9 = 0;
LABEL_15:
    if (*(_QWORD *)v66 != v61)
      objc_enumerationMutation(obj);
    v10 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * v9);
    v71[0] = kCACCommandParameterText;
    v71[1] = kCACCommandParameterTextVariants;
    v11 = *MEMORY[0x24BEAFEF0];
    v71[2] = *MEMORY[0x24BEAFF30];
    v71[3] = v11;
    v12 = *MEMORY[0x24BEAFEE8];
    v71[4] = *MEMORY[0x24BEAFEF8];
    v71[5] = v12;
    v13 = *MEMORY[0x24BEAFF10];
    v71[6] = *MEMORY[0x24BEAFF40];
    v71[7] = v13;
    v71[8] = *v8;
    objc_msgSend(*(id *)(v7 + 3632), "arrayWithObjects:count:", v71, 9, v56);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "containsObject:", v10);

    if (v15)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 24), "objectForKey:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v16, v10);
      goto LABEL_41;
    }
    v70 = *MEMORY[0x24BEAFF50];
    objc_msgSend(*(id *)(v7 + 3632), "arrayWithObjects:count:", &v70, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "containsObject:", v10);

    if (!v18)
    {
      v25 = *MEMORY[0x24BEAFF28];
      v69[0] = *MEMORY[0x24BEAFF20];
      v69[1] = v25;
      objc_msgSend(*(id *)(v7 + 3632), "arrayWithObjects:count:", v69, 2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "containsObject:", v10);

      v7 = 0x24BDBC000;
      if (v27)
      {
        v28 = (void *)objc_opt_new();
        v29 = *(id **)(v1 + 32);
        objc_msgSend(v29[3], "objectForKey:", v10);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectForKey:", CFSTR("MatchingCriteria"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "_labeledElementsFromMatchingCriteria:", v31);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count") != 1)
        {
          +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandPlayback.Error.CannotFindElementNumber"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          CACMakeError(3005, v51);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_50;
        }
        objc_msgSend(v23, "firstObject");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setObject:forKey:", v32, kCACCommandParameterLabeledElement);

        objc_msgSend(v6, "setObject:forKey:", v28, v10);
        v7 = 0x24BDBC000;
        v16 = v28;
        goto LABEL_41;
      }
LABEL_42:
      if (++v9 == v62)
      {
        v62 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v72, 16);
        if (v62)
          continue;
        goto LABEL_44;
      }
      goto LABEL_15;
    }
    break;
  }
  v58 = (void *)objc_opt_new();
  v19 = *(id **)(v1 + 32);
  objc_msgSend(v19[3], "objectForKey:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKey:", CFSTR("MatchingCriteria"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_labeledElementsFromMatchingCriteria:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v22, "count"))
  {
    v23 = v22;
    v24 = v59;
  }
  else
  {
    v33 = 20;
    v24 = v59;
    do
    {
      v34 = *(id **)(v59 + 32);
      objc_msgSend(v34[3], "objectForKey:", v10);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectForKey:", CFSTR("MatchingCriteria"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "_labeledElementsFromMatchingCriteria:", v36);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      usleep(0x3D090u);
      if (objc_msgSend(v23, "count"))
        v37 = 0;
      else
        v37 = v33 > 1;
      --v33;
      v22 = v23;
    }
    while (v37);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(v24 + 32) + 24), "objectForKey:", v10);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "objectForKey:", CFSTR("MatchingCriteria"));
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "objectForKey:", CFSTR("RequiredDisambiguation"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "BOOLValue");

  if (objc_msgSend(v23, "count") == 1)
  {
    objc_msgSend(v23, "firstObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v58;
    objc_msgSend(v58, "setObject:forKey:", v42, kCACCommandParameterLabeledElement);

    v6 = v57;
    v7 = 0x24BDBC000;
    v1 = v59;
    v8 = (_QWORD *)MEMORY[0x24BEAFF18];
    if (v41)
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(v59 + 32) + 48));
      objc_msgSend(WeakRetained, "setSkipNextAction:", 1);
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  v44 = objc_msgSend(v23, "count");
  v6 = v57;
  v1 = v59;
  v8 = (_QWORD *)MEMORY[0x24BEAFF18];
  if (v44 >= 2)
  {
    v7 = 0x24BDBC000;
    if (!v41)
      goto LABEL_46;
    v45 = objc_loadWeakRetained((id *)(*(_QWORD *)(v59 + 32) + 48));
    if (objc_msgSend(v45, "doesNextSpokenCommandMatchIdentifier:", CFSTR("System.OverlayChooseLabel")))
    {

    }
    else
    {
      v46 = objc_loadWeakRetained((id *)(*(_QWORD *)(v59 + 32) + 48));
      v47 = objc_msgSend(v46, "doesNextSpokenCommandMatchIdentifier:", CFSTR("System.OverlayChooseLabelWithoutPrefix"));

      v7 = 0x24BDBC000;
      if (!v47)
      {
LABEL_46:
        +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandPlayback.Error.UnexpectedDisambiguation"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 3003;
        goto LABEL_49;
      }
    }
    objc_msgSend(v23, "firstObject");
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v58;
    objc_msgSend(v58, "setObject:forKey:", WeakRetained, kCACCommandParameterLabeledElementForDisambiguation);
LABEL_39:

LABEL_40:
    objc_msgSend(v6, "setObject:forKey:", v16, v10);

LABEL_41:
    goto LABEL_42;
  }
  +[CACLocaleUtilities localizedUIStringForKey:](CACLocaleUtilities, "localizedUIStringForKey:", CFSTR("CommandPlayback.Error.CannotFindElementName"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 3004;
LABEL_49:
  CACMakeError(v52, v51);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v58;
LABEL_50:

  v2 = v56;
  if (!v53)
    goto LABEL_52;
  (*(void (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  v54 = v57;
LABEL_53:

LABEL_54:
}

uint64_t __59__CACRecordedUserAction_beginExecutingWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)isSpokenCommand
{
  return self->_type == 1;
}

- (BOOL)isReplayableGesture
{
  return self->_type == 2;
}

- (BOOL)canIgnoreFailure
{
  return self->_canIgnoreFailure;
}

- (id)plistDescription
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("UserActionTypeValue"));

  v22 = v3;
  if (self->_object)
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("UserActionTypeDescription"));

  }
  else
  {
    objc_msgSend(v3, "setObject:forKey:", CFSTR("Unknown"), CFSTR("UserActionTypeDescription"));
  }
  v7 = (void *)objc_opt_new();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v8 = self->_targetAttributes;
  v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v24;
    v12 = MEMORY[0x24BDBD1A8];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v8);
        v14 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        if ((objc_msgSend(&unk_24F2CF548, "containsObject:", v14) & 1) != 0)
        {
          objc_msgSend(v7, "setObject:forKey:", v12, v14);
        }
        else
        {
          -[NSDictionary objectForKey:](self->_targetAttributes, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v15, v14);

        }
      }
      v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  objc_msgSend(v22, "setObject:forKey:", v7, CFSTR("UserActionTargetAttributes"));
  if (self->_type == 1)
  {
    v16 = self->_object;
    objc_msgSend(v16, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKey:", v17, CFSTR("SpokenCommandIdentifier"));

    if (objc_msgSend(v16, "action"))
    {
      NSStringFromSelector((SEL)objc_msgSend(v16, "action"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v18, CFSTR("SpokenCommandAction"));

    }
    objc_msgSend(v16, "contextEvaluation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v16, "contextEvaluation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKey:", v20, CFSTR("SpokenCommandContext"));

    }
  }

  return v22;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("User Action: (%ld) %@, attributes: %@"), self->_type, self->_object, self->_targetAttributes);
}

- (CACRecordedUserActionFlow)ownerFlow
{
  return (CACRecordedUserActionFlow *)objc_loadWeakRetained((id *)&self->_ownerFlow);
}

- (void)setOwnerFlow:(id)a3
{
  objc_storeWeak((id *)&self->_ownerFlow, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_ownerFlow);
  objc_storeStrong(&self->_object, 0);
  objc_storeStrong((id *)&self->_targetAttributes, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
