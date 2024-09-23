@implementation REMRecurrenceRule

- (id)initRecurrenceRuleWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 frequency:(int64_t)a6 interval:(int64_t)a7 end:(id)a8
{
  return -[REMRecurrenceRule initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](self, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", a3, a4, a5, a6, a7, 0, 0, 0, 0, 0, 0, 0, a8);
}

- (id)initRecurrenceRuleWithObjectID:(id)a3 accountID:(id)a4 reminderID:(id)a5 frequency:(int64_t)a6 interval:(int64_t)a7 firstDayOfTheWeek:(int64_t)a8 daysOfTheWeek:(id)a9 daysOfTheMonth:(id)a10 monthsOfTheYear:(id)a11 weeksOfTheYear:(id)a12 daysOfTheYear:(id)a13 setPositions:(id)a14 end:(id)a15
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  REMRecurrenceRule *v25;
  REMRecurrenceRule *v26;
  uint64_t v27;
  REMRecurrenceEnd *recurrenceEnd;
  int64_t v29;
  uint64_t v30;
  NSArray *daysOfTheWeek;
  uint64_t v32;
  NSArray *daysOfTheMonth;
  uint64_t v34;
  NSArray *monthsOfTheYear;
  uint64_t v36;
  NSArray *weeksOfTheYear;
  uint64_t v38;
  NSArray *daysOfTheYear;
  uint64_t v40;
  NSArray *setPositions;
  id obj;
  id v48;
  id v49;
  id v50;
  objc_super v51;

  v50 = a3;
  v49 = a4;
  obj = a5;
  v48 = a5;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  v21 = a12;
  v22 = a13;
  v23 = a14;
  v24 = a15;
  v51.receiver = self;
  v51.super_class = (Class)REMRecurrenceRule;
  v25 = -[REMRecurrenceRule init](&v51, sel_init);
  v26 = v25;
  if (v25)
  {
    objc_storeStrong((id *)&v25->_objectID, a3);
    objc_storeStrong((id *)&v26->_accountID, a4);
    objc_storeStrong((id *)&v26->_reminderID, obj);
    v27 = objc_msgSend(v24, "copy");
    recurrenceEnd = v26->_recurrenceEnd;
    v26->_recurrenceEnd = (REMRecurrenceEnd *)v27;

    v29 = a7;
    if (a7 <= 1)
      v29 = 1;
    v26->_frequency = a6;
    v26->_interval = v29;
    v26->_firstDayOfTheWeek = a8;
    v30 = objc_msgSend(v18, "copy", obj);
    daysOfTheWeek = v26->_daysOfTheWeek;
    v26->_daysOfTheWeek = (NSArray *)v30;

    v32 = objc_msgSend(v19, "copy");
    daysOfTheMonth = v26->_daysOfTheMonth;
    v26->_daysOfTheMonth = (NSArray *)v32;

    v34 = objc_msgSend(v20, "copy");
    monthsOfTheYear = v26->_monthsOfTheYear;
    v26->_monthsOfTheYear = (NSArray *)v34;

    v36 = objc_msgSend(v21, "copy");
    weeksOfTheYear = v26->_weeksOfTheYear;
    v26->_weeksOfTheYear = (NSArray *)v36;

    v38 = objc_msgSend(v22, "copy");
    daysOfTheYear = v26->_daysOfTheYear;
    v26->_daysOfTheYear = (NSArray *)v38;

    v40 = objc_msgSend(v23, "copy");
    setPositions = v26->_setPositions;
    v26->_setPositions = (NSArray *)v40;

  }
  return v26;
}

- (REMRecurrenceRule)initWithRecurrenceRule:(id)a3 objectID:(id)a4 accountID:(id)a5 reminderID:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  REMRecurrenceRule *v18;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;

  v24 = a6;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  v23 = objc_msgSend(v11, "frequency");
  v22 = objc_msgSend(v11, "interval");
  v21 = objc_msgSend(v11, "firstDayOfTheWeek");
  objc_msgSend(v11, "daysOfTheWeek");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "daysOfTheMonth");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "monthsOfTheYear");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "weeksOfTheYear");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "daysOfTheYear");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPositions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recurrenceEnd");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[REMRecurrenceRule initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](self, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v10, v9, v24, v23, v22, v21, v12, v20, v13, v14, v15, v16, v17);
  return v18;
}

