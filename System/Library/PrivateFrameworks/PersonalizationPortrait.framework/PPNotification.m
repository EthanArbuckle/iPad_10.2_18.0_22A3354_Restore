@implementation PPNotification

- (PPNotification)initWithCurrentDateAndBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  PPNotification *v15;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_new();
  v15 = -[PPNotification initWithBundleId:title:subtitle:message:date:](self, "initWithBundleId:title:subtitle:message:date:", v13, v12, v11, v10, v14);

  return v15;
}

- (PPNotification)initWithBundleId:(id)a3 title:(id)a4 subtitle:(id)a5 message:(id)a6 date:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PPNotification *v17;
  PPNotification *v18;
  void *v20;
  void *v21;
  void *v22;
  id v24;
  objc_super v25;

  v13 = a3;
  v24 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v13)
  {
    if (v15)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNotification.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("message"));

    if (v16)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNotification.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleId"));

  if (!v15)
    goto LABEL_8;
LABEL_3:
  if (v16)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPNotification.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date"));

LABEL_4:
  v25.receiver = self;
  v25.super_class = (Class)PPNotification;
  v17 = -[PPNotification init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_bundleId, a3);
    objc_storeStrong((id *)&v18->_title, a4);
    objc_storeStrong((id *)&v18->_subtitle, a5);
    objc_storeStrong((id *)&v18->_message, a6);
    objc_storeStrong((id *)&v18->_date, a7);
  }

  return v18;
}

- (PPNotification)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PPNotification *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tit"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sub"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && v8 && v9)
  {
    self = -[PPNotification initWithBundleId:title:subtitle:message:date:](self, "initWithBundleId:title:subtitle:message:date:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    pp_default_log_handle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_18BE3A000, v11, OS_LOG_TYPE_ERROR, "PPNotification:initWithCoder: decoded illegal nil property", v13, 2u);
    }

    v10 = 0;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *bundleId;
  id v5;

  bundleId = self->_bundleId;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", bundleId, CFSTR("bid"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("tit"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_subtitle, CFSTR("sub"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_message, CFSTR("mes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("date"));

}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSString hash](self->_bundleId, "hash");
  v4 = -[NSString hash](self->_title, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_subtitle, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_message, "hash") - v5 + 32 * v5;
  return -[NSDate hash](self->_date, "hash") - v6 + 32 * v6;
}

- (BOOL)isEqualToNotification:(id)a3
{
  PPNotification *v4;
  id *p_isa;
  NSDate *v6;
  unint64_t v7;
  void *v8;
  int v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v4 = (PPNotification *)a3;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else if (v4)
  {
    v6 = self->_bundleId;
    v7 = (unint64_t)p_isa[1];
    if (!((unint64_t)v6 | v7))
      goto LABEL_7;
    v8 = (void *)v7;
    LOBYTE(v9) = 0;
    if (!v6 || !v7)
      goto LABEL_29;
    v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v7);

    if (v9)
    {
LABEL_7:
      v6 = self->_title;
      v10 = (unint64_t)p_isa[2];
      if ((unint64_t)v6 | v10)
      {
        v8 = (void *)v10;
        LOBYTE(v9) = 0;
        if (!v6 || !v10)
          goto LABEL_29;
        v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v10);

        if (!v9)
          goto LABEL_30;
      }
      v6 = self->_subtitle;
      v11 = (unint64_t)p_isa[3];
      if ((unint64_t)v6 | v11)
      {
        v8 = (void *)v11;
        LOBYTE(v9) = 0;
        if (!v6 || !v11)
          goto LABEL_29;
        v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v11);

        if (!v9)
          goto LABEL_30;
      }
      v6 = self->_message;
      v12 = (unint64_t)p_isa[4];
      if (!((unint64_t)v6 | v12))
      {
LABEL_10:
        v6 = self->_date;
        v13 = (unint64_t)p_isa[5];
        if ((unint64_t)v6 | v13)
        {
          v8 = (void *)v13;
          LOBYTE(v9) = 0;
          if (v6 && v13)
            LOBYTE(v9) = -[NSDate isEqualToDate:](v6, "isEqualToDate:", v13);
        }
        else
        {
          v8 = 0;
          v6 = 0;
          LOBYTE(v9) = 1;
        }
        goto LABEL_29;
      }
      v8 = (void *)v12;
      LOBYTE(v9) = 0;
      if (v6 && v12)
      {
        v9 = -[NSDate isEqualToString:](v6, "isEqualToString:", v12);

        if (!v9)
          goto LABEL_30;
        goto LABEL_10;
      }
LABEL_29:

    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_30:

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  PPNotification *v4;
  BOOL v5;

  v4 = (PPNotification *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PPNotification isEqualToNotification:](self, "isEqualToNotification:", v4);
  }

  return v5;
}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<PPNotification: bundleId: %@ title.length: %tu subtitle.length %tu message.length: %tu>"), self->_bundleId, -[NSString length](self->_title, "length"), -[NSString length](self->_subtitle, "length"), -[NSString length](self->_message, "length"));
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (NSString)message
{
  return self->_message;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
