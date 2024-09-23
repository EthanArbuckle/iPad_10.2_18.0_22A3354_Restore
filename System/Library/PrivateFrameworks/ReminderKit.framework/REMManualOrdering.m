@implementation REMManualOrdering

+ (id)objectIDWithUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "cdEntityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMObjectID objectIDWithUUID:entityName:](REMObjectID, "objectIDWithUUID:entityName:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cdEntityName
{
  return CFSTR("REMCDManualSortHint_v1");
}

- (REMManualOrdering)initWithObjectID:(id)a3 listType:(signed __int16)a4 listID:(id)a5 topLevelElementIDs:(id)a6 secondaryLevelElementIDsByTopLevelElementID:(id)a7 uncommitedElementsAccountID:(id)a8 modifiedDate:(id)a9
{
  id v15;
  id v16;
  id v17;
  REMManualOrdering *v18;
  REMManualOrdering *v19;
  id v22;
  id v23;
  id v24;
  objc_super v25;

  v24 = a3;
  v23 = a5;
  v22 = a6;
  v15 = a7;
  v16 = a8;
  v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)REMManualOrdering;
  v18 = -[REMManualOrdering init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_objectID, a3);
    v19->_listType = a4;
    objc_storeStrong((id *)&v19->_listID, a5);
    objc_storeStrong((id *)&v19->_topLevelElementIDs, a6);
    objc_storeStrong((id *)&v19->_secondaryLevelElementIDsByTopLevelElementID, a7);
    objc_storeStrong((id *)&v19->_uncommitedElementsAccountID, a8);
    objc_storeStrong((id *)&v19->_modifiedDate, a9);
  }

  return v19;
}

