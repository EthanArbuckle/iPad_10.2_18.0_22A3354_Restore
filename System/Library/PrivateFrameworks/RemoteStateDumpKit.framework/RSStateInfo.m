@implementation RSStateInfo

- (RSStateInfo)initWithType:(unint64_t)a3 revision:(int64_t)a4
{
  RSStateInfo *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RSStateInfo;
  result = -[RSStateInfo init](&v7, sel_init);
  if (result)
  {
    result->_stateType = a3;
    result->_actionRevision = a4;
  }
  return result;
}

- (unint64_t)stateType
{
  return self->_stateType;
}

- (void)setStateType:(unint64_t)a3
{
  self->_stateType = a3;
}

- (int64_t)actionRevision
{
  return self->_actionRevision;
}

- (void)setActionRevision:(int64_t)a3
{
  self->_actionRevision = a3;
}

@end
