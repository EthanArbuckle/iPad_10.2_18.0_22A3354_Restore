@implementation PRPosterUsageMetadataAttribute

- (PRPosterUsageMetadataAttribute)init
{
  PRPosterUsageMetadataAttribute *v2;
  uint64_t v3;
  NSDate *creationDate;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PRPosterUsageMetadataAttribute;
  v2 = -[PRPosterUsageMetadataAttribute init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v3 = objc_claimAutoreleasedReturnValue();
    creationDate = v2->_creationDate;
    v2->_creationDate = (NSDate *)v3;

  }
  return v2;
}

- (id)usageMetadataWithUpdatedLastModifiedDate
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (_QWORD *)objc_opt_new();
  v4 = -[NSDate copy](self->_creationDate, "copy");
  v5 = (void *)v3[1];
  v3[1] = v4;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v3[2];
  v3[2] = v6;

  v8 = -[NSDate copy](self->_lastSelectedDate, "copy");
  v9 = (void *)v3[3];
  v3[3] = v8;

  v10 = -[NSDate copy](self->_lastActivatedDate, "copy");
  v11 = (void *)v3[4];
  v3[4] = v10;

  return v3;
}

- (id)usageMetadataWithUpdatedLastSelectedDate
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (_QWORD *)objc_opt_new();
  v4 = -[NSDate copy](self->_creationDate, "copy");
  v5 = (void *)v3[1];
  v3[1] = v4;

  v6 = -[NSDate copy](self->_lastModifiedDate, "copy");
  v7 = (void *)v3[2];
  v3[2] = v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v3[3];
  v3[3] = v8;

  v10 = -[NSDate copy](self->_lastActivatedDate, "copy");
  v11 = (void *)v3[4];
  v3[4] = v10;

  return v3;
}

- (id)usageMetadataWithUpdatedLastActivatedDate
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v3 = (_QWORD *)objc_opt_new();
  v4 = -[NSDate copy](self->_creationDate, "copy");
  v5 = (void *)v3[1];
  v3[1] = v4;

  v6 = -[NSDate copy](self->_lastModifiedDate, "copy");
  v7 = (void *)v3[2];
  v3[2] = v6;

  v8 = -[NSDate copy](self->_lastSelectedDate, "copy");
  v9 = (void *)v3[3];
  v3[3] = v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v3[4];
  v3[4] = v10;

  return v3;
}

- (id)usageMetadataForUpdatedLastActivatedDate:(id)a3
{
  NSDate *v4;
  _QWORD *v5;
  NSDate *creationDate;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v4 = (NSDate *)a3;
  v5 = (_QWORD *)objc_opt_new();
  if (-[NSDate compare:](self->_creationDate, "compare:", v4) == NSOrderedDescending)
    creationDate = self->_creationDate;
  else
    creationDate = v4;
  v7 = -[NSDate copy](creationDate, "copy");
  v8 = (void *)v5[1];
  v5[1] = v7;

  v9 = -[NSDate copy](self->_lastModifiedDate, "copy");
  v10 = (void *)v5[2];
  v5[2] = v9;

  v11 = -[NSDate copy](self->_lastSelectedDate, "copy");
  v12 = (void *)v5[3];
  v5[3] = v11;

  v13 = -[NSDate copy](v4, "copy");
  v14 = (void *)v5[4];
  v5[4] = v13;

  return v5;
}

- (id)usageMetadataForUpdatedLastModifiedDate:(id)a3
{
  id v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  v5 = (_QWORD *)objc_opt_new();
  v6 = -[NSDate copy](self->_creationDate, "copy");
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = objc_msgSend(v4, "copy");
  v9 = (void *)v5[2];
  v5[2] = v8;

  v10 = -[NSDate copy](self->_lastSelectedDate, "copy");
  v11 = (void *)v5[3];
  v5[3] = v10;

  v12 = -[NSDate copy](self->_lastActivatedDate, "copy");
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRPosterUsageMetadataAttribute creationDate](self, "creationDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("creationDate"));

  -[PRPosterUsageMetadataAttribute lastModifiedDate](self, "lastModifiedDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v3, "appendObject:withName:", v6, CFSTR("lastModifiedDate"));

  -[PRPosterUsageMetadataAttribute lastSelectedDate](self, "lastSelectedDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v3, "appendObject:withName:", v8, CFSTR("lastSelectedDate"));

  -[PRPosterUsageMetadataAttribute lastActivatedDate](self, "lastActivatedDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v3, "appendObject:withName:", v10, CFSTR("lastActivatedDate"));

  objc_msgSend(v3, "build");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (NSString)attributeType
{
  return (NSString *)CFSTR("PRPosterRoleAttributeTypeUsageMetadata");
}

+ (id)decodeObjectWithJSON:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 16, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("creationDate"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastModifiedDate"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastSelectedDate"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("lastActivatedDate"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (_QWORD *)objc_opt_new();
      if (v4)
      {
        v9 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v4, "doubleValue");
        objc_msgSend(v9, "dateWithTimeIntervalSince1970:");
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = (void *)v8[1];
        v8[1] = v10;

      }
      if (v5)
      {
        v12 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v5, "doubleValue");
        objc_msgSend(v12, "dateWithTimeIntervalSince1970:");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v8[2];
        v8[2] = v13;

      }
      if (v6)
      {
        v15 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v6, "doubleValue");
        objc_msgSend(v15, "dateWithTimeIntervalSince1970:");
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = (void *)v8[3];
        v8[3] = v16;

      }
      if (v7)
      {
        v18 = (void *)MEMORY[0x1E0C99D68];
        objc_msgSend(v7, "doubleValue");
        objc_msgSend(v18, "dateWithTimeIntervalSince1970:");
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = (void *)v8[4];
        v8[4] = v19;

      }
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)encodeJSON
{
  void *v3;
  NSDate *creationDate;
  void *v5;
  void *v6;
  NSDate *lastModifiedDate;
  void *v8;
  void *v9;
  NSDate *lastSelectedDate;
  void *v11;
  void *v12;
  NSDate *lastActivatedDate;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = (void *)objc_opt_new();
  creationDate = self->_creationDate;
  if (creationDate)
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](creationDate, "timeIntervalSince1970");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("creationDate"));

  }
  lastModifiedDate = self->_lastModifiedDate;
  if (lastModifiedDate)
  {
    v8 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](lastModifiedDate, "timeIntervalSince1970");
    objc_msgSend(v8, "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("lastModifiedDate"));

  }
  lastSelectedDate = self->_lastSelectedDate;
  if (lastSelectedDate)
  {
    v11 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](lastSelectedDate, "timeIntervalSince1970");
    objc_msgSend(v11, "numberWithDouble:");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("lastSelectedDate"));

  }
  lastActivatedDate = self->_lastActivatedDate;
  if (lastActivatedDate)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    -[NSDate timeIntervalSince1970](lastActivatedDate, "timeIntervalSince1970");
    objc_msgSend(v14, "numberWithDouble:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("lastActivatedDate"));

  }
  -[PRPosterUsageMetadataAttribute attributeType](self, "attributeType");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("attributeType"));

  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastModifiedDate
{
  return self->_lastModifiedDate;
}

- (NSDate)lastSelectedDate
{
  return self->_lastSelectedDate;
}

- (NSDate)lastActivatedDate
{
  return self->_lastActivatedDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastActivatedDate, 0);
  objc_storeStrong((id *)&self->_lastSelectedDate, 0);
  objc_storeStrong((id *)&self->_lastModifiedDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

@end
