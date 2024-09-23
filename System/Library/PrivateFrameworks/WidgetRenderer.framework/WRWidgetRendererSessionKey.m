@implementation WRWidgetRendererSessionKey

- (CHSWidget)widget
{
  return self->_widget;
}

- (CHSWidgetMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)isEqual:(id)a3
{
  WRWidgetRendererSessionKey *v4;
  WRWidgetRendererSessionKey *v5;
  CHSWidget *widget;
  void *v7;
  CHSWidgetMetrics *metrics;
  void *v9;
  NSString *identifier;
  void *v11;
  char v12;

  v4 = (WRWidgetRendererSessionKey *)a3;
  if (self == v4)
  {
    v12 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      widget = self->_widget;
      -[WRWidgetRendererSessionKey widget](v5, "widget");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[CHSWidget isEqual:](widget, "isEqual:", v7))
      {
        metrics = self->_metrics;
        -[WRWidgetRendererSessionKey metrics](v5, "metrics");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[CHSWidgetMetrics isEqual:](metrics, "isEqual:", v9))
        {
          identifier = self->_identifier;
          -[WRWidgetRendererSessionKey identifier](v5, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = -[NSString isEqual:](identifier, "isEqual:", v11);

        }
        else
        {
          v12 = 0;
        }

      }
      else
      {
        v12 = 0;
      }

    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (WRWidgetRendererSessionKey)initWithBSXPCCoder:(id)a3
{
  id v4;
  WRWidgetRendererSessionKey *v5;
  void *v6;
  void *v7;
  void *v8;
  NSString *identifier;
  id v10;
  CHSWidget *widget;
  id v12;
  CHSWidgetMetrics *metrics;
  WRWidgetRendererSessionKey *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)WRWidgetRendererSessionKey;
  v5 = -[WRWidgetRendererSessionKey init](&v16, sel_init);
  if (!v5)
    goto LABEL_7;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeStringForKey:", CFSTR("identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8 || !v6 || !v7)
  {

LABEL_7:
    v14 = 0;
    goto LABEL_8;
  }
  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v8;
  v10 = v8;

  widget = v5->_widget;
  v5->_widget = (CHSWidget *)v6;
  v12 = v6;

  metrics = v5->_metrics;
  v5->_metrics = (CHSWidgetMetrics *)v7;

  v14 = v5;
LABEL_8:

  return v14;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = -[CHSWidget hash](self->_widget, "hash") + v3;
  return v4 + -[CHSWidgetMetrics hash](self->_metrics, "hash");
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_widget, CFSTR("widget"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metrics, CFSTR("metrics"));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_widget, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (WRWidgetRendererSessionKey)initWithIdentifier:(id)a3 widget:(id)a4 metrics:(id)a5
{
  id v9;
  id v10;
  id v11;
  WRWidgetRendererSessionKey *v12;
  WRWidgetRendererSessionKey *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WRWidgetRendererSessionKey;
  v12 = -[WRWidgetRendererSessionKey init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_widget, a4);
    objc_storeStrong((id *)&v13->_metrics, a5);
    objc_storeStrong((id *)&v13->_identifier, a3);
  }

  return v13;
}

- (NSString)description
{
  void *v2;
  NSString *identifier;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  identifier = self->_identifier;
  -[CHSWidget _loggingIdentifierWithMetrics:](self->_widget, "_loggingIdentifierWithMetrics:", self->_metrics);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<%@-%@>"), identifier, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_widget, CFSTR("widget"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_metrics, CFSTR("metrics"));

}

- (WRWidgetRendererSessionKey)initWithCoder:(id)a3
{
  id v4;
  WRWidgetRendererSessionKey *v5;
  void *v6;
  void *v7;
  CHSWidgetMetrics *v8;
  CHSWidgetMetrics *v9;
  BOOL v10;
  CHSWidget *widget;
  id v13;
  CHSWidgetMetrics *metrics;
  CHSWidgetMetrics *v15;
  NSString *identifier;
  WRWidgetRendererSessionKey *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)WRWidgetRendererSessionKey;
  v5 = -[WRWidgetRendererSessionKey init](&v19, sel_init);
  if (!v5)
    goto LABEL_11;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("widget"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("metrics"));
  v8 = (CHSWidgetMetrics *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (v10 || v8 == 0)
  {

LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  widget = v5->_widget;
  v5->_widget = (CHSWidget *)v7;
  v13 = v7;

  metrics = v5->_metrics;
  v5->_metrics = v9;
  v15 = v9;

  identifier = v5->_identifier;
  v5->_identifier = (NSString *)v6;

  v17 = v5;
LABEL_12:

  return v17;
}

@end
