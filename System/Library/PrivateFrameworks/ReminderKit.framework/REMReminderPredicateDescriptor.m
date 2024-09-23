@implementation REMReminderPredicateDescriptor

+ (id)andPredicateDescriptorWithDescriptors:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 8);
  -[REMReminderPredicateDescriptor setDescriptors:](v4, "setDescriptors:", v3);

  return v4;
}

+ (id)orPredicateDescriptorWithDescriptors:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 9);
  -[REMReminderPredicateDescriptor setDescriptors:](v4, "setDescriptors:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithListID:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 0);
  -[REMReminderPredicateDescriptor setListID:](v4, "setListID:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithParentReminderID:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 1);
  -[REMReminderPredicateDescriptor setParentReminderID:](v4, "setParentReminderID:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithObjectIDs:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 2);
  -[REMReminderPredicateDescriptor setObjectIDs:](v4, "setObjectIDs:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDueDateOnOrBefore:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 3);
  -[REMReminderPredicateDescriptor setStartingDueDate:](v4, "setStartingDueDate:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDueDateOnOrAfter:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 4);
  -[REMReminderPredicateDescriptor setEndingDueDate:](v4, "setEndingDueDate:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDueDateBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  REMReminderPredicateDescriptor *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 5);
  -[REMReminderPredicateDescriptor setStartingDueDate:](v7, "setStartingDueDate:", v6);

  -[REMReminderPredicateDescriptor setEndingDueDate:](v7, "setEndingDueDate:", v5);
  return v7;
}

+ (id)predicateDescriptorForRemindersWithDisplayDateOnOrBefore:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 10);
  -[REMReminderPredicateDescriptor setStartingDueDate:](v4, "setStartingDueDate:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDisplayDateOnOrAfter:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 11);
  -[REMReminderPredicateDescriptor setEndingDueDate:](v4, "setEndingDueDate:", v3);

  return v4;
}

+ (id)predicateDescriptorForRemindersWithDisplayDateBetween:(id)a3 and:(id)a4
{
  id v5;
  id v6;
  REMReminderPredicateDescriptor *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 12);
  -[REMReminderPredicateDescriptor setStartingDueDate:](v7, "setStartingDueDate:", v6);

  -[REMReminderPredicateDescriptor setEndingDueDate:](v7, "setEndingDueDate:", v5);
  return v7;
}

+ (id)predicateDescriptorForRemindersWithCompleted:(BOOL)a3
{
  _BOOL8 v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 6);
  -[REMReminderPredicateDescriptor setCompleted:](v4, "setCompleted:", v3);
  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleEquals:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 7);
  -[REMReminderPredicateDescriptor setText:](v4, "setText:", v3);

  -[REMReminderPredicateDescriptor setTextMatching:](v4, "setTextMatching:", 0);
  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleContains:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 7);
  -[REMReminderPredicateDescriptor setText:](v4, "setText:", v3);

  -[REMReminderPredicateDescriptor setTextMatching:](v4, "setTextMatching:", 1);
  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleBeginsWith:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 7);
  -[REMReminderPredicateDescriptor setText:](v4, "setText:", v3);

  -[REMReminderPredicateDescriptor setTextMatching:](v4, "setTextMatching:", 2);
  return v4;
}

+ (id)predicateDescriptorForRemindersWithTitleEndsWith:(id)a3
{
  id v3;
  REMReminderPredicateDescriptor *v4;

  v3 = a3;
  v4 = -[REMReminderPredicateDescriptor initWithType:]([REMReminderPredicateDescriptor alloc], "initWithType:", 7);
  -[REMReminderPredicateDescriptor setText:](v4, "setText:", v3);

  -[REMReminderPredicateDescriptor setTextMatching:](v4, "setTextMatching:", 3);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMReminderPredicateDescriptor)initWithType:(int64_t)a3
{
  REMReminderPredicateDescriptor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)REMReminderPredicateDescriptor;
  result = -[REMReminderPredicateDescriptor init](&v5, sel_init);
  if (result)
    result->_type = a3;
  return result;
}

