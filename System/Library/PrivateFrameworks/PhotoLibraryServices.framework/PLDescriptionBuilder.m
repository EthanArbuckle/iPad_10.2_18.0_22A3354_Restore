@implementation PLDescriptionBuilder

- (PLDescriptionBuilder)initWithObject:(id)a3 style:(int64_t)a4 indent:(int64_t)a5
{
  id v9;
  PLDescriptionBuilder *v10;
  PLDescriptionBuilder *v11;
  NSMutableString *v12;
  NSMutableString *description;
  uint64_t v14;
  _PLDescriptionStyle *style;
  void *v16;
  uint64_t v17;
  NSString *indentString;
  void *v19;
  uint64_t v20;
  NSString *separator;
  PLDescriptionBuilder *v22;
  objc_super v24;

  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLDescriptionBuilder;
  v10 = -[PLDescriptionBuilder init](&v24, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_object, a3);
    v12 = (NSMutableString *)objc_alloc_init(MEMORY[0x1E0CB37A0]);
    description = v11->_description;
    v11->_description = v12;

    +[_PLDescriptionStyle styleForEnum:](_PLDescriptionStyle, "styleForEnum:", a4);
    v14 = objc_claimAutoreleasedReturnValue();
    style = v11->_style;
    v11->_style = (_PLDescriptionStyle *)v14;

    v11->_descriptionStyle = a4;
    v11->_indent = a5;
    -[_PLDescriptionStyle extraIndent](v11->_style, "extraIndent");
    PLIndentToString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    indentString = v11->_indentString;
    v11->_indentString = (NSString *)v17;

    if (a4 == 3 || !a4)
      -[NSMutableString appendFormat:](v11->_description, "appendFormat:", CFSTR("<%@: %p"), objc_opt_class(), v11->_object);
    -[_PLDescriptionStyle initialFieldSeparator](v11->_style, "initialFieldSeparator");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    separator = v11->_separator;
    v11->_separator = (NSString *)v20;

    v22 = v11;
  }

  return v11;
}

- (int64_t)style
{
  return self->_descriptionStyle;
}

- (int64_t)indent
{
  return self->_indent;
}

- (void)appendName:(id)a3 object:(id)a4
{
  NSMutableString *description;
  NSString *separator;
  _PLDescriptionStyle *style;
  NSString *indentString;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  description = self->_description;
  separator = self->_separator;
  indentString = self->_indentString;
  style = self->_style;
  v10 = a4;
  v11 = a3;
  -[_PLDescriptionStyle nameValueSeparator](style, "nameValueSeparator");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PLDescriptionStyle descriptionForObject:withIndent:](self->_style, "descriptionForObject:withIndent:", v10, self->_indent + 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableString appendFormat:](description, "appendFormat:", CFSTR("%@%@%@%@%@"), separator, indentString, v11, v12, v13);
  -[_PLDescriptionStyle fieldSeparator](self->_style, "fieldSeparator");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder setSeparator:](self, "setSeparator:", v14);

}

- (void)appendName:(id)a3 BOOLValue:(BOOL)a4
{
  const __CFString *v4;

  if (a4)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  -[PLDescriptionBuilder appendName:object:](self, "appendName:object:", a3, v4);
}

- (void)appendName:(id)a3 integerValue:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%ld"), a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](self, "appendName:object:", v7, v8);

}

- (void)appendName:(id)a3 unsignedIntegerValue:(unint64_t)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%lu"), a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](self, "appendName:object:", v7, v8);

}

- (void)appendName:(id)a3 floatValue:(float)a4
{
  void *v5;
  double v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%f"), *(_QWORD *)&v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](self, "appendName:object:", v7, v8);

}

- (void)appendName:(id)a3 doubleValue:(double)a4
{
  void *v6;
  id v7;
  id v8;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%lf"), *(_QWORD *)&a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](self, "appendName:object:", v7, v8);

}

- (void)appendName:(id)a3 cgSize:(CGSize)a4
{
  CGFloat height;
  CGFloat width;
  id v7;
  id v8;
  NSSize v9;

  height = a4.height;
  width = a4.width;
  v7 = a3;
  v9.width = width;
  v9.height = height;
  NSStringFromSize(v9);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](self, "appendName:object:", v7, v8);

}

- (void)appendName:(id)a3 typeCode:(const char *)a4 value:(const void *)a5
{
  id v8;
  void *v9;
  _QWORD v10[5];

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__PLDescriptionBuilder_appendName_typeCode_value___block_invoke;
  v10[3] = &unk_1E36678C8;
  v10[4] = self;
  v8 = a3;
  _PLToStringFromTypeAndValueWithDescriptionBlock(a4, (NSRect *)a5, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLDescriptionBuilder appendName:object:](self, "appendName:object:", v8, v9);

}

- (id)build
{
  NSMutableString *description;
  void *v4;
  NSMutableString *v5;
  void *v6;

  if (-[_PLDescriptionStyle prettyPrint](self->_style, "prettyPrint"))
    -[NSMutableString appendString:](self->_description, "appendString:", CFSTR("\n"));
  description = self->_description;
  PLIndentToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendString:](description, "appendString:", v4);

  v5 = self->_description;
  -[_PLDescriptionStyle suffix](self->_style, "suffix");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableString appendString:](v5, "appendString:", v6);

  return (id)-[NSMutableString copy](self->_description, "copy");
}

- (NSString)separator
{
  return self->_separator;
}

- (void)setSeparator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_indentString, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_object, 0);
}

uint64_t __50__PLDescriptionBuilder_appendName_typeCode_value___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "descriptionForObject:withIndent:", a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) + 1);
}

+ (id)descriptionBuilderWithObject:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:style:indent:", v4, 0, 0);

  return v5;
}

+ (id)plainDescriptionBuilder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithObject:style:indent:", 0, 1, 0);
}

+ (id)plainMultiLineDescriptionBuilder
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithObject:style:indent:", 0, 2, 0);
}

+ (id)prettyMultiLineDescriptionBuilderWithObject:(id)a3 indent:(int64_t)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithObject:style:indent:", v6, 3, a4);

  return v7;
}

@end