- (REMRecurrenceRule)initWithRecurrenceRule:(id)a3 objectID:(id)a4 end:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  REMRecurrenceRule *v23;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "accountID");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reminderID");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v9, "frequency");
  v18 = objc_msgSend(v9, "interval");
  v17 = objc_msgSend(v9, "firstDayOfTheWeek");
  objc_msgSend(v9, "daysOfTheWeek");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daysOfTheMonth");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "monthsOfTheYear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "weeksOfTheYear");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "daysOfTheYear");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPositions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = -[REMRecurrenceRule initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:](self, "initRecurrenceRuleWithObjectID:accountID:reminderID:frequency:interval:firstDayOfTheWeek:daysOfTheWeek:daysOfTheMonth:monthsOfTheYear:weeksOfTheYear:daysOfTheYear:setPositions:end:", v8, v21, v20, v19, v18, v17, v10, v11, v12, v13, v14, v15, v7);
  return v23;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMRecurrenceRule)initWithCoder:(id)a3
{
  id v4;
  REMRecurrenceRule *v5;
  uint64_t v6;
  REMObjectID *objectID;
  uint64_t v8;
  REMObjectID *accountID;
  uint64_t v10;
  REMObjectID *reminderID;
  uint64_t v12;
  REMRecurrenceEnd *recurrenceEnd;
  unint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSArray *daysOfTheWeek;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  NSArray *daysOfTheMonth;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSArray *daysOfTheYear;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  NSArray *weeksOfTheYear;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  NSArray *monthsOfTheYear;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  NSArray *setPositions;
  objc_super v49;

  v4 = a3;
  v49.receiver = self;
  v49.super_class = (Class)REMRecurrenceRule;
  v5 = -[REMRecurrenceRule init](&v49, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("objectID"));
    v6 = objc_claimAutoreleasedReturnValue();
    objectID = v5->_objectID;
    v5->_objectID = (REMObjectID *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("accountID"));
    v8 = objc_claimAutoreleasedReturnValue();
    accountID = v5->_accountID;
    v5->_accountID = (REMObjectID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reminderID"));
    v10 = objc_claimAutoreleasedReturnValue();
    reminderID = v5->_reminderID;
    v5->_reminderID = (REMObjectID *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recurrenceEnd"));
    v12 = objc_claimAutoreleasedReturnValue();
    recurrenceEnd = v5->_recurrenceEnd;
    v5->_recurrenceEnd = (REMRecurrenceEnd *)v12;

    v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("frequency"));
    if (v14 >= 5)
    {
      v15 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        -[REMRecurrenceRule initWithCoder:].cold.1(v14, v15);

      v14 = 0;
    }
    v5->_frequency = v14;
    v16 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("interval"));
    if (v16 <= 1)
      v17 = 1;
    else
      v17 = v16;
    v5->_interval = v17;
    v5->_firstDayOfTheWeek = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("firstDayOfTheWeek"));
    v18 = (void *)MEMORY[0x1E0C99E60];
    v19 = objc_opt_class();
    objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v20, CFSTR("daysOfTheWeek"));
    v21 = objc_claimAutoreleasedReturnValue();
    daysOfTheWeek = v5->_daysOfTheWeek;
    v5->_daysOfTheWeek = (NSArray *)v21;

    v23 = (void *)MEMORY[0x1E0C99E60];
    v24 = objc_opt_class();
    objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v25, CFSTR("daysOfTheMonth"));
    v26 = objc_claimAutoreleasedReturnValue();
    daysOfTheMonth = v5->_daysOfTheMonth;
    v5->_daysOfTheMonth = (NSArray *)v26;

    v28 = (void *)MEMORY[0x1E0C99E60];
    v29 = objc_opt_class();
    objc_msgSend(v28, "setWithObjects:", v29, objc_opt_class(), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v30, CFSTR("daysOfTheYear"));
    v31 = objc_claimAutoreleasedReturnValue();
    daysOfTheYear = v5->_daysOfTheYear;
    v5->_daysOfTheYear = (NSArray *)v31;

    v33 = (void *)MEMORY[0x1E0C99E60];
    v34 = objc_opt_class();
    objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v35, CFSTR("weeksOfTheYear"));
    v36 = objc_claimAutoreleasedReturnValue();
    weeksOfTheYear = v5->_weeksOfTheYear;
    v5->_weeksOfTheYear = (NSArray *)v36;

    v38 = (void *)MEMORY[0x1E0C99E60];
    v39 = objc_opt_class();
    objc_msgSend(v38, "setWithObjects:", v39, objc_opt_class(), 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v40, CFSTR("monthsOfTheYear"));
    v41 = objc_claimAutoreleasedReturnValue();
    monthsOfTheYear = v5->_monthsOfTheYear;
    v5->_monthsOfTheYear = (NSArray *)v41;

    v43 = (void *)MEMORY[0x1E0C99E60];
    v44 = objc_opt_class();
    objc_msgSend(v43, "setWithObjects:", v44, objc_opt_class(), 0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v45, CFSTR("setPositions"));
    v46 = objc_claimAutoreleasedReturnValue();
    setPositions = v5->_setPositions;
    v5->_setPositions = (NSArray *)v46;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  -[REMRecurrenceRule objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectID"));

  -[REMRecurrenceRule accountID](self, "accountID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("accountID"));

  -[REMRecurrenceRule reminderID](self, "reminderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("reminderID"));

  -[REMRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("recurrenceEnd"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceRule frequency](self, "frequency"), CFSTR("frequency"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceRule interval](self, "interval"), CFSTR("interval"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek"), CFSTR("firstDayOfTheWeek"));
  -[REMRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("daysOfTheWeek"));

  -[REMRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("daysOfTheMonth"));

  -[REMRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v11, CFSTR("daysOfTheYear"));

  -[REMRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v12, CFSTR("weeksOfTheYear"));

  -[REMRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v13, CFSTR("monthsOfTheYear"));

  -[REMRecurrenceRule setPositions](self, "setPositions");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v14, CFSTR("setPositions"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  v5 = objc_opt_class();
  REMDynamicCast(v5, (uint64_t)v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = -[REMRecurrenceRule isEqualToRecurrenceRule:](self, "isEqualToRecurrenceRule:", v6);
  else
    v7 = 0;

  return v7;
}

- (BOOL)isEqualToRecurrenceRule:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
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
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;

  v4 = a3;
  v5 = -[REMRecurrenceRule frequency](self, "frequency");
  if (v5 == objc_msgSend(v4, "frequency"))
  {
    v6 = -[REMRecurrenceRule interval](self, "interval");
    if (v6 == objc_msgSend(v4, "interval"))
    {
      v7 = -[REMRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek");
      if (v7 == objc_msgSend(v4, "firstDayOfTheWeek"))
      {
        -[REMRecurrenceRule objectID](self, "objectID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "objectID");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8 != v9)
        {
          -[REMRecurrenceRule objectID](self, "objectID");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:", v11))
          {
            v12 = 0;
            goto LABEL_57;
          }
          v76 = v11;
          v77 = v10;
        }
        -[REMRecurrenceRule accountID](self, "accountID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "accountID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14 != v15)
        {
          -[REMRecurrenceRule accountID](self, "accountID");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "accountID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v16, "isEqual:", v17))
          {
            v12 = 0;
LABEL_55:

LABEL_56:
            v11 = v76;
            v10 = v77;
            if (v8 == v9)
            {
LABEL_58:

              goto LABEL_8;
            }
LABEL_57:

            goto LABEL_58;
          }
          v74 = v17;
          v75 = v16;
        }
        -[REMRecurrenceRule reminderID](self, "reminderID");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "reminderID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18 != v19)
        {
          -[REMRecurrenceRule reminderID](self, "reminderID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "reminderID");
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v20;
          if (!objc_msgSend(v20, "isEqual:", v70))
          {
            v12 = 0;
LABEL_53:

LABEL_54:
            v17 = v74;
            v16 = v75;
            if (v14 == v15)
              goto LABEL_56;
            goto LABEL_55;
          }
        }
        -[REMRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "recurrenceEnd");
        v72 = v21;
        v73 = objc_claimAutoreleasedReturnValue();
        if (v21 != (void *)v73)
        {
          -[REMRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "recurrenceEnd");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v22;
          if (!objc_msgSend(v22, "isEqual:"))
          {
            v12 = 0;
            v23 = (void *)v73;
LABEL_51:

LABEL_52:
            if (v18 == v19)
              goto LABEL_54;
            goto LABEL_53;
          }
        }
        -[REMRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
        v24 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "monthsOfTheYear");
        v67 = objc_claimAutoreleasedReturnValue();
        if (v24 != v67)
        {
          -[REMRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "monthsOfTheYear");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = v25;
          if (!objc_msgSend(v25, "isEqual:"))
          {
            v12 = 0;
            v26 = (void *)v24;
            v27 = (void *)v67;
LABEL_49:

LABEL_50:
            v21 = v72;
            v23 = (void *)v73;
            if (v72 == (void *)v73)
              goto LABEL_52;
            goto LABEL_51;
          }
        }
        -[REMRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
        v28 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "daysOfTheMonth");
        v62 = objc_claimAutoreleasedReturnValue();
        v63 = (void *)v28;
        v66 = v18;
        if (v28 != v62)
        {
          -[REMRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "daysOfTheMonth");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v29;
          if (!objc_msgSend(v29, "isEqual:"))
          {
            v26 = (void *)v24;
            v12 = 0;
            v31 = (void *)v62;
            v30 = v63;
LABEL_47:

LABEL_48:
            v18 = v66;
            v27 = (void *)v67;
            if (v26 == (void *)v67)
              goto LABEL_50;
            goto LABEL_49;
          }
        }
        -[REMRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
        v32 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "daysOfTheYear");
        v60 = objc_claimAutoreleasedReturnValue();
        v61 = (void *)v32;
        if (v32 != v60)
        {
          -[REMRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "daysOfTheYear");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = v33;
          if (!objc_msgSend(v33, "isEqual:"))
          {
            v26 = (void *)v24;
            v12 = 0;
            v35 = (void *)v60;
            v34 = v61;
LABEL_45:

LABEL_46:
            v31 = (void *)v62;
            v30 = v63;
            if (v63 == (void *)v62)
              goto LABEL_48;
            goto LABEL_47;
          }
        }
        -[REMRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
        v36 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "weeksOfTheYear");
        v56 = objc_claimAutoreleasedReturnValue();
        v57 = (void *)v36;
        v55 = (void *)v24;
        if (v36 != v56)
        {
          -[REMRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "weeksOfTheYear");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v37;
          if (!objc_msgSend(v37, "isEqual:"))
          {
            v12 = 0;
            v38 = (void *)v56;
            goto LABEL_42;
          }
        }
        -[REMRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "daysOfTheWeek");
        v50 = objc_claimAutoreleasedReturnValue();
        if (v39 != (void *)v50)
        {
          v46 = v39;
          -[REMRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "daysOfTheWeek");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v49 = v40;
          if (!objc_msgSend(v40, "isEqual:"))
          {
            v12 = 0;
            v43 = (void *)v50;
            v39 = v46;
            goto LABEL_40;
          }
          v39 = v46;
        }
        -[REMRecurrenceRule setPositions](self, "setPositions");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setPositions");
        v42 = objc_claimAutoreleasedReturnValue();
        if (v41 == (void *)v42)
        {

          v12 = 1;
        }
        else
        {
          v47 = (void *)v42;
          -[REMRecurrenceRule setPositions](self, "setPositions");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setPositions");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v45, "isEqual:", v44);

        }
        v43 = (void *)v50;
        if (v39 == (void *)v50)
        {
LABEL_41:

          v38 = (void *)v56;
          if (v57 == (void *)v56)
          {
            v26 = v55;
LABEL_44:

            v35 = (void *)v60;
            v34 = v61;
            if (v61 == (void *)v60)
              goto LABEL_46;
            goto LABEL_45;
          }
LABEL_42:
          v26 = v55;

          goto LABEL_44;
        }
LABEL_40:

        goto LABEL_41;
      }
    }
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMRecurrenceRule objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMRecurrenceRule objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRecurrenceRule reminderID](self, "reminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRecurrenceRule accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, reminderID: %@, accountID: %@>"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMRecurrenceRule objectID](self, "objectID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRecurrenceRule reminderID](self, "reminderID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRecurrenceRule accountID](self, "accountID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMRecurrenceRule iCalendarDescription](self, "iCalendarDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p objectID: %@, reminderID: %@, accountID: %@> %@"), v4, self, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)iCalendarDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[REMRecurrenceRule stringValueAsDateOnly:isFloating:](self, "stringValueAsDateOnly:isFloating:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("RRULE:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)stringValueAsDateOnly:(BOOL)a3 isFloating:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t j;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t k;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t m;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t n;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  uint64_t ii;
  void *v57;
  void *v58;
  void *v59;
  void *v60;

  v4 = a4;
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[REMRecurrenceRule iCalendarValueFromRecurrenceType:](REMRecurrenceRule, "iCalendarValueFromRecurrenceType:", -[REMRecurrenceRule frequency](self, "frequency"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("FREQ=%@"), v8);

  if (-[REMRecurrenceRule interval](self, "interval") != 1)
    objc_msgSend(v7, "appendFormat:", CFSTR(";INTERVAL=%lu"), -[REMRecurrenceRule interval](self, "interval"));
  -[REMRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[REMRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[REMRecurrenceRule recurrenceEnd](self, "recurrenceEnd");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v12, "endDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[REMRecurrenceRule iCalendarValueFromDate:isDateOnly:isFloating:](REMRecurrenceRule, "iCalendarValueFromDate:isDateOnly:isFloating:", v13, v5, v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(";UNTIL=%@"), v14);

    }
    else
    {
      objc_msgSend(v7, "appendFormat:", CFSTR(";COUNT=%lu"), objc_msgSend(v12, "occurrenceCount"));
    }

  }
  -[REMRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[REMRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYMONTH=%@"), v18);

    if (v16 != 1)
    {
      for (i = 1; i != v16; ++i)
      {
        -[REMRecurrenceRule monthsOfTheYear](self, "monthsOfTheYear");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectAtIndex:", i);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v21);

      }
    }
  }
  -[REMRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");

  if (v23)
  {
    -[REMRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "objectAtIndex:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYMONTHDAY=%@"), v25);

    if (v23 != 1)
    {
      for (j = 1; j != v23; ++j)
      {
        -[REMRecurrenceRule daysOfTheMonth](self, "daysOfTheMonth");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "objectAtIndex:", j);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v28);

      }
    }
  }
  -[REMRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "count");

  if (v30)
  {
    -[REMRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "objectAtIndex:", 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYYEARDAY=%@"), v32);

    if (v30 != 1)
    {
      for (k = 1; k != v30; ++k)
      {
        -[REMRecurrenceRule daysOfTheYear](self, "daysOfTheYear");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectAtIndex:", k);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v35);

      }
    }
  }
  -[REMRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "count");

  if (v37)
  {
    -[REMRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "objectAtIndex:", 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYWEEKNO=%@"), v39);

    if (v37 != 1)
    {
      for (m = 1; m != v37; ++m)
      {
        -[REMRecurrenceRule weeksOfTheYear](self, "weeksOfTheYear");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectAtIndex:", m);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v42);

      }
    }
  }
  -[REMRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v43, "count");

  if (v44)
  {
    -[REMRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectAtIndex:", 0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v46, "iCalendarDescription");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYDAY=%@"), v47);

    if (v44 != 1)
    {
      for (n = 1; n != v44; ++n)
      {
        -[REMRecurrenceRule daysOfTheWeek](self, "daysOfTheWeek");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "objectAtIndex:", n);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "iCalendarDescription");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v51);

      }
    }

  }
  -[REMRecurrenceRule setPositions](self, "setPositions");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v52, "count");

  if (v53)
  {
    -[REMRecurrenceRule setPositions](self, "setPositions");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectAtIndex:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";BYSETPOS=%@"), v55);

    if (v53 != 1)
    {
      for (ii = 1; ii != v53; ++ii)
      {
        -[REMRecurrenceRule setPositions](self, "setPositions");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "objectAtIndex:", ii);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendFormat:", CFSTR(",%@"), v58);

      }
    }
  }
  if (-[REMRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek"))
  {
    +[REMRecurrenceRule iCalendarValueFromWeekday:](REMRecurrenceRule, "iCalendarValueFromWeekday:", -[REMRecurrenceRule firstDayOfTheWeek](self, "firstDayOfTheWeek"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(";WKST=%@"), v59);

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  return v60;
}

+ (id)iCalendarValueFromRecurrenceType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return &stru_1E67FB1F0;
  else
    return off_1E67FA260[a3];
}

+ (id)iCalendarValueFromDate:(id)a3 isDateOnly:(BOOL)a4 isFloating:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  void *v13;

  v5 = a5;
  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0CB3578];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v9, "setFormatterBehavior:", 1040);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("GMT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v10);

  v11 = CFSTR("yyyyMMdd'T'HHmmss'Z'");
  if (v5)
    v11 = CFSTR("yyyyMMdd'T'HHmmss");
  if (v6)
    v12 = CFSTR("yyyyMMdd");
  else
    v12 = v11;
  objc_msgSend(v9, "setDateFormat:", v12);
  objc_msgSend(v9, "stringFromDate:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)iCalendarValueFromWeekday:(int64_t)a3
{
  __CFString *v4;

  if (iCalendarValueFromWeekday__onceToken != -1)
    dispatch_once(&iCalendarValueFromWeekday__onceToken, &__block_literal_global_28);
  if (a3 > 6)
  {
    v4 = &stru_1E67FB1F0;
  }
  else
  {
    objc_msgSend((id)iCalendarValueFromWeekday____iCalendarValuesForWeekday, "objectAtIndexedSubscript:", a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

void __47__REMRecurrenceRule_iCalendarValueFromWeekday___block_invoke()
{
  void *v0;

  v0 = (void *)iCalendarValueFromWeekday____iCalendarValuesForWeekday;
  iCalendarValueFromWeekday____iCalendarValuesForWeekday = (uint64_t)&unk_1E6836EC8;

}

+ (id)nextRecurrentDueDateAfter:(id)a3 dueDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 recurrenceRules:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  id v43;
  unsigned int v44;
  uint64_t v45;
  uint64_t v46;
  id obj;
  void *v48;
  void *context;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v8 = a6;
  v60 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v48 = (void *)objc_opt_new();
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v15;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v55;
    v44 = v8;
    v43 = a1;
    v45 = *(_QWORD *)v55;
    do
    {
      v19 = 0;
      v46 = v17;
      do
      {
        if (*(_QWORD *)v55 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v19);
        if (objc_msgSend(v20, "frequency") == 4)
        {
          objc_msgSend(a1, "hourlyRecurrentDueDateAfter:dueDate:interval:", v12, v13, objc_msgSend(v20, "interval"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "addObject:", v21);

        }
        else
        {
          context = (void *)MEMORY[0x1B5E3DEC4]();
          objc_msgSend(a1, "recurrenceGeneratorConfiguredForDueDate:timeZone:allDay:recurrenceRule:", v13, v14, v8, v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "recurrenceEnd");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "occurrenceCount");

          if (v24)
          {
            objc_msgSend(v20, "recurrenceEnd");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "occurrenceCount");

            if (v26 >= 2)
              v27 = 2;
            else
              v27 = v26;
          }
          else
          {
            v27 = 2;
          }
          objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)objc_msgSend(v22, "copyOccurrenceDatesWithInitialDate:allDay:rangeStart:rangeEnd:timeZone:limit:", v13, v8, v12, v28, v14, v27);

          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v30 = v29;
          v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          v32 = v30;
          if (v31)
          {
            v33 = v31;
            v34 = v13;
            v35 = v14;
            v36 = *(_QWORD *)v51;
LABEL_15:
            v37 = 0;
            while (1)
            {
              if (*(_QWORD *)v51 != v36)
                objc_enumerationMutation(v30);
              v38 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v37);
              objc_msgSend(v38, "timeIntervalSinceDate:", v12);
              if (v39 > 0.0)
                break;
              if (v33 == ++v37)
              {
                v33 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
                if (v33)
                  goto LABEL_15;
                v32 = v30;
                v14 = v35;
                v13 = v34;
                v8 = v44;
                a1 = v43;
                goto LABEL_24;
              }
            }
            v32 = v38;

            v14 = v35;
            v13 = v34;
            v8 = v44;
            a1 = v43;
            if (!v32)
              goto LABEL_25;
            objc_msgSend(v48, "addObject:", v32);
          }
LABEL_24:

LABEL_25:
          objc_autoreleasePoolPop(context);
          v18 = v45;
          v17 = v46;
        }
        ++v19;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v17);
  }

  objc_msgSend(v48, "sortedArrayUsingSelector:", sel_compare_);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "firstObject");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

+ (id)previousRecurrentDueDateBefore:(id)a3 dueDate:(id)a4 timeZone:(id)a5 allDay:(BOOL)a6 recurrenceRules:(id)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  int v26;
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  id obj;
  void *context;
  uint64_t v48;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  _BOOL4 v53;
  id v54;
  void *v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;

  v53 = a6;
  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v54 = a5;
  v12 = a7;
  v55 = v10;
  v51 = v11;
  v44 = v12;
  if (objc_msgSend(v10, "compare:", v11) == 1)
  {
    v45 = (void *)objc_opt_new();
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    obj = v12;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
    if (v50)
    {
      v48 = *(_QWORD *)v67;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v67 != v48)
          {
            v14 = v13;
            objc_enumerationMutation(obj);
            v13 = v14;
          }
          v52 = v13;
          v15 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v13);
          if (objc_msgSend(v15, "frequency") == 4)
          {
            objc_msgSend(a1, "hourlyRecurrentDueDateBefore:dueDate:interval:", v55, v51, objc_msgSend(v15, "interval"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (v16)
              objc_msgSend(v45, "addObject:", v16);

          }
          else
          {
            context = (void *)MEMORY[0x1B5E3DEC4]();
            objc_msgSend(a1, "recurrenceGeneratorConfiguredForDueDate:timeZone:allDay:recurrenceRule:", v51, v54, v53, v15);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "recurrenceEnd");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "occurrenceCount") == 0;

            if (v19)
            {
              v21 = 0x7FFFFFFFFFFFFFFFLL;
            }
            else
            {
              objc_msgSend(v15, "recurrenceEnd");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v20, "occurrenceCount");

            }
            v22 = v51;
            v23 = v22;
            if (v51 && v21 >= 1)
            {
              v24 = 0;
              v25 = v22;
              do
              {
                v26 = objc_msgSend(v25, "isEqualToDate:", v23);
                v27 = v26;
                if (v21 + (v26 ^ 1u) >= 500)
                  v28 = 500;
                else
                  v28 = v21 + (v26 ^ 1u);
                v29 = (void *)objc_msgSend(v17, "copyOccurrenceDatesWithInitialDate:allDay:rangeStart:rangeEnd:timeZone:limit:", v23, v53, v25, v55, v54, v28);
                v30 = objc_msgSend(v29, "count");
                if (v30 <= 1)
                  v31 = 1;
                else
                  v31 = v30;
                v32 = v31 - 1;
                v60 = 0;
                v61 = &v60;
                if (v27)
                  v33 = v30;
                else
                  v33 = v32;
                v62 = 0x3032000000;
                v63 = __Block_byref_object_copy__10;
                v64 = __Block_byref_object_dispose__10;
                v65 = 0;
                v56[0] = MEMORY[0x1E0C809B0];
                v56[1] = 3221225472;
                v56[2] = __92__REMRecurrenceRule_previousRecurrentDueDateBefore_dueDate_timeZone_allDay_recurrenceRules___block_invoke;
                v56[3] = &unk_1E67FA1E0;
                v34 = v25;
                v57 = v34;
                v35 = v55;
                v58 = v35;
                v59 = &v60;
                objc_msgSend(v29, "enumerateObjectsWithOptions:usingBlock:", 2, v56);
                v36 = (void *)v61[5];
                if (v36)
                {
                  v37 = v36;

                  objc_msgSend(v29, "lastObject");
                  v38 = (void *)objc_claimAutoreleasedReturnValue();
                  v39 = v38;
                  if (v38 && objc_msgSend(v38, "compare:", v35) == -1)
                    v25 = v39;
                  else
                    v25 = 0;

                  v34 = v39;
                  v24 = v37;
                }
                else
                {
                  v25 = 0;
                }

                _Block_object_dispose(&v60, 8);
                if (!v25)
                  break;
                v40 = v21 <= v33;
                v21 -= v33;
              }
              while (!v40);
              if (v24)
              {
                objc_msgSend(v45, "addObject:", v24);

              }
            }
            else
            {
              v25 = v22;
            }

            objc_autoreleasePoolPop(context);
          }
          v13 = v52 + 1;
        }
        while (v52 + 1 != v50);
        v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      }
      while (v50);
    }

    objc_msgSend(v45, "sortedArrayUsingSelector:", sel_compare_);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "lastObject");
    v42 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v42 = 0;
  }

  return v42;
}

