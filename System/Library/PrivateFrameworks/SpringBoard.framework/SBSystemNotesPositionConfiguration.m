@implementation SBSystemNotesPositionConfiguration

- (SBSystemNotesPositionConfiguration)initWithEdgeProtectEnabled:(BOOL)a3 position:(unint64_t)a4
{
  SBSystemNotesPositionConfiguration *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSystemNotesPositionConfiguration;
  result = -[SBSystemNotesPositionConfiguration init](&v7, sel_init);
  if (result)
  {
    result->_edgeProtectEnabled = a3;
    result->_position = a4;
  }
  return result;
}

- (BOOL)edgeProtectEnabled
{
  return self->_edgeProtectEnabled;
}

- (void)setEdgeProtectEnabled:(BOOL)a3
{
  self->_edgeProtectEnabled = a3;
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

@end
