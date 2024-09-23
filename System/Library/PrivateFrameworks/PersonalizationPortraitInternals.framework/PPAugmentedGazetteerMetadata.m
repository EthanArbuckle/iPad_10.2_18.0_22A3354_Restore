@implementation PPAugmentedGazetteerMetadata

- (PPAugmentedGazetteerMetadata)initWithStatement:(id)a3
{
  id v4;
  PPAugmentedGazetteerMetadata *v5;
  void *v6;
  unint64_t v7;
  uint64_t v8;
  NSString *qid;
  uint64_t v10;
  NSString *category;
  uint64_t v12;
  NSString *alias;
  void *v14;
  PPAugmentedGazetteerMetadata *v15;
  NSObject *v16;
  const char *v17;
  uint8_t buf[16];
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PPAugmentedGazetteerMetadata;
  v5 = -[PPAugmentedGazetteerMetadata init](&v20, sel_init);
  if (!v5)
    goto LABEL_5;
  v6 = (void *)MEMORY[0x1C3BD6630]();
  v7 = objc_msgSend(v4, "getInt64ForColumnName:table:", "qid", "metadata");
  if (HIDWORD(v7))
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
LABEL_9:

      objc_autoreleasePoolPop(v6);
      v15 = 0;
      goto LABEL_10;
    }
    *(_WORD *)buf = 0;
    v17 = "Augmented gazetteer qid was not a valid uint32_t value";
LABEL_12:
    _os_log_fault_impl(&dword_1C392E000, v16, OS_LOG_TYPE_FAULT, v17, buf, 2u);
    goto LABEL_9;
  }
  if (!(_DWORD)v7)
  {
    pp_default_log_handle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v17 = "Invalid augmented gazetteer qid of 0 detected";
    goto LABEL_12;
  }
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Q%u"), v7);
  qid = v5->_qid;
  v5->_qid = (NSString *)v8;

  v5->_threshold = (double)objc_msgSend(v4, "getInt64ForColumnName:table:", "threshold", "metadata") * 0.125;
  objc_msgSend(v4, "getNSStringForColumnName:table:", "category", "metadata");
  v10 = objc_claimAutoreleasedReturnValue();
  category = v5->_category;
  v5->_category = (NSString *)v10;

  v5->_gazetteerDomain = objc_msgSend(v4, "getInt64ForColumnName:table:", "gazetteerDomain", "metadata");
  objc_msgSend(v4, "getNSStringForColumnName:table:", "alias", "metadata");
  v12 = objc_claimAutoreleasedReturnValue();
  alias = v5->_alias;
  v5->_alias = (NSString *)v12;

  objc_msgSend(v4, "getInt64AsNSNumberForColumnName:table:", "isLocation", "metadata");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v5->_isLocation = objc_msgSend(v14, "BOOLValue");

  objc_autoreleasePoolPop(v6);
LABEL_5:
  v15 = v5;
LABEL_10:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_category, 0);
  objc_storeStrong((id *)&self->_qid, 0);
}

@end