void __92__REMRecurrenceRule_previousRecurrentDueDateBefore_dueDate_timeZone_allDay_recurrenceRules___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "compare:") == -1 && objc_msgSend(v7, "compare:", *(_QWORD *)(a1 + 40)) == -1)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (id)recurrenceGeneratorConfiguredForDueDate:(id)a3 timeZone:(id)a4 allDay:(BOOL)a5 recurrenceRule:(id)a6
{
  _BOOL8 v6;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v6 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0D0C380];
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(v11);
  objc_msgSend(v14, "setEventStartDate:", v13);
  objc_msgSend(v14, "setEventEndDate:", v13);

  objc_msgSend(v14, "setEventTimeZone:", v12);
  objc_msgSend(v14, "setAllDay:", v6);
  objc_msgSend(v10, "daysOfTheWeek");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDaysOfTheWeek:", v15);

  objc_msgSend(v10, "daysOfTheMonth");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDaysOfTheMonth:", v16);

  objc_msgSend(v10, "daysOfTheYear");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDaysOfTheYear:", v17);

  objc_msgSend(v10, "weeksOfTheYear");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setWeeksOfTheYear:", v18);

  objc_msgSend(v10, "monthsOfTheYear");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMonthsOfTheYear:", v19);

  objc_msgSend(v10, "setPositions");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSetPositions:", v20);

  v21 = objc_msgSend(v10, "interval");
  if (v21 <= 1)
    v22 = 1;
  else
    v22 = v21;
  objc_msgSend(v14, "setInterval:", v22);
  objc_msgSend(v14, "setFrequency:", objc_msgSend(a1, "_convertREMRecurrenceFrequencyToCalRecurrenceFrequency:", objc_msgSend(v10, "frequency")));
  objc_msgSend(v14, "setWeekStart:", objc_msgSend(v10, "firstDayOfTheWeek"));
  if (!objc_msgSend(v14, "weekStart"))
    objc_msgSend(v14, "setWeekStart:", 2);
  objc_msgSend(v10, "recurrenceEnd");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "endDate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "recurrenceEnd");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    objc_msgSend(v25, "endDate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEndDate:", v27);

