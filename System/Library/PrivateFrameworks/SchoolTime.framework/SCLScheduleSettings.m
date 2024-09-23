@implementation SCLScheduleSettings

+ (unint64_t)version
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLScheduleSettings)init
{
  SCLScheduleSettings *v2;
  SCLSchedule *v3;
  SCLSchedule *schedule;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLScheduleSettings;
  v2 = -[SCLScheduleSettings init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SCLSchedule);
    schedule = v2->_schedule;
    v2->_schedule = v3;

  }
  return v2;
}

- (SCLScheduleSettings)initWithSchoolModeScheduleSettings:(id)a3
{
  id v4;
  SCLScheduleSettings *v5;
  uint64_t v6;
  SCLSchedule *schedule;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCLScheduleSettings;
  v5 = -[SCLScheduleSettings init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "schedule");
    v6 = objc_claimAutoreleasedReturnValue();
    schedule = v5->_schedule;
    v5->_schedule = (SCLSchedule *)v6;

    v5->_enabled = objc_msgSend(v4, "isEnabled");
    v5->_version = objc_msgSend((id)objc_opt_class(), "version");
  }

  return v5;
}

- (SCLScheduleSettings)initWithCoder:(id)a3
{
  id v4;
  SCLScheduleSettings *v5;
  uint64_t v6;
  SCLSchedule *schedule;
  SCLSchedule *v8;
  SCLSchedule *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCLScheduleSettings;
  v5 = -[SCLScheduleSettings init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("schedule"));
    v6 = objc_claimAutoreleasedReturnValue();
    schedule = v5->_schedule;
    v5->_schedule = (SCLSchedule *)v6;

    if (!v5->_schedule)
    {
      v8 = objc_alloc_init(SCLSchedule);
      v9 = v5->_schedule;
      v5->_schedule = v8;

    }
    v5->_enabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enabled"));
    v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  SCLSchedule *schedule;
  id v5;

  schedule = self->_schedule;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", schedule, CFSTR("schedule"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("enabled"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_version, CFSTR("version"));

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[SCLScheduleSettings initWithSchoolModeScheduleSettings:]([SCLMutableScheduleSettings alloc], "initWithSchoolModeScheduleSettings:", self);
}

- (unint64_t)hash
{
  void *v3;
  unint64_t v4;

  -[SCLScheduleSettings schedule](self, "schedule");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash") ^ self->_enabled;

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int v6;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "isEnabled");
    if (v6 == -[SCLScheduleSettings isEnabled](self, "isEnabled"))
    {
      objc_msgSend(v5, "schedule");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLScheduleSettings schedule](self, "schedule");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v9);

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

  return v7;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLScheduleSettings isEnabled](self, "isEnabled");
  -[SCLScheduleSettings schedule](self, "schedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; enabled=%u; schedule=%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SCLScheduleSettings isEnabled](self, "isEnabled");
  -[SCLScheduleSettings schedule](self, "schedule");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "debugDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; enabled=%u; schedule=%@>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)startTimeForDay:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SCLScheduleSettings schedule](self, "schedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTimeForDay:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)endTimeForDay:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SCLScheduleSettings schedule](self, "schedule");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endTimeForDay:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (SCLSchedule)schedule
{
  return self->_schedule;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
}

- (BOOL)isActiveAtDate:(id)a3 calendar:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SCLScheduleSettings dateIntervalForActiveScheduleOnOrAfterDate:calendar:](self, "dateIntervalForActiveScheduleOnOrAfterDate:calendar:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v7, "containsDate:", v6);

  return (char)self;
}

