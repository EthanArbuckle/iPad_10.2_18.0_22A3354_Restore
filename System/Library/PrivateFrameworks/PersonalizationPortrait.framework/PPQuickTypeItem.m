@implementation PPQuickTypeItem

- (PPQuickTypeItem)initWithLabel:(id)a3 value:(id)a4 name:(id)a5 date:(id)a6 fields:(unsigned int)a7 originatingBundleID:(id)a8 originatingWebsiteURL:(id)a9 predictionAge:(unint64_t)a10 shouldAggregate:(BOOL)a11 flags:(unsigned __int8)a12 score:(double)a13 source:(unsigned __int8)a14 sourceIdentifier:(id)a15
{
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  PPQuickTypeItem *v27;
  PPQuickTypeItem *v28;
  id obj;
  id v31;
  id v33;
  id v34;
  objc_super v35;

  v22 = a3;
  v23 = a4;
  obj = a5;
  v24 = a5;
  v31 = a6;
  v34 = a6;
  v25 = a8;
  v26 = a9;
  v33 = a15;
  v35.receiver = self;
  v35.super_class = (Class)PPQuickTypeItem;
  v27 = -[PPQuickTypeItem init](&v35, sel_init);
  v28 = v27;
  if (v27)
  {
    objc_storeStrong((id *)&v27->_label, a3);
    objc_storeStrong((id *)&v28->_value, a4);
    objc_storeStrong((id *)&v28->_name, obj);
    objc_storeStrong((id *)&v28->_date, v31);
    v28->_fields = a7;
    objc_storeStrong((id *)&v28->_originatingBundleID, a8);
    objc_storeStrong((id *)&v28->_originatingWebsiteURL, a9);
    v28->_predictionAge = a10;
    v28->_shouldAggregate = a11;
    v28->_flags = a12;
    v28->_score = a13;
    v28->_source = a14;
    objc_storeStrong((id *)&v28->_sourceIdentifier, a15);
  }

  return v28;
}

- (id)description
{
  id v3;
  NSString *name;
  NSString *value;
  NSString *label;
  uint64_t fields;
  uint64_t flags;
  uint64_t v9;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  value = self->_value;
  name = self->_name;
  label = self->_label;
  fields = self->_fields;
  flags = self->_flags;
  -[PPQuickTypeItem score](self, "score");
  return (id)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPQuickTypeItem '%@' %@=%@ (f=%lu) (fl=%lu) (s=%f) (src=%lu)>"), name, label, value, fields, flags, v9, -[PPQuickTypeItem source](self, "source"));
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  uint64_t v12;
  unint64_t v13;

  v3 = self->_source - (unint64_t)self->_score + 32 * (unint64_t)self->_score;
  v4 = -[NSString hash](self->_sourceIdentifier, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_label, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_value, "hash") - v5 + 32 * v5;
  v7 = -[NSString hash](self->_name, "hash") - v6 + 32 * v6;
  v8 = -[NSDate hash](self->_date, "hash");
  v9 = self->_fields - (v8 - v7 + 32 * v7) + 32 * (v8 - v7 + 32 * v7);
  v10 = self->_flags - v9 + 32 * v9;
  v11 = -[NSString hash](self->_originatingBundleID, "hash") - v10 + 32 * v10;
  v12 = -[NSURL hash](self->_originatingWebsiteURL, "hash");
  v13 = self->_predictionAge - (v12 - v11 + 32 * v11) + 32 * (v12 - v11 + 32 * v11);
  return self->_shouldAggregate - v13 + 32 * v13;
}

