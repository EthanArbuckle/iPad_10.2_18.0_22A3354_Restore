@implementation BKBookletMigrationDownloadFlowState

- (BKBookletMigrationDownloadFlowState)initWithStage:(unint64_t)a3
{
  BKBookletMigrationDownloadFlowState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKBookletMigrationDownloadFlowState;
  result = -[BKBookletMigrationDownloadFlowState init](&v5, "init");
  if (result)
    result->_stage = a3;
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), -[BKBookletMigrationDownloadFlowState stage](self, "stage"));
}

- (unint64_t)stage
{
  return self->_stage;
}

- (void)setStage:(unint64_t)a3
{
  self->_stage = a3;
}

@end
