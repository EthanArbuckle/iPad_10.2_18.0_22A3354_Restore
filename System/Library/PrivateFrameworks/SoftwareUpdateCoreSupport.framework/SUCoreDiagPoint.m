@implementation SUCoreDiagPoint

- (id)initOfType:(int64_t)a3 fromLocation:(id)a4 forReason:(id)a5 withCode:(int64_t)a6 withError:(id)a7
{
  return -[SUCoreDiagPoint _initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:](self, "_initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:", a3, a4, a5, a6, a7, 0, 0, 0, 0);
}

- (id)initStateEventForFSM:(id)a3 previousState:(id)a4 fsmEvent:(id)a5 nextState:(id)a6 fsmAction:(id)a7 eventInfo:(id)a8
{
  return -[SUCoreDiagPoint _initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:](self, "_initFullySpecified:fromLocation:forReason:withCode:withError:previous:next:activity:param:", 64, a3, a5, 0, 0, a4, a6, a7, a8);
}

- (id)_initFullySpecified:(int64_t)a3 fromLocation:(id)a4 forReason:(id)a5 withCode:(int64_t)a6 withError:(id)a7 previous:(id)a8 next:(id)a9 activity:(id)a10 param:(id)a11
{
  id v18;
  SUCoreDiagPoint *v19;
  SUCoreDiagPoint *v20;
  id v21;
  void *v22;
  uint64_t v23;
  NSString *errorDesc;
  uint64_t v25;
  NSString *checkedDomain;
  uint64_t v27;
  NSString *v28;
  NSString *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;

  v36 = a4;
  v35 = a5;
  v18 = a7;
  v34 = a8;
  v33 = a9;
  v32 = a10;
  v31 = a11;
  v37.receiver = self;
  v37.super_class = (Class)SUCoreDiagPoint;
  v19 = -[SUCoreDiagPoint init](&v37, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_trackType = a3;
    objc_storeStrong((id *)&v19->_location, a4);
    objc_storeStrong((id *)&v20->_reason, a5);
    v20->_code = a6;
    if (v18)
    {
      v21 = objc_alloc(MEMORY[0x1E0CB3940]);
      objc_msgSend(v18, "checkedDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "initWithFormat:", CFSTR("%@"), v22);
      errorDesc = v20->_errorDesc;
      v20->_errorDesc = (NSString *)v23;

      v20->_checkedLayer = objc_msgSend(v18, "checkedLayer");
      v20->_checkedCode = objc_msgSend(v18, "checkedCode");
      objc_msgSend(v18, "checkedDomain");
      v25 = objc_claimAutoreleasedReturnValue();
      checkedDomain = v20->_checkedDomain;
      v20->_checkedDomain = (NSString *)v25;

      v27 = objc_msgSend(v18, "checkedIndications");
    }
    else
    {
      v28 = v20->_errorDesc;
      v20->_errorDesc = 0;

      v20->_checkedLayer = 0;
      v20->_checkedCode = 0;
      v29 = v20->_checkedDomain;
      v20->_checkedDomain = 0;

      v27 = 0;
    }
    v20->_checkedIndications = v27;
    objc_storeStrong((id *)&v20->_previous, a8);
    objc_storeStrong((id *)&v20->_next, a9);
    objc_storeStrong((id *)&v20->_activity, a10);
    objc_storeStrong((id *)&v20->_param, a11);
  }

  return v20;
}

- (SUCoreDiagPoint)initWithCoder:(id)a3
{
  id v4;
  SUCoreDiagPoint *v5;
  uint64_t v6;
  NSString *location;
  uint64_t v8;
  NSString *reason;
  uint64_t v10;
  NSString *errorDesc;
  uint64_t v12;
  NSString *checkedDomain;
  uint64_t v14;
  NSString *previous;
  uint64_t v16;
  NSString *next;
  uint64_t v18;
  NSString *activity;
  uint64_t v20;
  NSString *param;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SUCoreDiagPoint;
  v5 = -[SUCoreDiagPoint init](&v23, sel_init);
  if (v5)
  {
    v5->_trackType = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("trackType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("location"));
    v6 = objc_claimAutoreleasedReturnValue();
    location = v5->_location;
    v5->_location = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v8 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v8;

    v5->_code = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("code"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorDesc"));
    v10 = objc_claimAutoreleasedReturnValue();
    errorDesc = v5->_errorDesc;
    v5->_errorDesc = (NSString *)v10;

    v5->_checkedLayer = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("checkedLayer"));
    v5->_checkedCode = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("checkedCode"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("checkedDomain"));
    v12 = objc_claimAutoreleasedReturnValue();
    checkedDomain = v5->_checkedDomain;
    v5->_checkedDomain = (NSString *)v12;

    v5->_checkedIndications = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("checkedIndications"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("previous"));
    v14 = objc_claimAutoreleasedReturnValue();
    previous = v5->_previous;
    v5->_previous = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("next"));
    v16 = objc_claimAutoreleasedReturnValue();
    next = v5->_next;
    v5->_next = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("activity"));
    v18 = objc_claimAutoreleasedReturnValue();
    activity = v5->_activity;
    v5->_activity = (NSString *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("param"));
    v20 = objc_claimAutoreleasedReturnValue();
    param = v5->_param;
    v5->_param = (NSString *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t trackType;
  id v5;

  trackType = self->_trackType;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", trackType, CFSTR("trackType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_location, CFSTR("location"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reason, CFSTR("reason"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_code, CFSTR("code"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_errorDesc, CFSTR("errorDesc"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_checkedLayer, CFSTR("checkedLayer"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_checkedCode, CFSTR("checkedCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_checkedDomain, CFSTR("checkedDomain"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_checkedIndications, CFSTR("checkedIndications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_previous, CFSTR("previous"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_next, CFSTR("next"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_activity, CFSTR("activity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_param, CFSTR("param"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x40) != 0)
    -[SUCoreDiagPoint _descriptionStateEvent](self, "_descriptionStateEvent");
  else
    -[SUCoreDiagPoint _descriptionStandard](self, "_descriptionStandard");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)summary
{
  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x40) != 0)
    -[SUCoreDiagPoint _summaryStateEvent](self, "_summaryStateEvent");
  else
    -[SUCoreDiagPoint _summaryStandard](self, "_summaryStandard");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_descriptionStateEvent
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
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;

  -[SUCoreDiagPoint next](self, "next");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDiagPoint activity](self, "activity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v4)
    {
      -[SUCoreDiagPoint param](self, "param");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreDiagPoint typeName](self, "typeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint location](self, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint previous](self, "previous");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint reason](self, "reason");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint next](self, "next");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint activity](self, "activity");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      if (v5)
      {
        -[SUCoreDiagPoint param](self, "param");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@(%@)] >S> %@ >E> %@ >N> %@ >A> %@ info:%@"), v7, v8, v9, v10, v11, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@(%@)] >S> %@ >E> %@ >N> %@ >A> %@"), v7, v8, v9, v10, v11, v12);
LABEL_10:
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v19 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreDiagPoint typeName](self, "typeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint previous](self, "previous");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint reason](self, "reason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint next](self, "next");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("[%@(%@)] >S> %@ >E> %@ >N> %@"), v7, v8, v9, v10, v11);
    goto LABEL_14;
  }
  if (v4)
  {
    -[SUCoreDiagPoint param](self, "param");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreDiagPoint typeName](self, "typeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint previous](self, "previous");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint reason](self, "reason");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint activity](self, "activity");
    v18 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v18;
    if (v16)
    {
      -[SUCoreDiagPoint param](self, "param");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", CFSTR("[%@(%@)] >S> %@ >E> %@ >A> %@ info:%@"), v7, v8, v9, v10, v11, v13);
      goto LABEL_10;
    }
    objc_msgSend(v17, "stringWithFormat:", CFSTR("[%@(%@)] >S> %@ >E> %@ >A> %@"), v7, v8, v9, v10, v18);
LABEL_14:
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  v20 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreDiagPoint typeName](self, "typeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint previous](self, "previous");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint reason](self, "reason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringWithFormat:", CFSTR("[%@(%@)] >S> %@ >E> %@"), v7, v8, v9, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v15;
}

- (id)_summaryStateEvent
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

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreDiagPoint typeName](self, "typeName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint location](self, "location");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint previous](self, "previous");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint reason](self, "reason");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint next](self, "next");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint activity](self, "activity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUCoreDiagPoint param](self, "param");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("trackType:%@ fsmName:%@ previousState:%@ fsmEvent:%@ nextState:%@ fsmAction:%@ eventInfo:%@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_descriptionStandard
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  int64_t v30;
  void *v31;
  void *v32;
  void *v34;

  -[SUCoreDiagPoint reason](self, "reason");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUCoreDiagPoint errorDesc](self, "errorDesc");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (v4)
    {
      if (-[SUCoreDiagPoint checkedLayer](self, "checkedLayer"))
      {
        v5 = -[SUCoreDiagPoint checkedLayer](self, "checkedLayer");
        v6 = (void *)MEMORY[0x1E0CB3940];
        -[SUCoreDiagPoint typeName](self, "typeName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDiagPoint location](self, "location");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDiagPoint reason](self, "reason");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[SUCoreDiagPoint code](self, "code");
        -[SUCoreDiagPoint errorDesc](self, "errorDesc");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v5 > 10)
        {
          v34 = v6;
          +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = -[SUCoreDiagPoint checkedCode](self, "checkedCode");
          -[SUCoreDiagPoint checkedDomain](self, "checkedDomain");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", -[SUCoreDiagPoint checkedIndications](self, "checkedIndications"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "stringWithFormat:", CFSTR("[%@(%@) %@] code:%ld error:%@ | checked(%@) code:%ld domain:%@ indications:%@"), v7, v8, v9, v10, v11, v22, v23, v24, v25);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v6, "stringWithFormat:", CFSTR("[%@(%@) %@] code:%ld error:%@ | checked(%ld)"), v7, v8, v9, v10, v11, -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_18;
      }
      v18 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreDiagPoint typeName](self, "typeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint location](self, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint reason](self, "reason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SUCoreDiagPoint code](self, "code");
      -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "stringWithFormat:", CFSTR("[%@(%@) %@] code:%ld error:%@"), v7, v8, v17, v19, v20);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreDiagPoint typeName](self, "typeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint location](self, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint reason](self, "reason");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", CFSTR("[%@(%@) %@] code:%ld"), v7, v8, v17, -[SUCoreDiagPoint code](self, "code"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else if (v4)
  {
    if (-[SUCoreDiagPoint checkedLayer](self, "checkedLayer"))
    {
      v13 = -[SUCoreDiagPoint checkedLayer](self, "checkedLayer");
      v14 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreDiagPoint typeName](self, "typeName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint location](self, "location");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = -[SUCoreDiagPoint code](self, "code");
      -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 > 10)
      {
        +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[SUCoreDiagPoint checkedCode](self, "checkedCode");
        -[SUCoreDiagPoint checkedDomain](self, "checkedDomain");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUCoreErrorInformation summaryOfIndications:](SUCoreErrorInformation, "summaryOfIndications:", -[SUCoreDiagPoint checkedIndications](self, "checkedIndications"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "stringWithFormat:", CFSTR("[%@(%@)] code:%ld error:%@ | checked(%@) code:%ld domain:%@ indications:%@"), v7, v8, v15, v9, v29, v30, v31, v32);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v14, "stringWithFormat:", CFSTR("[%@(%@)] code:%ld error:%@ | checked(%ld)"), v7, v8, v15, v9, -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
LABEL_18:

      goto LABEL_19;
    }
    v26 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreDiagPoint typeName](self, "typeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[SUCoreDiagPoint code](self, "code");
    -[SUCoreDiagPoint errorDesc](self, "errorDesc");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("[%@(%@)] code:%ld error:%@"), v7, v8, v27, v28);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v21 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreDiagPoint typeName](self, "typeName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint location](self, "location");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("[%@(%@)] code:%ld"), v7, v8, -[SUCoreDiagPoint code](self, "code"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_19:

  return v12;
}

- (id)_summaryStandard
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  int64_t v17;
  void *v18;

  -[SUCoreDiagPoint errorDesc](self, "errorDesc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (-[SUCoreDiagPoint checkedLayer](self, "checkedLayer"))
    {
      v4 = -[SUCoreDiagPoint checkedLayer](self, "checkedLayer");
      v5 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreDiagPoint typeName](self, "typeName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint location](self, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint reason](self, "reason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[SUCoreDiagPoint code](self, "code");
      -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4 > 10)
      {
        +[SUCoreErrorInformation nameForSUCoreLayer:](SUCoreErrorInformation, "nameForSUCoreLayer:", -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[SUCoreDiagPoint checkedCode](self, "checkedCode");
        -[SUCoreDiagPoint checkedDomain](self, "checkedDomain");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringWithFormat:", CFSTR("trackType:%@ location:%@ reason:%@ code:%ld error:%@ | checked(%@) code:%ld domain:%@"), v6, v7, v8, v9, v10, v16, v17, v18);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v5, "stringWithFormat:", CFSTR("trackType:%@ location:%@ reason:%@ code:%ld error:%@ | checked(%ld)"), v6, v7, v8, v9, v10, -[SUCoreDiagPoint checkedLayer](self, "checkedLayer"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[SUCoreDiagPoint typeName](self, "typeName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint location](self, "location");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUCoreDiagPoint reason](self, "reason");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SUCoreDiagPoint code](self, "code");
      -[SUCoreDiagPoint errorDesc](self, "errorDesc");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("trackType:%@ location:%@ reason:%@ code:%ld error:%@"), v6, v7, v8, v14, v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreDiagPoint typeName](self, "typeName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint location](self, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUCoreDiagPoint reason](self, "reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("trackType:%@ location:%@ reason:%@ code:%ld"), v6, v7, v8, -[SUCoreDiagPoint code](self, "code"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)typeName
{
  char v3;
  char v4;
  __CFString *v5;

  v3 = -[SUCoreDiagPoint trackType](self, "trackType");
  v4 = -[SUCoreDiagPoint trackType](self, "trackType");
  if ((v3 & 1) != 0)
  {
    v5 = CFSTR("BEGIN");
    if ((v4 & 2) != 0)
    {
      objc_msgSend(CFSTR("BEGIN"), "stringByAppendingString:", CFSTR("|END"));

    }
  }
  else
  {
    if ((v4 & 2) == 0)
    {
      v5 = (__CFString *)((unint64_t)CFSTR("ERROR") & (-[SUCoreDiagPoint trackType](self, "trackType") << 61 >> 63));
      goto LABEL_9;
    }
    v5 = CFSTR("END");
  }
  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 4) != 0)
  {
    -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("|ERROR"));

  }
LABEL_9:
  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 8) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("|ANOMALY"));

    }
    else
    {
      v5 = CFSTR("ANOMALY");
    }
  }
  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x10) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("|FAILURE"));

    }
    else
    {
      v5 = CFSTR("FAILURE");
    }
  }
  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x20) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("|FAULT"));

    }
    else
    {
      v5 = CFSTR("FAULT");
    }
  }
  if ((-[SUCoreDiagPoint trackType](self, "trackType") & 0x40) != 0)
  {
    if (v5)
    {
      -[__CFString stringByAppendingString:](v5, "stringByAppendingString:", CFSTR("|FSM"));

    }
    else
    {
      return CFSTR("FSM");
    }
  }
  return v5;
}