- (id)dateIntervalForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char **__ptr32 *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v56;
  void *v57;
  void *v58;
  _QWORD v59[4];
  id v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t);
  void (*v78)(uint64_t);
  id v79;
  _QWORD v80[4];
  id v81;
  uint64_t *v82;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (!-[SCLScheduleSettings isEnabled](self, "isEnabled")
      || (-[SCLScheduleSettings schedule](self, "schedule"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEmpty"),
          v10,
          (v11 & 1) != 0))
    {
      v9 = 0;
      goto LABEL_21;
    }
    -[SCLScheduleSettings schedule](self, "schedule");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "recurrences");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SCLScheduleSettings schedule](self, "schedule");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "scheduledDays");

    v16 = MEMORY[0x24BDAC760];
    v17 = &off_21E4DA000;
    if (v15 == 127)
    {
      v74 = 0;
      v75 = &v74;
      v76 = 0x2020000000;
      LOBYTE(v77) = 0;
      objc_msgSend(v13, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastObject");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "intersectsRecurrence:", v19) & 1) != 0)
      {
        v20 = 1;
      }
      else
      {
        objc_msgSend(v13, "lastObject");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstObject");
        v22 = v16;
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v21, "isContiguousWithRecurrence:", v23);

        v16 = v22;
        v17 = &off_21E4DA000;

      }
      LOBYTE(v77) = v20;
      if (*((_BYTE *)v75 + 24))
      {
        v80[0] = v16;
        v80[1] = *((_QWORD *)v17 + 80);
        v80[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke;
        v80[3] = &unk_24E29BF58;
        v81 = v13;
        v82 = &v74;
        objc_msgSend(v81, "enumerateObjectsUsingBlock:", v80);

        if (*((_BYTE *)v75 + 24))
        {
          v24 = objc_alloc(MEMORY[0x24BDD1508]);
          objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (id)objc_msgSend(v24, "initWithStartDate:endDate:", v25, v26);

          _Block_object_dispose(&v74, 8);
LABEL_20:

          goto LABEL_21;
        }
      }
      _Block_object_dispose(&v74, 8);
    }
    v74 = 0;
    v75 = &v74;
    v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__2;
    v78 = __Block_byref_object_dispose__2;
    v79 = 0;
    v70 = 0;
    v71 = &v70;
    v72 = 0x2020000000;
    v73 = 0x7FFFFFFFFFFFFFFFLL;
    v65[0] = v16;
    v27 = *((_QWORD *)v17 + 80);
    v65[1] = v27;
    v65[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_64;
    v65[3] = &unk_24E29BF80;
    v66 = v6;
    v28 = v8;
    v67 = v28;
    v68 = &v74;
    v69 = &v70;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v65);
    if (v71[3] != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)objc_msgSend(v13, "count") >= 2)
    {
      objc_msgSend(v13, "objectAtIndexedSubscript:", v71[3]);
      v29 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v71[3];
      v32 = objc_msgSend(v13, "count");
      objc_msgSend(v13, "subarrayWithRange:", v31, v32 - v71[3]);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObjectsFromArray:", v33);

      objc_msgSend(v13, "subarrayWithRange:", 0, v71[3]);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "addObjectsFromArray:", v34);

      v35 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_msgSend(v35, "addObject:", v29);
      v58 = (void *)v29;
      v36 = objc_msgSend(v30, "count");
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 1, v36 - 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x24BDAC760];
      v62[1] = v27;
      v62[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_2;
      v62[3] = &unk_24E29BFA8;
      v38 = v30;
      v63 = v38;
      v39 = v35;
      v64 = v39;
      objc_msgSend(v38, "enumerateObjectsAtIndexes:options:usingBlock:", v37, 0, v62);

      objc_msgSend(v38, "removeObjectAtIndex:", 0);
      objc_msgSend(v38, "addObject:", v58);
      v40 = objc_msgSend(v38, "count");
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v40 - 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x24BDAC760];
      v59[1] = v27;
      v59[2] = __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_3;
      v59[3] = &unk_24E29BFA8;
      v42 = v38;
      v60 = v42;
      v43 = v39;
      v61 = v43;
      objc_msgSend(v42, "enumerateObjectsAtIndexes:options:usingBlock:", v41, 2, v59);

      if ((unint64_t)objc_msgSend(v43, "count") >= 2)
      {
        objc_msgSend(v43, "firstObject");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "timeInterval");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "startTime");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "dateComponents");
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v46, "setWeekday:", objc_msgSend(v57, "day"));
        v56 = v46;
        objc_msgSend(v43, "lastObject");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "timeInterval");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "endTime");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "dateComponents");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "setWeekday:", objc_msgSend(v47, "day"));
        v51 = (void *)MEMORY[0x24BDD1508];
        objc_msgSend((id)v75[5], "startDate");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "SCL_dateIntervalForActiveScheduleOnOrAfterDate:calendar:startComponents:endComponents:", v52, v28, v56, v50);
        v53 = objc_claimAutoreleasedReturnValue();
        v54 = (void *)v75[5];
        v75[5] = v53;

      }
    }
    v9 = (id)v75[5];

    _Block_object_dispose(&v70, 8);
    _Block_object_dispose(&v74, 8);

    goto LABEL_20;
  }