LABEL_10:
    goto LABEL_11;
  }
  v28 = objc_msgSend(v25, "occurrenceCount");

  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setEndDate:", v26);
    goto LABEL_10;
  }
LABEL_11:

  return v14;
}

+ (id)hourlyRecurrentDueDateToward:(id)a3 dueDate:(id)a4 interval:(int64_t)a5 adjustingStepsBy:(id)a6
{
  int64_t v8;
  double v9;
  double (**v10)(_QWORD, double);
  id v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  if (a5 <= 1)
    v8 = 1;
  else
    v8 = a5;
  v9 = (double)v8 * 3600.0;
  v10 = (double (**)(_QWORD, double))a6;
  v11 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v13 = v12;
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  v15 = v10[2](v10, fmax(v13 - v14, 0.0) / v9);

  objc_msgSend(v11, "dateByAddingTimeInterval:", v9 * (double)(uint64_t)v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)hourlyRecurrentDueDateAfter:(id)a3 dueDate:(id)a4 interval:(int64_t)a5
{
  return (id)objc_msgSend(a1, "hourlyRecurrentDueDateToward:dueDate:interval:adjustingStepsBy:", a3, a4, a5, &__block_literal_global_107);
}

double __66__REMRecurrenceRule_hourlyRecurrentDueDateAfter_dueDate_interval___block_invoke(double a1)
{
  return floor(a1) + 1.0;
}

+ (id)hourlyRecurrentDueDateBefore:(id)a3 dueDate:(id)a4 interval:(int64_t)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a4;
  objc_msgSend(a1, "hourlyRecurrentDueDateToward:dueDate:interval:adjustingStepsBy:", a3, v8, a5, &__block_literal_global_108);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v9, "isEqualToDate:", v8);

  if ((a3 & 1) != 0)
    v10 = 0;
  else
    v10 = v9;

  return v10;
}