- (REMReminderPredicateDescriptor)initWithReminderPredicateDescriptor:(id)a3
{
  id v4;
  REMReminderPredicateDescriptor *v5;
  uint64_t v6;
  NSArray *objectIDs;
  uint64_t v8;
  REMObjectID *listID;
  uint64_t v10;
  REMObjectID *parentReminderID;
  uint64_t v12;
  NSDate *startingDueDate;
  uint64_t v14;
  NSDate *endingDueDate;
  uint64_t v16;
  NSArray *descriptors;
  uint64_t v18;
  NSString *text;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)REMReminderPredicateDescriptor;
  v5 = -[REMReminderPredicateDescriptor init](&v21, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "type");
    objc_msgSend(v4, "objectIDs");
    v6 = objc_claimAutoreleasedReturnValue();
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v6;

    objc_msgSend(v4, "listID");
    v8 = objc_claimAutoreleasedReturnValue();
    listID = v5->_listID;
    v5->_listID = (REMObjectID *)v8;

    objc_msgSend(v4, "parentReminderID");
    v10 = objc_claimAutoreleasedReturnValue();
    parentReminderID = v5->_parentReminderID;
    v5->_parentReminderID = (REMObjectID *)v10;

    objc_msgSend(v4, "startingDueDate");
    v12 = objc_claimAutoreleasedReturnValue();
    startingDueDate = v5->_startingDueDate;
    v5->_startingDueDate = (NSDate *)v12;

    objc_msgSend(v4, "endingDueDate");
    v14 = objc_claimAutoreleasedReturnValue();
    endingDueDate = v5->_endingDueDate;
    v5->_endingDueDate = (NSDate *)v14;

    v5->_completed = objc_msgSend(v4, "completed");
    objc_msgSend(v4, "descriptors");
    v16 = objc_claimAutoreleasedReturnValue();
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v16;

    objc_msgSend(v4, "text");
    v18 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v18;

    v5->_textMatching = objc_msgSend(v4, "textMatching");
  }

  return v5;
}

