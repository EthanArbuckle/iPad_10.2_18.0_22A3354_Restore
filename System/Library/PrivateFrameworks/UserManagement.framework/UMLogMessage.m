@implementation UMLogMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateStrings, 0);
  objc_storeStrong((id *)&self->_publicStrings, 0);
}

- (UMLogMessage)init
{
  UMLogMessage *v2;
  uint64_t v3;
  NSMutableArray *publicStrings;
  uint64_t v5;
  NSMutableArray *privateStrings;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UMLogMessage;
  v2 = -[UMLogMessage init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    publicStrings = v2->_publicStrings;
    v2->_publicStrings = (NSMutableArray *)v3;

    v5 = objc_opt_new();
    privateStrings = v2->_privateStrings;
    v2->_privateStrings = (NSMutableArray *)v5;

  }
  return v2;
}

@end