- (PPQuickTypeItem)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  char v13;
  char v14;
  double v15;
  double v16;
  char v17;
  void *v18;
  PPQuickTypeItem *v19;
  uint64_t v21;
  void *v22;
  unsigned int v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("lab"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("val"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 1;
  if (v9)
  {
    pp_quicktype_log_handle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v4;
      _os_log_error_impl(&dword_18BE3A000, v10, OS_LOG_TYPE_ERROR, "failed to decode label or value from %@", buf, 0xCu);
    }

    v19 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("nam"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dat"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("fld"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("obi"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("owu"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("pag"));
    v13 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sag"));
    v14 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("flg"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("scr"));
    v16 = v15;
    v17 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("src"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("sid"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE2(v21) = v17;
    BYTE1(v21) = v14;
    LOBYTE(v21) = v13;
    self = -[PPQuickTypeItem initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:](self, "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v6, v8, v25, v24, v23, v22, v16, v11, v12, v21, v18);

    v19 = self;
  }

  return v19;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *label;
  id v5;

  label = self->_label;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", label, CFSTR("lab"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("val"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("nam"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_date, CFSTR("dat"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_fields, CFSTR("fld"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingBundleID, CFSTR("obi"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originatingWebsiteURL, CFSTR("owu"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_predictionAge, CFSTR("pag"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldAggregate, CFSTR("sag"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_flags, CFSTR("flg"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("scr"), self->_score);
  objc_msgSend(v5, "encodeInt32:forKey:", self->_source, CFSTR("src"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceIdentifier, CFSTR("sid"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  objc_opt_class();
  v5 = objc_opt_new();
  v6 = v5;
  if (v5)
  {
    *(_BYTE *)(v5 + 8) = self->_source;
    *(double *)(v5 + 16) = self->_score;
    v7 = -[NSString copyWithZone:](self->_sourceIdentifier, "copyWithZone:", a3);
    v8 = *(void **)(v6 + 24);
    *(_QWORD *)(v6 + 24) = v7;

    v9 = -[NSString copyWithZone:](self->_label, "copyWithZone:", a3);
    v10 = *(void **)(v6 + 32);
    *(_QWORD *)(v6 + 32) = v9;

    v11 = -[NSString copyWithZone:](self->_value, "copyWithZone:", a3);
    v12 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v11;

    v13 = -[NSString copyWithZone:](self->_name, "copyWithZone:", a3);
    v14 = *(void **)(v6 + 48);
    *(_QWORD *)(v6 + 48) = v13;

    v15 = -[NSDate copyWithZone:](self->_date, "copyWithZone:", a3);
    v16 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v15;

    *(_DWORD *)(v6 + 12) = self->_fields;
    *(_BYTE *)(v6 + 10) = self->_flags;
    v17 = -[NSString copyWithZone:](self->_originatingBundleID, "copyWithZone:", a3);
    v18 = *(void **)(v6 + 64);
    *(_QWORD *)(v6 + 64) = v17;

    v19 = -[NSURL copyWithZone:](self->_originatingWebsiteURL, "copyWithZone:", a3);
    v20 = *(void **)(v6 + 72);
    *(_QWORD *)(v6 + 72) = v19;

    *(_QWORD *)(v6 + 80) = self->_predictionAge;
    *(_BYTE *)(v6 + 9) = self->_shouldAggregate;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  PPQuickTypeItem *v4;
  PPQuickTypeItem *v5;
  BOOL v6;

  v4 = (PPQuickTypeItem *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPQuickTypeItem isEqualToQuickTypeItem:](self, "isEqualToQuickTypeItem:", v5);

  return v6;
}

- (BOOL)hasScoreSimilarToItem:(id)a3
{
  return vabdd_f64(self->_score, *((double *)a3 + 2)) < 0.000001;
}

- (BOOL)isEqualToQuickTypeItem:(id)a3
{
  id *v4;
  id *v5;
  NSString *label;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  NSString *value;
  NSString *v12;
  NSString *v13;
  NSString *v14;
  char v15;
  NSString *name;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSDate *date;
  NSDate *v22;
  NSDate *v23;
  NSDate *v24;
  char v25;
  NSString *originatingBundleID;
  NSString *v27;
  NSString *v28;
  NSString *v29;
  char v30;
  NSURL *originatingWebsiteURL;
  NSURL *v32;
  NSURL *v33;
  NSURL *v34;
  char v35;
  NSString *v36;
  NSString *v37;
  char v38;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4 || self->_score != *((double *)v4 + 2) || self->_source != *((unsigned __int8 *)v4 + 8))
    goto LABEL_34;
  label = self->_label;
  v7 = (NSString *)v4[4];
  if (label == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = label;
    v10 = -[NSString isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
LABEL_34:
      v38 = 0;
      goto LABEL_35;
    }
  }
  value = self->_value;
  v12 = (NSString *)v5[5];
  if (value == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = value;
    v15 = -[NSString isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_34;
  }
  name = self->_name;
  v17 = (NSString *)v5[6];
  if (name == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = name;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_34;
  }
  date = self->_date;
  v22 = (NSDate *)v5[7];
  if (date == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = date;
    v25 = -[NSDate isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
      goto LABEL_34;
  }
  if (self->_fields != *((_DWORD *)v5 + 3) || self->_flags != *((unsigned __int8 *)v5 + 10))
    goto LABEL_34;
  originatingBundleID = self->_originatingBundleID;
  v27 = (NSString *)v5[8];
  if (originatingBundleID == v27)
  {

  }
  else
  {
    v28 = v27;
    v29 = originatingBundleID;
    v30 = -[NSString isEqual:](v29, "isEqual:", v28);

    if ((v30 & 1) == 0)
      goto LABEL_34;
  }
  originatingWebsiteURL = self->_originatingWebsiteURL;
  v32 = (NSURL *)v5[9];
  if (originatingWebsiteURL == v32)
  {

  }
  else
  {
    v33 = v32;
    v34 = originatingWebsiteURL;
    v35 = -[NSURL isEqual:](v34, "isEqual:", v33);

    if ((v35 & 1) == 0)
      goto LABEL_34;
  }
  if ((id)self->_predictionAge != v5[10] || self->_shouldAggregate != *((unsigned __int8 *)v5 + 9))
    goto LABEL_34;
  v36 = self->_sourceIdentifier;
  v37 = v36;
  if (v36 == v5[3])
    v38 = 1;
  else
    v38 = -[NSString isEqual:](v36, "isEqual:");

LABEL_35:
  return v38;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double score;
  double v6;
  int64_t v7;
  NSString *label;
  void *v9;
  NSString *v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;
  NSString *value;
  void *v15;
  __CFString *sourceIdentifier;
  uint64_t v17;
  void *v18;
  const __CFString *v19;

  v4 = a3;
  score = self->_score;
  objc_msgSend(v4, "score");
  v7 = +[PPUtils compareDouble:withDouble:](PPUtils, "compareDouble:withDouble:", score, v6);
  if (!v7)
  {
    label = self->_label;
    objc_msgSend(v4, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[NSString compare:](label, "compare:", v9);

    if (!v7)
    {
      v10 = self->_name ? self->_name : (NSString *)&stru_1E226D4B0;
      objc_msgSend(v4, "name");
      v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
      v12 = (__CFString *)v11;
      v13 = v11 ? (__CFString *)v11 : &stru_1E226D4B0;
      v7 = -[NSString compare:](v10, "compare:", v13);

      if (!v7)
      {
        value = self->_value;
        objc_msgSend(v4, "value");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[NSString compare:](value, "compare:", v15);

        if (!v7)
        {
          if (self->_sourceIdentifier)
            sourceIdentifier = (__CFString *)self->_sourceIdentifier;
          else
            sourceIdentifier = &stru_1E226D4B0;
          objc_msgSend(v4, "sourceIdentifier");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = (void *)v17;
          if (v17)
            v19 = (const __CFString *)v17;
          else
            v19 = &stru_1E226D4B0;
          v7 = -[__CFString compare:](sourceIdentifier, "compare:", v19);

        }
      }
    }
  }

  return v7;
}

- (int64_t)reverseCompare:(id)a3
{
  return objc_msgSend(a3, "compare:", self);
}

- (double)score
{
  return self->_score;
}

- (void)setScore:(double)a3
{
  self->_score = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned __int8)a3
{
  self->_source = a3;
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unsigned)fields
{
  return self->_fields;
}

- (void)setFields:(unsigned int)a3
{
  self->_fields = a3;
}

- (NSString)originatingBundleID
{
  return self->_originatingBundleID;
}

- (void)setOriginatingBundleID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSURL)originatingWebsiteURL
{
  return self->_originatingWebsiteURL;
}

- (void)setOriginatingWebsiteURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (unint64_t)predictionAge
{
  return self->_predictionAge;
}

- (void)setPredictionAge:(unint64_t)a3
{
  self->_predictionAge = a3;
}

- (BOOL)shouldAggregate
{
  return self->_shouldAggregate;
}

- (void)setShouldAggregate:(BOOL)a3
{
  self->_shouldAggregate = a3;
}

- (unsigned)flags
{
  return self->_flags;
}

- (void)setFlags:(unsigned __int8)a3
{
  self->_flags = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingWebsiteURL, 0);
  objc_storeStrong((id *)&self->_originatingBundleID, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
}

+ (id)quickTypeItemWithLabel:(id)a3 value:(id)a4 name:(id)a5 date:(id)a6 fields:(unsigned int)a7 originatingBundleID:(id)a8 originatingWebsiteURL:(id)a9 predictionAge:(unint64_t)a10 shouldAggregate:(BOOL)a11 flags:(unsigned __int8)a12 score:(double)a13 source:(unsigned __int8)a14 sourceIdentifier:(id)a15
{
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  PPQuickTypeItem *v28;
  uint64_t v30;

  v21 = a15;
  v22 = a9;
  v23 = a8;
  v24 = a6;
  v25 = a5;
  v26 = a4;
  v27 = a3;
  BYTE2(v30) = a14;
  LOWORD(v30) = __PAIR16__(a12, a11);
  v28 = -[PPQuickTypeItem initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:]([PPQuickTypeItem alloc], "initWithLabel:value:name:date:fields:originatingBundleID:originatingWebsiteURL:predictionAge:shouldAggregate:flags:score:source:sourceIdentifier:", v27, v26, v25, v24, a7, v23, a13, v22, a10, v30, v21);

  return v28;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
