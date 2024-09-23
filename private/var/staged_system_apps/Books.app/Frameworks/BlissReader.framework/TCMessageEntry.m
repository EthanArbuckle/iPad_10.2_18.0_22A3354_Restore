@implementation TCMessageEntry

+ (void)initialize
{
  if (!qword_543358)
  {
    qword_543358 = (uint64_t)objc_alloc_init((Class)NSMutableCharacterSet);
    objc_msgSend((id)qword_543358, "addCharactersInString:", CFSTR("%"));
  }
}

- (TCMessageEntry)initWithTag:(int)a3 affectedObject:(id)a4 text:(id)a5 parameters:(char *)a6
{
  TCMessageEntry *v9;
  TCMessageEntry *v10;
  char *v11;
  uint64_t v12;
  int v13;
  char *v14;
  char *v15;
  unsigned int v16;
  char *v17;
  NSArray *m_parameters;
  const __CFString *v19;
  NSArray *v20;
  char *v22;

  v9 = -[TCMessageEntry init](self, "init");
  v10 = v9;
  if (v9)
  {
    v9->m_tag = a3;
    v9->m_count = 1;
    -[TCMessageEntry addAffectedObject:](v9, "addAffectedObject:", a4);
    v22 = a6;
    v10->m_text = (NSString *)objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", a5, a6);
    objc_msgSend(a5, "length");
    v11 = (char *)objc_msgSend(a5, "rangeOfCharacterFromSet:", qword_543358);
    if (v11 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v13 = 0;
      do
      {
        v14 = &v11[v12];
        v15 = (char *)objc_msgSend(a5, "length", v22);
        v16 = objc_msgSend(a5, "characterAtIndex:", v14);
        if (v16 != 37)
        {
          if (v16 != 64)
            break;
          ++v13;
        }
        v11 = (char *)objc_msgSend(a5, "rangeOfCharacterFromSet:options:range:", qword_543358, 0, v14 + 1, v15 - (v14 + 1));
      }
      while (v11 != (char *)0x7FFFFFFFFFFFFFFFLL);
      if (v13 >= 1)
      {
        v10->m_parameters = (NSArray *)objc_alloc_init((Class)NSMutableArray);
        do
        {
          v17 = a6;
          a6 += 8;
          m_parameters = v10->m_parameters;
          if (*(_QWORD *)v17)
          {
            v19 = (const __CFString *)objc_msgSend(*(id *)v17, "description");
            v20 = m_parameters;
          }
          else
          {
            v20 = v10->m_parameters;
            v19 = CFSTR("(null)");
          }
          -[NSArray addObject:](v20, "addObject:", v19);
          --v13;
        }
        while (v13);
      }
    }
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TCMessageEntry;
  -[TCMessageEntry dealloc](&v3, "dealloc");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  unsigned int v6;
  NSArray *m_parameters;

  v5 = objc_opt_class(self);
  if (v5 == objc_opt_class(a3) && self->m_tag == *((_DWORD *)a3 + 4))
  {
    v6 = -[NSString isEqualToString:](self->m_text, "isEqualToString:", *((_QWORD *)a3 + 3));
    if (v6)
    {
      m_parameters = self->m_parameters;
      if (m_parameters == *((NSArray **)a3 + 4))
        LOBYTE(v6) = 1;
      else
        LOBYTE(v6) = -[NSArray isEqual:](m_parameters, "isEqual:");
    }
  }
  else
  {
    LOBYTE(v6) = 0;
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
  if (-[NSArray count](self->m_parameters, "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndex:](self->m_parameters, "objectAtIndex:", a3);
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
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ (%dx)"), self->m_text, m_count);
}

- (void)mergeEntries:(id)a3
{
  id v5;
  NSMutableArray *m_affectedObjects;

  self->m_count += objc_msgSend(a3, "getCount");
  v5 = objc_msgSend(a3, "affectedObjects");
  if (objc_msgSend(v5, "count"))
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      m_affectedObjects = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->m_affectedObjects = m_affectedObjects;
    }
    -[NSMutableArray addObjectsFromArray:](m_affectedObjects, "addObjectsFromArray:", v5);
  }
}

- (void)addAffectedObject:(id)a3
{
  NSMutableArray *m_affectedObjects;

  if (a3)
  {
    m_affectedObjects = self->m_affectedObjects;
    if (!m_affectedObjects)
    {
      m_affectedObjects = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      self->m_affectedObjects = m_affectedObjects;
    }
    -[NSMutableArray addObject:](m_affectedObjects, "addObject:", a3);
  }
}

- (unint64_t)timeStamp
{
  return self->m_timeStamp;
}

- (void)setTimeStamp:(unint64_t)a3
{
  self->m_timeStamp = a3;
}

@end