LABEL_21:

  return v9;
}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  char v9;
  id v10;

  v7 = a2;
  if (a3)
  {
    v10 = v7;
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "intersectsRecurrence:", v8) & 1) != 0)
      v9 = 1;
    else
      v9 = objc_msgSend(v8, "isContiguousWithRecurrence:", v10);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) &= v9;
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a4 = 1;

    v7 = v10;
  }

}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_64(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;

  objc_msgSend(a2, "dateIntervalForActiveScheduleOnOrAfterDate:calendar:", a1[4], a1[5]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "containsDate:", a1[4]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
    *a4 = 1;
  }
  objc_msgSend(obj, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earlierDate:", a1[4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[4];

  if (v8 == v9)
  {
    v10 = obj;
    v11 = *(_QWORD *)(a1[6] + 8);
    v13 = *(_QWORD *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (!v13)
    {
LABEL_7:
      objc_storeStrong(v12, v10);
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
      goto LABEL_8;
    }
    objc_msgSend(obj, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "compare:", v15);

    if (v16 == -1)
    {
      v12 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
      v10 = obj;
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 - 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isContiguousWithRecurrence:", v8) & 1) != 0
    || objc_msgSend(v7, "intersectsRecurrence:", v8))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  }
  else
  {
    *a4 = 1;
  }

}

void __85__SCLScheduleSettings_Extended__dateIntervalForActiveScheduleOnOrAfterDate_calendar___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a3 + 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isContiguousWithRecurrence:", v7) & 1) != 0
    || objc_msgSend(v8, "intersectsRecurrence:", v7))
  {
    objc_msgSend(*(id *)(a1 + 40), "insertObject:atIndex:", v8, 0);
  }
  else
  {
    *a4 = 1;
  }

}

- (id)recurrenceForActiveScheduleOnOrAfterDate:(id)a3 calendar:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(_QWORD *, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  id v20;
  _QWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if (-[SCLScheduleSettings isEnabled](self, "isEnabled")
      && (-[SCLScheduleSettings schedule](self, "schedule"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "isEmpty"),
          v10,
          (v11 & 1) == 0))
    {
      -[SCLScheduleSettings schedule](self, "schedule");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "recurrences");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = __Block_byref_object_copy__2;
      v27[4] = __Block_byref_object_dispose__2;
      v28 = 0;
      v23 = 0;
      v24 = &v23;
      v25 = 0x2020000000;
      v26 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = MEMORY[0x24BDAC760];
      v16 = 3221225472;
      v17 = __83__SCLScheduleSettings_Extended__recurrenceForActiveScheduleOnOrAfterDate_calendar___block_invoke;
      v18 = &unk_24E29BF80;
      v19 = v6;
      v20 = v8;
      v21 = v27;
      v22 = &v23;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v15);
      if (v24[3] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = 0;
      }
      else
      {
        objc_msgSend(v13, "objectAtIndexedSubscript:", v15, v16, v17, v18, v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }

      _Block_object_dispose(&v23, 8);
      _Block_object_dispose(v27, 8);

    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

void __83__SCLScheduleSettings_Extended__recurrenceForActiveScheduleOnOrAfterDate_calendar___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id obj;

  objc_msgSend(a2, "dateIntervalForActiveScheduleOnOrAfterDate:calendar:", a1[4], a1[5]);
  obj = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(obj, "containsDate:", a1[4]))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), obj);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
    *a4 = 1;
  }
  objc_msgSend(obj, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "earlierDate:", a1[4]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)a1[4];

  if (v8 == v9)
  {
    v10 = obj;
    v11 = *(_QWORD *)(a1[6] + 8);
    v13 = *(_QWORD *)(v11 + 40);
    v12 = (id *)(v11 + 40);
    if (!v13)
    {
LABEL_7:
      objc_storeStrong(v12, v10);
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a3;
      goto LABEL_8;
    }
    objc_msgSend(obj, "startDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "startDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "compare:", v15);

    if (v16 == -1)
    {
      v12 = (id *)(*(_QWORD *)(a1[6] + 8) + 40);
      v10 = obj;
      goto LABEL_7;
    }
  }
LABEL_8:

}

@end
