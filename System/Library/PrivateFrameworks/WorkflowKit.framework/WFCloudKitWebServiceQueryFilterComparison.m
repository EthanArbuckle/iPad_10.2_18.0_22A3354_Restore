@implementation WFCloudKitWebServiceQueryFilterComparison

- (id)stringRepresentationWithRecordType:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  -[WFCloudKitWebServiceQueryFilterComparison recordKey](self, "recordKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFCloudKitWebServiceQueryFilterComparison value](self, "value");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[WFCloudKitWebServiceQueryFilterComparison type](self, "type"))
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ = %@"), v7, v8);
      goto LABEL_4;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ IN (%@)"), v7, v8);
LABEL_4:
      self = (WFCloudKitWebServiceQueryFilterComparison *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      v9 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("tokenize_set(%@, %@)"), v7, v10);
      goto LABEL_8;
    case 3uLL:
      v11 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("tokenize_phrase(%@, %@)"), v7, v10);
      goto LABEL_8;
    case 4uLL:
      v12 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v8, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("prefix(%@, %@)"), v7, v10);
LABEL_8:
      self = (WFCloudKitWebServiceQueryFilterComparison *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      break;
  }

  return self;
}

- (NSString)recordKey
{
  return self->_recordKey;
}

- (void)setRecordKey:(id)a3
{
  objc_storeStrong((id *)&self->_recordKey, a3);
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_recordKey, 0);
}

@end
