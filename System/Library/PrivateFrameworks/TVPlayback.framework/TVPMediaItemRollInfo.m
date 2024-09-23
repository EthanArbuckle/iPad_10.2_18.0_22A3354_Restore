@implementation TVPMediaItemRollInfo

- (TVPMediaItemRollInfo)initWithType:(unint64_t)a3 start:(double)a4 duration:(double)a5
{
  TVPMediaItemRollInfo *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVPMediaItemRollInfo;
  result = -[TVPMediaItemRollInfo init](&v9, sel_init);
  if (result)
  {
    result->_type = a3;
    result->_start = a4;
    result->_duration = a5;
  }
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[TVPMediaItemRollInfo _typeDescription](self, "_typeDescription");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (self->_skippable)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("type - %@, start - %f, duration - %f, adamID - %@, skippable - %@"), v4, *(_QWORD *)&self->_start, *(_QWORD *)&self->_duration, self->_adamID, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_typeDescription
{
  unint64_t v2;

  v2 = -[TVPMediaItemRollInfo type](self, "type");
  if (v2 - 1 > 2)
    return 0;
  else
    return off_24F15D820[v2 - 1];
}

- (unint64_t)type
{
  return self->_type;
}

- (double)start
{
  return self->_start;
}

- (double)duration
{
  return self->_duration;
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (BOOL)isSkippable
{
  return self->_skippable;
}

- (void)setSkippable:(BOOL)a3
{
  self->_skippable = a3;
}

- (NSString)dynamicSlotDataSetId
{
  return self->_dynamicSlotDataSetId;
}

- (void)setDynamicSlotDataSetId:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicSlotDataSetId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dynamicSlotDataSetId, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
}

@end
