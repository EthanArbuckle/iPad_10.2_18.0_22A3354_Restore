@implementation PBMessageStreamReader

- (PBMessageStreamReader)initWithStream:(id)a3
{
  id v5;
  PBMessageStreamReader *v6;
  PBMessageStreamReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PBMessageStreamReader;
  v6 = -[PBMessageStreamReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_stream, a3);

  return v7;
}

- (id)nextMessage
{
  unint64_t v3;
  int v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v12;
  void *v13;
  NSInputStream *stream;
  id v15;
  PBDataReader *v16;
  id v17;
  _BYTE v18[11];
  uint64_t v19;

  v3 = 0;
  v19 = *MEMORY[0x1E0C80C00];
  v18[0] = 0;
  while (-[NSInputStream read:maxLength:](self->_stream, "read:maxLength:", v18, 1) == 1)
  {
    v4 = v18[0];
    v18[v3 + 1] = v18[0];
    v5 = v3 + 1;
    if (v4 < 0 && v3++ < 9)
      continue;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    while (v5 != v8)
    {
      v9 |= (unint64_t)(v18[v8 + 1] & 0x7F) << v7;
      if ((v18[v8 + 1] & 0x80) == 0)
      {
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v9);
        v13 = v12;
        if (v12
          && objc_msgSend(v12, "length") == v9
          && (stream = self->_stream,
              v15 = objc_retainAutorelease(v13),
              -[NSInputStream read:maxLength:](stream, "read:maxLength:", objc_msgSend(v15, "mutableBytes"), v9) == v9))
        {
          self->_position += v9 + v5;
          v16 = -[PBDataReader initWithData:]([PBDataReader alloc], "initWithData:", v15);
          if (-[PBMessageStreamReader classOfNextMessage](self, "classOfNextMessage"))
          {
            v17 = objc_alloc_init(-[PBMessageStreamReader classOfNextMessage](self, "classOfNextMessage"));
            v10 = v17;
            if (v17)
              objc_msgSend(v17, "readFrom:", v16);
          }
          else
          {
            v10 = 0;
          }

        }
        else
        {
          v10 = 0;
        }

        return v10;
      }
      ++v8;
      v7 += 7;
      if (v7 == 70)
        return 0;
    }
    return 0;
  }
  return 0;
}

- (Class)classOfNextMessage
{
  return self->_classOfNextMessage;
}

- (void)setClassOfNextMessage:(Class)a3
{
  self->_classOfNextMessage = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream, 0);
}

@end
