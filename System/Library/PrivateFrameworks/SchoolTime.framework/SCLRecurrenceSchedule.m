@implementation SCLRecurrenceSchedule

+ (void)performBlockWithSharedFormatter:(id)a3
{
  uint64_t v3;
  void (**v4)(id, uint64_t);

  v3 = performBlockWithSharedFormatter__onceToken;
  v4 = (void (**)(id, uint64_t))a3;
  if (v3 != -1)
    dispatch_once(&performBlockWithSharedFormatter__onceToken, &__block_literal_global_9);
  os_unfair_lock_lock((os_unfair_lock_t)&performBlockWithSharedFormatter____sharedFormatterLock);
  v4[2](v4, performBlockWithSharedFormatter____sharedFormatter);

  os_unfair_lock_unlock((os_unfair_lock_t)&performBlockWithSharedFormatter____sharedFormatterLock);
}

void __57__SCLRecurrenceSchedule_performBlockWithSharedFormatter___block_invoke()
{
  SCLScheduleFormatter *v0;
  void *v1;

  v0 = objc_alloc_init(SCLScheduleFormatter);
  v1 = (void *)performBlockWithSharedFormatter____sharedFormatter;
  performBlockWithSharedFormatter____sharedFormatter = (uint64_t)v0;

  performBlockWithSharedFormatter____sharedFormatterLock = 0;
}

- (SCLRecurrenceSchedule)init
{
  return -[SCLRecurrenceSchedule initWithRecurrences:](self, "initWithRecurrences:", MEMORY[0x24BDBD1A8]);
}

- (SCLRecurrenceSchedule)initWithRecurrences:(id)a3
{
  id v4;
  SCLRecurrenceSchedule *v5;
  void *v6;
  uint64_t v7;
  NSArray *recurrences;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCLRecurrenceSchedule;
  v5 = -[SCLRecurrenceSchedule init](&v10, sel_init);
  if (v5)
  {
    +[SCLScheduleRecurrence dayOfWeekAndStartTimeComparator](SCLScheduleRecurrence, "dayOfWeekAndStartTimeComparator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sortedArrayUsingComparator:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v7;

  }
  return v5;
}

- (id)recurrences
{
  return self->_recurrences;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[SCLRecurrenceSchedule recurrences](self, "recurrences");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SCLRecurrenceSchedule *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (SCLRecurrenceSchedule *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SCLRecurrenceSchedule recurrences](self, "recurrences");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[SCLRecurrenceSchedule recurrences](v4, "recurrences");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3;
  v14 = __Block_byref_object_dispose__3;
  v15 = 0;
  v3 = (void *)objc_opt_class();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __36__SCLRecurrenceSchedule_description__block_invoke;
  v9[3] = &unk_24E29C010;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v3, "performBlockWithSharedFormatter:", v9);
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@ %p; %@>"), v6, self, v11[5]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __36__SCLRecurrenceSchedule_description__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "stringFromSchedule:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCLRecurrenceSchedule)initWithCoder:(id)a3
{
  id v4;
  SCLRecurrenceSchedule *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *recurrences;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SCLRecurrenceSchedule;
  v5 = -[SCLRecurrenceSchedule init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("recurrences"));
    v9 = objc_claimAutoreleasedReturnValue();
    recurrences = v5->_recurrences;
    v5->_recurrences = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_recurrences, CFSTR("recurrences"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recurrences, 0);
}

- (SCLRecurrenceSchedule)initWithTimeIntervals:(id)a3 repeatSchedule:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  SCLRecurrenceSchedule *v14;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    v11 = MEMORY[0x24BDAC760];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12);
        v17[0] = v11;
        v17[1] = 3221225472;
        v17[2] = __93__SCLRecurrenceSchedule_SCLRecurrenceScheduleCreation__initWithTimeIntervals_repeatSchedule___block_invoke;
        v17[3] = &unk_24E29B6B8;
        v18 = v6;
        v19 = v13;
        SCLEnumerateDaysInRepeatSchedule(a4, (uint64_t)v17);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  v14 = -[SCLRecurrenceSchedule initWithRecurrences:](self, "initWithRecurrences:", v6);
  return v14;
}

void __93__SCLRecurrenceSchedule_SCLRecurrenceScheduleCreation__initWithTimeIntervals_repeatSchedule___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  SCLScheduleRecurrence *v3;

  v2 = *(void **)(a1 + 32);
  v3 = -[SCLScheduleRecurrence initWithTimeInterval:day:]([SCLScheduleRecurrence alloc], "initWithTimeInterval:day:", *(_QWORD *)(a1 + 40), a2);
  objc_msgSend(v2, "addObject:", v3);

}

@end