- (REMManualOrdering)initWithObjectID:(id)a3 listType:(signed __int16)a4 listID:(id)a5 modifiedDate:(id)a6
{
  return -[REMManualOrdering initWithObjectID:listType:listID:topLevelElementIDs:secondaryLevelElementIDsByTopLevelElementID:uncommitedElementsAccountID:modifiedDate:](self, "initWithObjectID:listType:listID:topLevelElementIDs:secondaryLevelElementIDsByTopLevelElementID:uncommitedElementsAccountID:modifiedDate:", a3, a4, a5, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], 0, a6);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  REMManualOrdering *v15;

  -[REMManualOrdering objectID](self, "objectID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[REMManualOrdering listType](self, "listType");
  -[REMManualOrdering listID](self, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0C99D20]);
  -[REMManualOrdering topLevelElementIDs](self, "topLevelElementIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithArray:copyItems:", v8, 1);

  v10 = objc_alloc(MEMORY[0x1E0C99D80]);
  -[REMManualOrdering secondaryLevelElementIDsByTopLevelElementID](self, "secondaryLevelElementIDsByTopLevelElementID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithDictionary:copyItems:", v11, 1);

  -[REMManualOrdering uncommitedElementsAccountID](self, "uncommitedElementsAccountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMManualOrdering modifiedDate](self, "modifiedDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[REMManualOrdering initWithObjectID:listType:listID:topLevelElementIDs:secondaryLevelElementIDsByTopLevelElementID:uncommitedElementsAccountID:modifiedDate:]([REMManualOrdering alloc], "initWithObjectID:listType:listID:topLevelElementIDs:secondaryLevelElementIDsByTopLevelElementID:uncommitedElementsAccountID:modifiedDate:", v4, v5, v6, v9, v12, v13, v14);

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[REMManualOrdering objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMManualOrdering listType](self, "listType"), CFSTR("listType"));
  -[REMManualOrdering listID](self, "listID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("listID"));

  -[REMManualOrdering topLevelElementIDs](self, "topLevelElementIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("topLevelElementIDs"));

  -[REMManualOrdering secondaryLevelElementIDsByTopLevelElementID](self, "secondaryLevelElementIDsByTopLevelElementID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("secondaryLevelElementIDsByTopLevelElementID"));

  -[REMManualOrdering uncommitedElementsAccountID](self, "uncommitedElementsAccountID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("uncommitedElementsAccountID"));

  -[REMManualOrdering modifiedDate](self, "modifiedDate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("modifiedDate"));

}

- (REMManualOrdering)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REMManualOrdering *v18;
  REMManualOrdering *v19;
  REMManualOrdering *v20;
  signed __int16 v22;
  objc_super v23;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("listType"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("topLevelElementIDs"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0C99E60];
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v11, "setWithObjects:", v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("secondaryLevelElementIDsByTopLevelElementID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uncommitedElementsAccountID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modifiedDate"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0;
  if (v5 && v6 && v10 && v15 && v17)
  {
    v23.receiver = self;
    v23.super_class = (Class)REMManualOrdering;
    v19 = -[REMManualOrdering init](&v23, sel_init);
    v20 = v19;
    if (v19)
    {
      objc_storeStrong((id *)&v19->_objectID, v5);
      v20->_listType = v22;
      objc_storeStrong((id *)&v20->_listID, v6);
      objc_storeStrong((id *)&v20->_topLevelElementIDs, v10);
      objc_storeStrong((id *)&v20->_secondaryLevelElementIDsByTopLevelElementID, v15);
      objc_storeStrong((id *)&v20->_uncommitedElementsAccountID, v16);
      objc_storeStrong((id *)&v20->_modifiedDate, v17);
    }
    self = v20;
    v18 = self;
  }

  return v18;
}

+ (id)newObjectID
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectIDWithUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  char v36;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_21;
  -[REMManualOrdering objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectID");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v5 == (void *)v6)
  {

  }
  else
  {
    v7 = (void *)v6;
    -[REMManualOrdering objectID](self, "objectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqual:", v9);

    if (!v10)
      goto LABEL_21;
  }
  v11 = -[REMManualOrdering listType](self, "listType");
  if (v11 != objc_msgSend(v4, "listType"))
  {
LABEL_21:
    v36 = 0;
    goto LABEL_22;
  }
  -[REMManualOrdering listID](self, "listID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "listID");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v12 == (void *)v13)
  {

  }
  else
  {
    v14 = (void *)v13;
    -[REMManualOrdering listID](self, "listID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "listID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_21;
  }
  -[REMManualOrdering topLevelElementIDs](self, "topLevelElementIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topLevelElementIDs");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v18 == (void *)v19)
  {

  }
  else
  {
    v20 = (void *)v19;
    -[REMManualOrdering topLevelElementIDs](self, "topLevelElementIDs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "topLevelElementIDs");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqual:", v22);

    if (!v23)
      goto LABEL_21;
  }
  -[REMManualOrdering secondaryLevelElementIDsByTopLevelElementID](self, "secondaryLevelElementIDsByTopLevelElementID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryLevelElementIDsByTopLevelElementID");
  v25 = objc_claimAutoreleasedReturnValue();
  if (v24 == (void *)v25)
  {

  }
  else
  {
    v26 = (void *)v25;
    -[REMManualOrdering secondaryLevelElementIDsByTopLevelElementID](self, "secondaryLevelElementIDsByTopLevelElementID");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "secondaryLevelElementIDsByTopLevelElementID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v27, "isEqual:", v28);

    if (!v29)
      goto LABEL_21;
  }
  -[REMManualOrdering uncommitedElementsAccountID](self, "uncommitedElementsAccountID");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uncommitedElementsAccountID");
  v31 = objc_claimAutoreleasedReturnValue();
  if (v30 == (void *)v31)
  {

  }
  else
  {
    v32 = (void *)v31;
    -[REMManualOrdering uncommitedElementsAccountID](self, "uncommitedElementsAccountID");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uncommitedElementsAccountID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v33, "isEqual:", v34);

    if (!v35)
      goto LABEL_21;
  }
  -[REMManualOrdering modifiedDate](self, "modifiedDate");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modifiedDate");
  v39 = objc_claimAutoreleasedReturnValue();
  if (v38 == (void *)v39)
  {
    v36 = 1;
    v40 = v38;
  }
  else
  {
    v40 = (void *)v39;
    -[REMManualOrdering modifiedDate](self, "modifiedDate");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modifiedDate");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v41, "isEqual:", v42);

  }
LABEL_22:

  return v36;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (signed)listType
{
  return self->_listType;
}

- (NSString)listID
{
  return self->_listID;
}

- (NSArray)topLevelElementIDs
{
  return self->_topLevelElementIDs;
}

- (NSDictionary)secondaryLevelElementIDsByTopLevelElementID
{
  return self->_secondaryLevelElementIDsByTopLevelElementID;
}

- (REMObjectID)uncommitedElementsAccountID
{
  return self->_uncommitedElementsAccountID;
}

- (NSDate)modifiedDate
{
  return self->_modifiedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modifiedDate, 0);
  objc_storeStrong((id *)&self->_uncommitedElementsAccountID, 0);
  objc_storeStrong((id *)&self->_secondaryLevelElementIDsByTopLevelElementID, 0);
  objc_storeStrong((id *)&self->_topLevelElementIDs, 0);
  objc_storeStrong((id *)&self->_listID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

@end
