@implementation _UIActivitySortItem

+ (id)sortDescriptorForActivity:(id)a3 withGroup:(int64_t)a4 secondarySortValue:(id)a5
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  id v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  v9 = (_QWORD *)objc_opt_new();
  v10 = (void *)v9[1];
  v9[1] = v7;
  v11 = v7;

  v12 = (void *)v9[3];
  v9[2] = a4;
  v9[3] = v8;

  return v9;
}

+ (id)sortDescriptorForActivity:(id)a3 withGroup:(int64_t)a4 secondarySortValue:(id)a5 tertiarySortValue:(id)a6
{
  id v9;
  _QWORD *v10;
  void *v11;

  v9 = a6;
  +[_UIActivitySortItem sortDescriptorForActivity:withGroup:secondarySortValue:](_UIActivitySortItem, "sortDescriptorForActivity:withGroup:secondarySortValue:", a3, a4, a5);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10[4];
  v10[4] = v9;

  return v10;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  UIActivity *activity;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  activity = self->_activity;
  -[UIActivity activityType](activity, "activityType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_group);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> activity = <%@: %p> '%@', group = %@, secondarySortValue = %@, tertiarySortValue = %@"), v4, self, v5, activity, v7, v8, self->_secondarySortValue, self->_tertiarySortValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  id v5;
  int64_t group;
  int64_t v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  id tertiarySortValue;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;

  v4 = a3;
  v5 = v4;
  group = self->_group;
  v7 = v4[2];
  v8 = group <= v7;
  if (group >= v7)
    v9 = 0;
  else
    v9 = -1;
  if (v8)
    v10 = v9;
  else
    v10 = 1;
  if (!v10)
  {
    v11 = (void *)v4[3];
    v12 = self->_secondarySortValue;
    v13 = v11;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      v14 = objc_msgSend(v12, "localizedCaseInsensitiveCompare:", v13);
    else
      v14 = objc_msgSend(v12, "compare:", v13);
    v10 = v14;

    if (!v10)
    {
      tertiarySortValue = self->_tertiarySortValue;
      if (!tertiarySortValue)
        goto LABEL_20;
      v16 = (void *)*((_QWORD *)v5 + 4);
      if (!v16)
        goto LABEL_20;
      v17 = tertiarySortValue;
      v18 = v16;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        v19 = objc_msgSend(v17, "localizedCaseInsensitiveCompare:", v18);
      else
        v19 = objc_msgSend(v17, "compare:", v18);
      v10 = v19;

      if (!v10)
      {
LABEL_20:
        -[UIActivity activityTitle](self->_activity, "activityTitle");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*((id *)v5 + 1), "activityTitle");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v20;
        v23 = v21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          v24 = objc_msgSend(v22, "localizedCaseInsensitiveCompare:", v23);
        else
          v24 = objc_msgSend(v22, "compare:", v23);
        v10 = v24;

        if (!v10)
        {
          -[UIActivity activityUUID](self->_activity, "activityUUID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*((id *)v5 + 1), "activityUUID");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "UUIDString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v26, "compare:", v28);

        }
      }
    }
  }

  return v10;
}

- (UIActivity)activity
{
  return self->_activity;
}

- (int64_t)group
{
  return self->_group;
}

- (id)secondarySortValue
{
  return self->_secondarySortValue;
}

- (id)tertiarySortValue
{
  return self->_tertiarySortValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tertiarySortValue, 0);
  objc_storeStrong(&self->_secondarySortValue, 0);
  objc_storeStrong((id *)&self->_activity, 0);
}

@end
