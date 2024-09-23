@implementation TCMessageEntry

+ (void)initialize
{
  id v2;
  void *v3;

  if (!percent)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDD1690]);
    v3 = (void *)percent;
    percent = (uint64_t)v2;

    objc_msgSend((id)percent, "addCharactersInString:", CFSTR("%"));
  }
}

- (TCMessageEntry)initWithTag:(int)a3 affectedObject:(id)a4 text:(id)a5 parameters:(char *)a6
{
  id v10;
  id v11;
  TCMessageEntry *v12;
  TCMessageEntry *v13;
  uint64_t v14;
  NSString *m_text;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  char *v24;
  char *v25;

  v10 = a4;
  v11 = a5;
  v25 = a6;
  v12 = -[TCMessageEntry init](self, "init");
  v13 = v12;
  if (v12)
  {
    v12->m_tag = a3;
    v12->m_count = 1;
    -[TCMessageEntry addAffectedObject:](v12, "addAffectedObject:", v10);
    v24 = v25;
    v14 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:arguments:", v11, v25);
    m_text = v13->m_text;
    v13->m_text = (NSString *)v14;

    objc_msgSend(v11, "length");
    v16 = objc_msgSend(v11, "rangeOfCharacterFromSet:", percent);
    for (i = v17; v16 != 0x7FFFFFFFFFFFFFFFLL; i = v22)
    {
      v19 = objc_msgSend(v11, "length");
      v20 = v16 + i;
      v21 = objc_msgSend(v11, "characterAtIndex:", v20);
      if (v21 != 37 && v21 != 64)
        break;
      v16 = objc_msgSend(v11, "rangeOfCharacterFromSet:options:range:", percent, 0, v20 + 1, v19 - (v20 + 1), v24);
    }
  }

  return v13;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  char v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *m_parameters;

  v4 = a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    v7 = v4;
    if (self->m_tag == *((_DWORD *)v7 + 4)
      && -[NSString isEqualToString:](self->m_text, "isEqualToString:", *((_QWORD *)v7 + 3)))
    {
      -[TCMessageEntry additionalText](self, "additionalText");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "additionalText");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToString:", v9))
      {
        m_parameters = self->m_parameters;
        if (m_parameters == *((NSArray **)v7 + 4))
          v6 = 1;
        else
          v6 = -[NSArray isEqual:](m_parameters, "isEqual:");
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t m_tag;

  m_tag = self->m_tag;
  return -[NSString hash](self->m_text, "hash") ^ m_tag;
}

- (int)getMessageTag
{
  return self->m_tag;
}

- (id)getMessageText
{
  return self->m_text;
}

- (unint64_t)getParameterCount
{
  return -[NSArray count](self->m_parameters, "count");
}

- (id)getParameter:(unsigned int)a3
{
  void *v5;

  if (-[NSArray count](self->m_parameters, "count") <= a3)
  {
    v5 = 0;
  }
  else
  {
    -[NSArray objectAtIndex:](self->m_parameters, "objectAtIndex:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)affectedObjects
{
  return self->m_affectedObjects;
}

- (int)getCount
{
  return self->m_count;
}

- (int64_t)timeStampCompare:(id)a3
{
  unint64_t m_timeStamp;
  unint64_t v4;
  BOOL v5;
  int64_t v6;

  m_timeStamp = self->m_timeStamp;
  v4 = *((_QWORD *)a3 + 1);
  v5 = m_timeStamp >= v4;
  v6 = m_timeStamp > v4;
  if (v5)
    return v6;
  else
    return -1;
}

- (id)description
{
  uint64_t m_count;

  m_count = self->m_count;
  if ((_DWORD)m_count == 1)
    return self->m_text;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ (%dx)"), self->m_text, m_count);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)mergeEntries:(id)a3
{
  void *v4;
  NSMutableArray *m_affectedObjects;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v8 = a3;
  self->m_count += objc_msgSend(v8, "getCount");
  objc_msgSend(v8, "affectedObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v7 = self->m_affectedObjects;
      self->m_affectedObjects = v6;

      m_affectedObjects = self->m_affectedObjects;
    }
    -[NSMutableArray addObjectsFromArray:](m_affectedObjects, "addObjectsFromArray:", v4);
  }

}

- (void)addAffectedObject:(id)a3
{
  NSMutableArray *m_affectedObjects;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  if (v7)
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v6 = self->m_affectedObjects;
      self->m_affectedObjects = v5;

      m_affectedObjects = self->m_affectedObjects;
    }
    -[NSMutableArray addObject:](m_affectedObjects, "addObject:", v7);
  }

}

- (NSString)additionalText
{
  return self->additionalText;
}

- (void)setAdditionalText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)timeStamp
{
  return self->m_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->m_timeStamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->additionalText, 0);
  objc_storeStrong((id *)&self->m_affectedObjects, 0);
  objc_storeStrong((id *)&self->m_parameters, 0);
  objc_storeStrong((id *)&self->m_text, 0);
}

@end
