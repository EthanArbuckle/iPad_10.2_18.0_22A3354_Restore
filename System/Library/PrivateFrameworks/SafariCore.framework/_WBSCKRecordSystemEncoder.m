@implementation _WBSCKRecordSystemEncoder

- (_WBSCKRecordSystemEncoder)initWithRecord:(id)a3
{
  id v4;
  _WBSCKRecordSystemEncoder *v5;
  _WBSCKRecordSystemEncoder *v6;
  _WBSCKRecordSystemEncoder *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WBSCKRecordSystemEncoder;
  v5 = -[_WBSCKRecordSystemEncoder init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_record, v4);
    v7 = v6;
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_WBSCKRecordSystemEncoder)initWithCoder:(id)a3
{
  return -[_WBSCKRecordSystemEncoder initWithRecord:](self, "initWithRecord:", 0);
}

- (Class)classForCoder
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_record);
  objc_opt_class();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v3;
}

- (void)encodeWithCoder:(id)a3
{
  CKRecord **p_record;
  id v4;
  id WeakRetained;

  p_record = &self->_record;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_record);
  objc_msgSend(WeakRetained, "encodeSystemFieldsWithCoder:", v4);

}

- (CKRecord)record
{
  return (CKRecord *)objc_loadWeakRetained((id *)&self->_record);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_record);
}

@end
