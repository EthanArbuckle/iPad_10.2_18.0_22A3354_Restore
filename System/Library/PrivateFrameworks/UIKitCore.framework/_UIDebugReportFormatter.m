@implementation _UIDebugReportFormatter

+ (id)defaultFormatter
{
  return objc_alloc_init((Class)a1);
}

- (_UIDebugReportFormatter)init
{
  _UIDebugReportFormatter *v2;
  _UIDebugReportFormatter *v3;
  NSString *indentString;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIDebugReportFormatter;
  v2 = -[_UIDebugReportFormatter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    indentString = v2->_indentString;
    v2->_indentString = (NSString *)CFSTR("\t");

  }
  return v3;
}

- (id)stringFromReportComponents:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t extraBodyIndentLevel;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t indentLevel;
  void *v15;
  void *v16;
  void *v18;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIDebugReport.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("components"));

  }
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "header");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", &stru_1E16EDF20) & 1) == 0)
    objc_msgSend(v6, "appendFormat:", CFSTR("%@\n"), v7);
  objc_msgSend(v5, "body");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", &stru_1E16EDF20) & 1) == 0)
  {
    extraBodyIndentLevel = self->_extraBodyIndentLevel;
    if (extraBodyIndentLevel)
    {
      v10 = (void *)objc_msgSend(v8, "mutableCopy");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%*s"), extraBodyIndentLevel, "\t");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), v12, 0, 0, objc_msgSend(v8, "length"));

      objc_msgSend(v10, "insertString:atIndex:", v11, 0);
      v8 = v10;
    }
    objc_msgSend(v6, "appendString:", v8);
  }
  objc_msgSend(v5, "footer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v13, "isEqualToString:", &stru_1E16EDF20) & 1) == 0)
    objc_msgSend(v6, "appendFormat:", CFSTR("\n%@"), v13);
  indentLevel = self->_indentLevel;
  if (indentLevel)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%*s"), indentLevel, -[NSString UTF8String](objc_retainAutorelease(self->_indentString), "UTF8String"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\n%@"), v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", CFSTR("\n"), v16, 0, 0, objc_msgSend(v6, "length"));

    objc_msgSend(v6, "insertString:atIndex:", v15, 0);
  }

  return v6;
}

- (unint64_t)indentLevel
{
  return self->_indentLevel;
}

- (void)setIndentLevel:(unint64_t)a3
{
  self->_indentLevel = a3;
}

- (NSString)indentString
{
  return self->_indentString;
}

- (void)setIndentString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)extraBodyIndentLevel
{
  return self->_extraBodyIndentLevel;
}

- (void)setExtraBodyIndentLevel:(unint64_t)a3
{
  self->_extraBodyIndentLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indentString, 0);
}

@end
