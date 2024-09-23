@implementation STCoreDowntimeOverride

- (int64_t)type
{
  void *v3;
  int64_t v4;

  -[STCoreDowntimeOverride willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("type"));
  -[STCoreDowntimeOverride primitiveType](self, "primitiveType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[STCoreDowntimeOverride didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("type"));
  return v4;
}

- (void)setType:(int64_t)a3
{
  void *v5;

  -[STCoreDowntimeOverride willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("type"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreDowntimeOverride setPrimitiveType:](self, "setPrimitiveType:", v5);

  -[STCoreDowntimeOverride didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("type"));
}

- (int64_t)state
{
  void *v3;
  int64_t v4;

  -[STCoreDowntimeOverride willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("state"));
  -[STCoreDowntimeOverride primitiveState](self, "primitiveState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  -[STCoreDowntimeOverride didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("state"));
  return v4;
}

- (void)setState:(int64_t)a3
{
  void *v5;

  -[STCoreDowntimeOverride willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreDowntimeOverride setPrimitiveState:](self, "setPrimitiveState:", v5);

  -[STCoreDowntimeOverride didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
}

- (BOOL)updateWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v13;
  STCoreDowntimeOverride *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("isTombstoned"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STCoreDowntimeOverride setIsTombstoned:](self, "setIsTombstoned:", objc_msgSend(v5, "BOOLValue"));

  if (-[STCoreDowntimeOverride isTombstoned](self, "isTombstoned"))
  {
    +[STLog blueprint](STLog, "blueprint");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = self;
      _os_log_impl(&dword_1D22E7000, v6, OS_LOG_TYPE_DEFAULT, "Deleting tombstoned downtime override: %@", (uint8_t *)&v13, 0xCu);
    }

    -[STCoreDowntimeOverride managedObjectContext](self, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "deleteObject:", self);
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreDowntimeOverride setType:](self, "setType:", objc_msgSend(v8, "integerValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("state"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreDowntimeOverride setState:](self, "setState:", objc_msgSend(v9, "integerValue"));

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("creationDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreDowntimeOverride setCreationDate:](self, "setCreationDate:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("calendarIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreDowntimeOverride setCalendarIdentifier:](self, "setCalendarIdentifier:", v11);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("endDate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[STCoreDowntimeOverride setEndDate:](self, "setEndDate:", v7);
  }

  return 1;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STCoreDowntimeOverride type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[STCoreDowntimeOverride state](self, "state"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("state"));

  -[STCoreDowntimeOverride creationDate](self, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("creationDate"));

  -[STCoreDowntimeOverride calendarIdentifier](self, "calendarIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("calendarIdentifier"));

  -[STCoreDowntimeOverride endDate](self, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("endDate"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[STCoreDowntimeOverride isTombstoned](self, "isTombstoned"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("isTombstoned"));

  v10 = (void *)objc_msgSend(v3, "copy");
  return v10;
}

@end
