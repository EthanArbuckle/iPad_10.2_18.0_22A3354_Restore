@implementation WFWorkflowCreationOptions

- (WFWorkflowCreationOptions)init
{
  return -[WFWorkflowCreationOptions initWithRecord:](self, "initWithRecord:", 0);
}

- (WFWorkflowCreationOptions)initWithRecord:(id)a3
{
  id v4;
  WFWorkflowCreationOptions *v5;
  WFWorkflowRecord *v6;
  WFWorkflowRecord *record;
  WFWorkflowCreationOptions *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFWorkflowCreationOptions;
  v5 = -[WFWorkflowCreationOptions init](&v10, sel_init);
  if (v5)
  {
    if (v4)
      v6 = (WFWorkflowRecord *)v4;
    else
      v6 = (WFWorkflowRecord *)objc_opt_new();
    record = v5->_record;
    v5->_record = v6;

    v5->_location = 0x7FFFFFFFFFFFFFFFLL;
    v8 = v5;
  }

  return v5;
}

- (WFWorkflowRecord)record
{
  return self->_record;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)location
{
  return self->_location;
}

- (void)setLocation:(unint64_t)a3
{
  self->_location = a3;
}

- (BOOL)deleted
{
  return self->_deleted;
}

- (void)setDeleted:(BOOL)a3
{
  self->_deleted = a3;
}

- (NSString)collectionIdentifier
{
  return self->_collectionIdentifier;
}

- (void)setCollectionIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_record, 0);
}

@end
