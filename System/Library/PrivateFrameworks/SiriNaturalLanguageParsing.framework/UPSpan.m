@implementation UPSpan

- (UPSpan)initWithRange:(_NSRange)a3 type:(unint64_t)a4 category:(id)a5 sharedEntityGraph:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  UPSpan *v14;
  UPSpan *v15;
  objc_super v17;

  length = a3.length;
  location = a3.location;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)UPSpan;
  v14 = -[UPSpan init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_range.location = location;
    v14->_range.length = length;
    v14->_type = a4;
    objc_storeStrong((id *)&v14->_category, a5);
    objc_storeStrong((id *)&v15->_sharedEntityGraph, a6);
  }

  return v15;
}

- (UPSpan)initWithRange:(_NSRange)a3 type:(unint64_t)a4 category:(id)a5
{
  return -[UPSpan initWithRange:type:category:sharedEntityGraph:](self, "initWithRange:type:category:sharedEntityGraph:", a3.location, a3.length, a4, a5, 0);
}

- (UPSpan)initWithProtobufSpan:(id)a3 nonWhitespaceTokenIndexes:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  UPSpan *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t *v26;
  void *v27;
  uint8_t buf[4];
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "hasStartTokenIndex") && (objc_msgSend(v8, "hasEndTokenIndex") & 1) != 0)
  {
    v10 = objc_msgSend(v8, "startTokenIndex");
    if (v10 >= objc_msgSend(v8, "endTokenIndex"))
    {
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid span: start token index (%u) >= end token index (%u)"), objc_msgSend(v8, "startTokenIndex"), objc_msgSend(v8, "endTokenIndex"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v39 = *MEMORY[0x1E0CB2D50];
        v40 = v19;
        v24 = (void *)MEMORY[0x1E0C99D80];
        v25 = &v40;
        v26 = &v39;
LABEL_15:
        objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 10, v27);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

        v21 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      v11 = +[UPSpan _getSpanTypeFromProtobufSpan:](UPSpan, "_getSpanTypeFromProtobufSpan:", v8);
      v12 = objc_msgSend(v8, "startTokenIndex");
      v13 = objc_msgSend(v8, "endTokenIndex");
      if (objc_msgSend(v9, "containsIndex:", v12))
      {
        v14 = (v13 - 1);
        if ((objc_msgSend(v9, "containsIndex:", v14) & 1) != 0)
        {
          v15 = objc_msgSend(v9, "countOfIndexesInRange:", 0, v12);
          v16 = objc_msgSend(v9, "countOfIndexesInRange:", 0, v14 + 1);
          SNLPOSLoggerForCategory(3);
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 67109888;
            v30 = objc_msgSend(v8, "startTokenIndex");
            v31 = 1024;
            v32 = objc_msgSend(v8, "endTokenIndex");
            v33 = 2048;
            v34 = v15;
            v35 = 2048;
            v36 = v16;
            _os_log_impl(&dword_1C2196000, v17, OS_LOG_TYPE_DEBUG, "Converted protobuf token indexes (%u -> %u) to non-whitespace token indexes (%lu -> %lu)", buf, 0x22u);
          }

          v18 = v16 - v15;
          objc_msgSend(v8, "label");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "usoGraph");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          self = -[UPSpan initWithRange:type:category:sharedEntityGraph:](self, "initWithRange:type:category:sharedEntityGraph:", v15, v18, v11, v19, v20);

          v21 = self;
          goto LABEL_16;
        }
      }
      if (a5)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Warning: discarding data detector matching span not aligned with non-whitespace tokens (%u -> %u)"), objc_msgSend(v8, "startTokenIndex"), objc_msgSend(v8, "endTokenIndex"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)MEMORY[0x1E0CB35C8];
        v37 = *MEMORY[0x1E0CB2D50];
        v38 = v19;
        v24 = (void *)MEMORY[0x1E0C99D80];
        v25 = &v38;
        v26 = &v37;
        goto LABEL_15;
      }
    }
LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  if (!a5)
    goto LABEL_17;
  v22 = (void *)MEMORY[0x1E0CB35C8];
  v41 = *MEMORY[0x1E0CB2D50];
  v42[0] = CFSTR("protobuf message is missing a start/end index");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, &v41, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.uaapcustomluframework"), 10, v19);
  v21 = 0;
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

LABEL_18:
  return v21;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  NSRange v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v9.location = -[UPSpan range](self, "range");
  NSStringFromRange(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[UPSpan type](self, "type");
  -[UPSpan category](self, "category");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("{UPSpan range: %@ ; type: %lu ; category: %@}"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSString)category
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (SIRINLUEXTERNALUsoGraph)sharedEntityGraph
{
  return self->_sharedEntityGraph;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedEntityGraph, 0);
  objc_storeStrong((id *)&self->_category, 0);
}

+ (unint64_t)_getSpanTypeFromProtobufSpan:(id)a3
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  int v6;
  int v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  if (!objc_msgSend(v3, "matcherNamesCount"))
  {
    SNLPOSLoggerForCategory(3);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C2196000, v4, OS_LOG_TYPE_DEBUG, "No matcher names provided - type property will be UPSpanTypeNone", buf, 2u);
    }

  }
  if (objc_msgSend(v3, "matcherNamesCount"))
  {
    v5 = 1;
    do
    {
      v6 = objc_msgSend(v3, "matcherNamesAtIndex:", v5 - 1);
      if (v6)
      {
        if (v6 == 2)
        {
          v7 = 0;
          v8 = 4;
        }
        else
        {
          SNLPOSLoggerForCategory(3);
          v9 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v13 = 0;
            _os_log_impl(&dword_1C2196000, v9, OS_LOG_TYPE_ERROR, "Span not recognized by the span matchers - type property will be UPSpanTypeNone", v13, 2u);
          }

          v8 = 0;
          v7 = 1;
        }
      }
      else
      {
        v7 = 0;
        v8 = 2;
      }
      v10 = objc_msgSend(v3, "matcherNamesCount");
      if (!v7)
        break;
    }
    while (v10 > v5++);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