double __67__REMRecurrenceRule_hourlyRecurrentDueDateBefore_dueDate_interval___block_invoke(double a1)
{
  return fmax(ceil(a1) + -1.0, 0.0);
}

+ (int)_convertREMRecurrenceFrequencyToCalRecurrenceFrequency:(int64_t)a3
{
  int result;
  NSObject *v4;

  switch(a3)
  {
    case 1:
      result = 2;
      break;
    case 2:
      result = 3;
      break;
    case 3:
      result = 4;
      break;
    case 4:
      +[REMLogStore utility](REMLogStore, "utility");
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
        +[REMRecurrenceRule _convertREMRecurrenceFrequencyToCalRecurrenceFrequency:].cold.1(v4);

      result = 1;
      break;
    default:
      result = 1;
      break;
  }
  return result;
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

+ (NSString)cdEntityName
{
  return (NSString *)CFSTR("REMCDRecurrenceRule");
}

- (REMRecurrenceEnd)recurrenceEnd
{
  return self->_recurrenceEnd;
}

- (int64_t)frequency
{
  return self->_frequency;
}

- (int64_t)interval
{
  return self->_interval;
}

- (int64_t)firstDayOfTheWeek
{
  return self->_firstDayOfTheWeek;
}

- (NSArray)daysOfTheWeek
{
  return self->_daysOfTheWeek;
}

- (NSArray)daysOfTheMonth
{
  return self->_daysOfTheMonth;
}

- (NSArray)daysOfTheYear
{
  return self->_daysOfTheYear;
}

- (NSArray)weeksOfTheYear
{
  return self->_weeksOfTheYear;
}

- (NSArray)monthsOfTheYear
{
  return self->_monthsOfTheYear;
}

- (NSArray)setPositions
{
  return self->_setPositions;
}

- (REMObjectID)objectID
{
  return self->_objectID;
}

- (REMObjectID)accountID
{
  return self->_accountID;
}

- (REMObjectID)reminderID
{
  return self->_reminderID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reminderID, 0);
  objc_storeStrong((id *)&self->_accountID, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
  objc_storeStrong((id *)&self->_setPositions, 0);
  objc_storeStrong((id *)&self->_monthsOfTheYear, 0);
  objc_storeStrong((id *)&self->_weeksOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheYear, 0);
  objc_storeStrong((id *)&self->_daysOfTheMonth, 0);
  objc_storeStrong((id *)&self->_daysOfTheWeek, 0);
  objc_storeStrong((id *)&self->_recurrenceEnd, 0);
}

- (void)initWithCoder:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1B4A39000, a2, OS_LOG_TYPE_FAULT, "Unknown REMRecurrenceFrequency %ld", (uint8_t *)&v2, 0xCu);
}

+ (void)_convertREMRecurrenceFrequencyToCalRecurrenceFrequency:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1B4A39000, log, OS_LOG_TYPE_FAULT, "Hourly recurrence is not supported by CalendarFoundation.", v1, 2u);
}

@end