- (REMReminderPredicateDescriptor)initWithCoder:(id)a3
{
  id v4;
  REMReminderPredicateDescriptor *v5;
  unint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *objectIDs;
  uint64_t v19;
  REMObjectID *listID;
  uint64_t v21;
  REMObjectID *parentReminderID;
  uint64_t v23;
  NSDate *startingDueDate;
  uint64_t v25;
  NSDate *endingDueDate;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  NSArray *descriptors;
  uint64_t v32;
  NSString *text;
  unint64_t v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  objc_super v43;

  v4 = a3;
  v43.receiver = self;
  v43.super_class = (Class)REMReminderPredicateDescriptor;
  v5 = -[REMReminderPredicateDescriptor init](&v43, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    if (v6 >= 0xD)
    {
      v7 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        -[REMReminderPredicateDescriptor initWithCoder:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

      v6 = 0;
    }
    v5->_type = v6;
    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("objectIDs"));
    v17 = objc_claimAutoreleasedReturnValue();
    objectIDs = v5->_objectIDs;
    v5->_objectIDs = (NSArray *)v17;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("listID"));
    v19 = objc_claimAutoreleasedReturnValue();
    listID = v5->_listID;
    v5->_listID = (REMObjectID *)v19;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("parentReminderID"));
    v21 = objc_claimAutoreleasedReturnValue();
    parentReminderID = v5->_parentReminderID;
    v5->_parentReminderID = (REMObjectID *)v21;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("startingDueDate"));
    v23 = objc_claimAutoreleasedReturnValue();
    startingDueDate = v5->_startingDueDate;
    v5->_startingDueDate = (NSDate *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endingDueDate"));
    v25 = objc_claimAutoreleasedReturnValue();
    endingDueDate = v5->_endingDueDate;
    v5->_endingDueDate = (NSDate *)v25;

    v5->_completed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completed"));
    v27 = (void *)MEMORY[0x1E0C99E60];
    v28 = objc_opt_class();
    objc_msgSend(v27, "setWithObjects:", v28, objc_opt_class(), 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("descriptors"));
    v30 = objc_claimAutoreleasedReturnValue();
    descriptors = v5->_descriptors;
    v5->_descriptors = (NSArray *)v30;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("text"));
    v32 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v32;

    v34 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("textMatching"));
    if (v34 >= 4)
    {
      v35 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        -[REMReminderPredicateDescriptor initWithCoder:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

      v34 = 0;
    }
    v5->_textMatching = v34;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(v11, "encodeInteger:forKey:", -[REMReminderPredicateDescriptor type](self, "type"), CFSTR("type"));
  -[REMReminderPredicateDescriptor objectIDs](self, "objectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v4, CFSTR("objectIDs"));

  -[REMReminderPredicateDescriptor listID](self, "listID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v5, CFSTR("listID"));

  -[REMReminderPredicateDescriptor parentReminderID](self, "parentReminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v6, CFSTR("parentReminderID"));

  -[REMReminderPredicateDescriptor startingDueDate](self, "startingDueDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v7, CFSTR("startingDueDate"));

  -[REMReminderPredicateDescriptor endingDueDate](self, "endingDueDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v8, CFSTR("endingDueDate"));

  objc_msgSend(v11, "encodeBool:forKey:", -[REMReminderPredicateDescriptor completed](self, "completed"), CFSTR("completed"));
  -[REMReminderPredicateDescriptor descriptors](self, "descriptors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("descriptors"));

  -[REMReminderPredicateDescriptor text](self, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "encodeObject:forKey:", v10, CFSTR("text"));

  objc_msgSend(v11, "encodeInteger:forKey:", -[REMReminderPredicateDescriptor textMatching](self, "textMatching"), CFSTR("textMatching"));
}

- (BOOL)isEqual:(id)a3
{
  REMReminderPredicateDescriptor *v4;
  REMReminderPredicateDescriptor *v5;
  REMReminderPredicateDescriptor *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  int v38;
  _BOOL4 v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  int v45;
  int64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;

  v4 = (REMReminderPredicateDescriptor *)a3;
  v5 = v4;
  if (self != v4)
  {
    v6 = v4;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_33;
    v7 = -[REMReminderPredicateDescriptor type](self, "type");
    if (v7 != -[REMReminderPredicateDescriptor type](v6, "type"))
      goto LABEL_33;
    -[REMReminderPredicateDescriptor objectIDs](self, "objectIDs");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderPredicateDescriptor objectIDs](v6, "objectIDs");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v8 == (void *)v9)
    {

    }
    else
    {
      v10 = (void *)v9;
      -[REMReminderPredicateDescriptor objectIDs](self, "objectIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderPredicateDescriptor objectIDs](v6, "objectIDs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqual:", v12);

      if (!v13)
        goto LABEL_33;
    }
    -[REMReminderPredicateDescriptor listID](self, "listID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderPredicateDescriptor listID](v6, "listID");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v15 == (void *)v16)
    {

    }
    else
    {
      v17 = (void *)v16;
      -[REMReminderPredicateDescriptor listID](self, "listID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderPredicateDescriptor listID](v6, "listID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v18, "isEqual:", v19);

      if (!v20)
        goto LABEL_33;
    }
    -[REMReminderPredicateDescriptor parentReminderID](self, "parentReminderID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderPredicateDescriptor parentReminderID](v6, "parentReminderID");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v21 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[REMReminderPredicateDescriptor parentReminderID](self, "parentReminderID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderPredicateDescriptor parentReminderID](v6, "parentReminderID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v24, "isEqual:", v25);

      if (!v26)
        goto LABEL_33;
    }
    -[REMReminderPredicateDescriptor startingDueDate](self, "startingDueDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderPredicateDescriptor startingDueDate](v6, "startingDueDate");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v27 == (void *)v28)
    {

    }
    else
    {
      v29 = (void *)v28;
      -[REMReminderPredicateDescriptor startingDueDate](self, "startingDueDate");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderPredicateDescriptor startingDueDate](v6, "startingDueDate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v30, "isEqual:", v31);

      if (!v32)
        goto LABEL_33;
    }
    -[REMReminderPredicateDescriptor endingDueDate](self, "endingDueDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[REMReminderPredicateDescriptor endingDueDate](v6, "endingDueDate");
    v34 = objc_claimAutoreleasedReturnValue();
    if (v33 == (void *)v34)
    {

    }
    else
    {
      v35 = (void *)v34;
      -[REMReminderPredicateDescriptor endingDueDate](self, "endingDueDate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderPredicateDescriptor endingDueDate](v6, "endingDueDate");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(v36, "isEqual:", v37);

      if (!v38)
        goto LABEL_33;
    }
    v39 = -[REMReminderPredicateDescriptor completed](self, "completed");
    if (v39 == -[REMReminderPredicateDescriptor completed](v6, "completed"))
    {
      -[REMReminderPredicateDescriptor descriptors](self, "descriptors");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMReminderPredicateDescriptor descriptors](v6, "descriptors");
      v41 = objc_claimAutoreleasedReturnValue();
      if (v40 == (void *)v41)
      {

      }
      else
      {
        v42 = (void *)v41;
        -[REMReminderPredicateDescriptor descriptors](self, "descriptors");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderPredicateDescriptor descriptors](v6, "descriptors");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v43, "isEqual:", v44);

        if (!v45)
          goto LABEL_33;
      }
      v46 = -[REMReminderPredicateDescriptor textMatching](self, "textMatching");
      if (v46 == -[REMReminderPredicateDescriptor textMatching](v6, "textMatching"))
      {
        -[REMReminderPredicateDescriptor text](self, "text");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[REMReminderPredicateDescriptor text](v6, "text");
        v48 = objc_claimAutoreleasedReturnValue();
        if (v47 == (void *)v48)
        {
          v14 = 1;
          v49 = v47;
        }
        else
        {
          v49 = (void *)v48;
          -[REMReminderPredicateDescriptor text](self, "text");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[REMReminderPredicateDescriptor text](v6, "text");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v50, "isEqual:", v51);

        }
        goto LABEL_34;
      }
    }
LABEL_33:
    v14 = 0;
LABEL_34:

    goto LABEL_35;
  }
  v14 = 1;
LABEL_35:

  return v14;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMReminderPredicateDescriptor objectIDs](self, "objectIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderPredicateDescriptor objectIDs](self, "objectIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("objectIDs: %@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);

  }
  -[REMReminderPredicateDescriptor listID](self, "listID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderPredicateDescriptor listID](self, "listID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("listID: %@"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v11);

  }
  -[REMReminderPredicateDescriptor parentReminderID](self, "parentReminderID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderPredicateDescriptor parentReminderID](self, "parentReminderID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("parentReminderID: %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v15);

  }
  -[REMReminderPredicateDescriptor startingDueDate](self, "startingDueDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderPredicateDescriptor startingDueDate](self, "startingDueDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("startingDueDate: %@"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v19);

  }
  -[REMReminderPredicateDescriptor endingDueDate](self, "endingDueDate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderPredicateDescriptor endingDueDate](self, "endingDueDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("endingDueDate: %@"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v23);

  }
  if (-[REMReminderPredicateDescriptor type](self, "type") == 6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("completed: %d"), -[REMReminderPredicateDescriptor completed](self, "completed"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v24);

  }
  -[REMReminderPredicateDescriptor descriptors](self, "descriptors");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    -[REMReminderPredicateDescriptor descriptors](self, "descriptors");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("descriptors: %@"), v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v28);

  }
  -[REMReminderPredicateDescriptor text](self, "text");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    v30 = (void *)MEMORY[0x1E0CB3940];
    v31 = -[REMReminderPredicateDescriptor textMatching](self, "textMatching");
    -[REMReminderPredicateDescriptor text](self, "text");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "stringWithFormat:", CFSTR("textMatching: %ld text: %@"), v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v33);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p type: %ld %@>"), objc_opt_class(), self, -[REMReminderPredicateDescriptor type](self, "type"), v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  return v35;
}

- (int64_t)type
{
  return self->_type;
}

- (REMObjectID)listID
{
  return self->_listID;
}

- (void)setListID:(id)a3
{
  objc_storeStrong((id *)&self->_listID, a3);
}

- (REMObjectID)parentReminderID
{
  return self->_parentReminderID;
}

- (void)setParentReminderID:(id)a3
{
  objc_storeStrong((id *)&self->_parentReminderID, a3);
}

- (NSArray)objectIDs
{
  return self->_objectIDs;
}

- (void)setObjectIDs:(id)a3
{
  objc_storeStrong((id *)&self->_objectIDs, a3);
}

- (NSDate)startingDueDate
{
  return self->_startingDueDate;
}

- (void)setStartingDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_startingDueDate, a3);
}

- (NSDate)endingDueDate
{
  return self->_endingDueDate;
}

- (void)setEndingDueDate:(id)a3
{
  objc_storeStrong((id *)&self->_endingDueDate, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (NSArray)descriptors
{
  return self->_descriptors;
}

- (void)setDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_descriptors, a3);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (int64_t)textMatching
{
  return self->_textMatching;
}

- (void)setTextMatching:(int64_t)a3
{
  self->_textMatching = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_descriptors, 0);
  objc_storeStrong((id *)&self->_endingDueDate, 0);
  objc_storeStrong((id *)&self->_startingDueDate, 0);
  objc_storeStrong((id *)&self->_objectIDs, 0);
  objc_storeStrong((id *)&self->_parentReminderID, 0);
  objc_storeStrong((id *)&self->_listID, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Unknown REMReminderPredicateDescriptorTextMatching %ld", a5, a6, a7, a8, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1B4A39000, a2, a3, "Unknown REMReminderPredicateDescriptorType %ld", a5, a6, a7, a8, 0);
}

@end