- (int64_t)trackType
{
  return self->_trackType;
}

- (void)setTrackType:(int64_t)a3
{
  self->_trackType = a3;
}

- (NSString)location
{
  return self->_location;
}

- (void)setLocation:(id)a3
{
  objc_storeStrong((id *)&self->_location, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (int64_t)code
{
  return self->_code;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (NSString)errorDesc
{
  return self->_errorDesc;
}

- (void)setErrorDesc:(id)a3
{
  objc_storeStrong((id *)&self->_errorDesc, a3);
}

- (int64_t)checkedLayer
{
  return self->_checkedLayer;
}

- (void)setCheckedLayer:(int64_t)a3
{
  self->_checkedLayer = a3;
}

- (int64_t)checkedCode
{
  return self->_checkedCode;
}

- (void)setCheckedCode:(int64_t)a3
{
  self->_checkedCode = a3;
}

- (NSString)checkedDomain
{
  return self->_checkedDomain;
}

- (void)setCheckedDomain:(id)a3
{
  objc_storeStrong((id *)&self->_checkedDomain, a3);
}

- (int64_t)checkedIndications
{
  return self->_checkedIndications;
}

- (void)setCheckedIndications:(int64_t)a3
{
  self->_checkedIndications = a3;
}

- (NSString)previous
{
  return self->_previous;
}

- (void)setPrevious:(id)a3
{
  objc_storeStrong((id *)&self->_previous, a3);
}

- (NSString)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (NSString)next
{
  return self->_next;
}

- (void)setNext:(id)a3
{
  objc_storeStrong((id *)&self->_next, a3);
}

- (NSString)param
{
  return self->_param;
}

- (void)setParam:(id)a3
{
  objc_storeStrong((id *)&self->_param, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_param, 0);
  objc_storeStrong((id *)&self->_next, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_previous, 0);
  objc_storeStrong((id *)&self->_checkedDomain, 0);
  objc_storeStrong((id *)&self->_errorDesc, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
